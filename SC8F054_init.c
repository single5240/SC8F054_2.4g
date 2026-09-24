#include <sc.h>					
#include "SC8F054_define.h"	
#include "SC8F054_var.h"	
#include "xl2400t.h"


KEY_CONTROL 		 key_control 		  = {0,0,0,0,0,0,0,0,0};
LED_CONTROL 		 led_control 		  = {1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,ADD_DAT};
SOFT_RECIEVE_CONTROL soft_recieve_control = {0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0};
SLEEP_CONTROL        sleep_control        = {1,0,0};

void Init_System(void)
{
	asm("nop");
	OSCCON     = 0x70;	   // 16 MHz INTOSC as system clock; enable WDT in SW if CONFIG disables it
	OPTION_REG = 0x00;	   // TIMER0: 1:2 prescale

	WPUA    = 0B00000000;  // PORTA weak-pull / direction setup
	WPDA    = 0B00000000;  
	ODCONA  = 0B00000000;  
	IOCA    = 0B00000000;
	TRISA   = 0B00000000;

	WPUB    = 0B00000000;  // PORTB weak-pull / direction setup
	WPDB    = 0B00100000;
	ODCONB  = 0B00000000;  
	IOCB    = 0B00000000;
	TRISB   = 0B00100000;
	PORTB 	= 0B00101110; // RB5 KEY/CSN latch high
	
	PR2     = 198;		  // Timer2 period base; note: (199+1)*1*(4/16M)=50 us tick unit
	TMR2IF  = 0; 
	TMR2IE  = 1;		  // enable Timer2 overflow interrupt
	T2CON   = 0B00000100; // Timer2 on, 1:1 pre/post; period (199+1)*1*(4/16M)=50 us
						  // (comment retained: effective ISR rate depends on count_1ms)

	PWMCON0 = 0;		  // PWM clk FHSI/16; PWM1-RB1(G), PWM2-RB3(R), PWM4-RB2(B)
	PWMCON1 = 0B00000000; // PWM group D, dead-time off
	PWMCON2 = 0B0010110;  // PWM group D, dead-time off
	PWMTL 	= 0xE7;       // PWM0..PWM3 period low

	// - - PWMD4:9 PWMD4:8 PWM4T:9 PWM4T:8 PWMT:9 PWMT:8
	PWMTH 	 = 0x0F; 	  // blue PWMD4 duty high 2 bits
	PWMT4L   = 0xE7; 	  
	
	// - - PWMD3:9 PWMD3:8 - - PWMD2:9 PWMD2:8
	PWMD23H  = 0x30; 	  // red PWMD2 duty high 2 bits
	PWMD2L   = 0;  	      // red PWMD2 duty low 8 bits
	
	// - - PWMD1:9 PWMD1:8 - - PWMD0:9 PWMD0:8
	PWMD01H  = 0x03;	  // green PWMD1 duty high 2 bits
	PWMD1L   = 0;  	  	  // green PWMD1 duty low 8 bits
	
	PWMTH 	 = 0x0F; 	  // blue PWMD4 duty high 2 bits
	PWMD4L   = 0;  	  	  // blue PWMD4 duty low 8 bits
	
	INTCON   = 0XC0;	  // GIE + PEIE
}

/***********************************************
 * Sleep_Mode
 * Enter low-power sleep; wake on RB5 level change / WDT
 ***********************************************/
void Sleep_Mode(void)
{
	if((sleep_control.sleep_count >= 2) && (sleep_control.sleep_count <= 8)) // after WDT wake: no RF within ~200 ms -> sleep again
	{
		if((soft_data[0] == 0) || (sleep_control.recieve_sleep_flag == 0))   // recieve_sleep_flag ensures sleep even if soft_data[0]!=0
		{																			
			sleep_control.sleep_flag  = 1;                                   // request sleep
        	sleep_control.sleep_count = 0;
		}
	}
	
    if(sleep_control.sleep_count >= 18000)                                   // ~30 min idle -> sleep
	{
        sleep_control.sleep_count = 0;
		sleep_control.sleep_flag  = 1;                                       // request sleep
		soft_recieve_control.recieve_bit = 0;                                // unlock key
	}
	if(sleep_control.sleep_flag == 1)
	{
		sleep_control.recieve_sleep_flag       = 0;
		soft_recieve_control.start_flag        = 0;
		soft_recieve_control.data_length_count = 0; // clear RX length
		soft_recieve_control.data_bit_count    = 0; // clear bit count
		soft_recieve_control.flow_active       = 0;
		soft_recieve_control.last_frame_valid  = 0;
		sleep_control.sleep_count 			   = 0;
		led_control.red_duty   	  			   = 0;
		led_control.green_duty 	  			   = 0;
		led_control.blue_duty  	  			   = 0;
		key_control.key_rec_flag_pb            = 0;
		TRISB 	   = 0B00000000; // RF interface output
		RF_CE_Low(); // CE low
		RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xe0);
		PWMTL 	   = 0; // PWM0..PWM3 period
		PWMTH 	   = 0; // blue duty high bits
		PWMCON0    = 0; // stop PWM1/2/4
		TMR2IE     = 0;
		INTCON     = 0;	
		T2CON      = 0;	
		OPTION_REG = 0;
		TRISA 	   = 0B00000000; // all outputs; RA0 unused wake
		WPUA  	   = 0B00000000; // RA0 pull-up off
		TRISB 	   = 0B00100000; // RB5 KEY/CSN wake input
		PORTB 	   = 0B00101110; // RB5 CSN latch high
		WPUB  	   = 0B00000000; // RB5 external pull-down
		PWMCON0    = 0;
		while(KEY); 
		OPTION_REG = 0x0F;
		OSCCON     = 0X72;	     // osc 16 MHz (sleep prep)
		IOCB 	   = 0B00100000; // Enable RB5 level-change interrupt
		GIE        = 0;		     // after wake, resume past SLEEP
		PIE1   	   = 0;	  	     // disable unused peripheral IRQs
		PIR1       = 0;		     // clear unused IRQ flags
		RBIE       = 1;			 // enable PORTB change IRQ
		INTCON 	  &= 0xC8;	     // clear unused IRQ flags
		PORTB;				     // read PORTB to latch
		RBIF 	   = 0;			 // clear PORTB IRQ flag
		asm("clrwdt");
		asm("nop");
		asm("clrwdt");
		asm("sleep");		// enter sleep
		asm("clrwdt");
		SWDTEN = 0;			// WDT only for sleep; do not reset while waiting for key release
		while(KEY); 
		if(RBIF) 
		{
			sleep_control.recieve_sleep_flag  = 1;
			sleep_control.sleep_count = 15;
			key_control.key_hx_flag_pb = 1;
			OPTION_REG = 0x00;
			OSCCON     = 0x70;
			RBIE       = 0; // disable PORTB change IRQ
			RBIF       = 0; // clear IRQ flag
		}
		PORTB 	   = 0B00101110; // RB5 CSN high
		TRISB      = 0B00000000;
		RF_Rx_Mode();
		OPTION_REG = 0x00;
		OSCCON     = 0x70;	// 16 MHz INTOSC; enable WDT in SW if CONFIG disables it
		Init_System();
		sleep_control.sleep_flag = 0;  
	}
	
	if(key_control.key_hx_flag_pb == 1)
	{
		led_control.led_color      = 1;  // restore color (red)
		led_control.led_mode       = 2;  // restore solid-on
		key_control.key_hx_flag_pb = 0;
	}
}

void Delay_3us(void)
{
	unsigned char i,j;
	for(i=1;i>0;i--)
	{
		asm("nop");
		for(j=5;j>0;j--);
	}
}

void Delay_us(unsigned char x)
{
	unsigned char i,j;
	for(i=x;i>0;i--)
	{
		asm("nop");
		for(j=153;j>0;j--);
	}
}

void Delay_1ms(void)
{
	Delay_us(15);
}

void Delay_ms(unsigned char x)
{
	unsigned char i;
	for(i = 0; i < x; i++)
	{
		Delay_us(15);
	}
	
}



