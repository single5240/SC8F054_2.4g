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
	OSCCON     = 0x70;	   // 16MHZ,内部振荡器用作系统时钟,CONFIG关闭WDT时必需软件打开WDT
	OPTION_REG = 0x00;	   // 配置TIMER0时间，00为2分频

	WPUA    = 0B00000000;  // 配置PORTA输出情况
	WPDA    = 0B00000000;  
	ODCONA  = 0B00000000;  
	IOCA    = 0B00000000;
	TRISA   = 0B00000000;

	WPUB    = 0B00000000;  // 配置PORTB输出情况
	WPDB    = 0B00000001;
	ODCONB  = 0B00000000;  
	IOCB    = 0B00000000;
	TRISB   = 0B00000001; 
	PORTB 	= 0B00001110; // 
	
	PR2     = 198;		  // 设定Timer初始值，定时周期是200*4/16M=50uS
	TMR2IF  = 0; 
	TMR2IE  = 1;		  // 使能Timer2溢出中断
	T2CON   = 0B00000100; // 开启Timer2，预分频为1：1，后分频为1：1，
						  // 则定时时间为（199+1）*1*（4/16M）=250us
						  

	PWMCON0 = 0;		  // PWM时钟分频是FHSI/16,打开PWM1-RB1（绿色），PWM2-RB3（红色），PWM4-RB2（蓝色）
	PWMCON1 = 0B00000000; // PWM选择D组，死区功能禁止
	PWMCON2 = 0B0010110;  // PWM选择D组，死区功能禁止
	PWMTL 	= 0xE7;       // PWM0,PWM1,PWM2,PWM3周期

	// - - PWMD4:9 PWMD4:8 PWM4T:9 PWM4T:8 PWMT:9 PWMT:8
	PWMTH 	 = 0x0F; 	  // 蓝色PWMD4占空比高2位
	PWMT4L   = 0xE7; 	  
	
	// - - PWMD3:9 PWMD3:8 - - PWMD2:9 PWMD2:8
	PWMD23H  = 0x30; 	  // 红色PWMD2占空比高2位
	PWMD2L   = 0;  	      // 红色PWMD2占空比低8位
	
	// - - PWMD1:9 PWMD1:8 - - PWMD0:9 PWMD0:8
	PWMD01H  = 0x03;	  // 绿色PWMD1占空比高2位
	PWMD1L   = 0;  	  	  // 绿色PWMD1占空比低8位
	
	PWMTH 	 = 0x0F; 	  // 蓝色PWMD4占空比高2位
	PWMD4L   = 0;  	  	  // 蓝色PWMD4占空比低8位
	
	INTCON   = 0XC0;	  // 开启总中断及外设中断
}

/***********************************************
函数名称：Sleep_Mode
函数功能：进入休眠模式
入口参数：无
出口参数：无
备注：
************************************************/
void Sleep_Mode(void)
{
	if((sleep_control.sleep_count >= 2) && (sleep_control.sleep_count <= 8)) // 看门狗唤醒后200ms内，无接受数据，进入休眠
	{
		if((soft_data[0] == 0) || (sleep_control.recieve_sleep_flag == 0))   // 加入recieve_sleep_flag标志位是因为能保证进入休眠，soft_data[0]可能不为0
		{																			
			sleep_control.sleep_flag  = 1;                                   // 置位休眠标志为1
        	sleep_control.sleep_count = 0;
		}
	}
	
    if(sleep_control.sleep_count >= 18000)                                   // 30min睡眠计数超过30分钟，则进入休眠  
	{
        sleep_control.sleep_count = 0;
		sleep_control.sleep_flag  = 1;                                       // 置位休眠标志为1
		soft_recieve_control.recieve_bit = 0;                                // 解锁按键
	}
	if(sleep_control.sleep_flag == 1)
	{
		sleep_control.recieve_sleep_flag       = 0;
		soft_recieve_control.start_flag        = 0;
		soft_recieve_control.data_length_count = 0; // 接收字节计数清零
		soft_recieve_control.data_bit_count    = 0; // 清除数据计数
		soft_recieve_control.flow_active       = 0;
		soft_recieve_control.last_frame_valid  = 0;
		sleep_control.sleep_count 			   = 0;
		led_control.red_duty   	  			   = 0;
		led_control.green_duty 	  			   = 0;
		led_control.blue_duty  	  			   = 0;
		key_control.key_rec_flag_pb            = 0;
		TRISB 	   = 0B00000000; // 关闭所有输出，RB5口做唤醒输入
		RF_CE_Low(); // 拉低CE
		RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xe0);
		PWMTL 	   = 0; // PWM0,PWM1,PWM2,PWM3周期
		PWMTH 	   = 0; // 蓝色PWMD4占空比高2位
		PWMCON0    = 0; // PWM时钟分频是FHSI/16,打开PWM1-RB1（绿色），PWM2-RB3（红色），PWM4-RB2（蓝色）
		TMR2IE     = 0;
		INTCON     = 0;	
		T2CON      = 0;	
		OPTION_REG = 0;
		TRISA 	   = 0B00000000; // 关闭所有输出，RA0口做唤醒输入
		WPUA  	   = 0B00000000; // RA0 开上拉电阻
		TRISB 	   = 0B00000001; // 关闭所有输出，RB5口做唤醒输入
		PORTB 	   = 0B00001110; // 
		WPUB  	   = 0B00000000; // RB5开上拉电阻	
		PWMCON0    = 0;
		while(KEY); 
		OPTION_REG = 0x0F;
		OSCCON     = 0X72;	     // 配置振荡为16M,
		IOCB 	   = 0B00000001; // 允许RB5的IO口电平变化中断
		GIE        = 0;		     // 唤醒后执行SLEEP后程序;
		PIE1   	   = 0;	  	     // 关闭不需要的中断
		PIR1       = 0;		     // 必须清不需要的中断标志位
		RBIE       = 1;			 // 允许PORTB电平变化中断
		INTCON 	  &= 0xC8;	     // 必须清不需要的中断标志位
		PORTB;				     // 读PORTB值并锁存	
		RBIF 	   = 0;			 // 清PORTB中断标志位		
		asm("clrwdt");
		asm("nop");
		asm("clrwdt");
		asm("sleep");		// 进入休眠模式
		asm("clrwdt");
		while(KEY); 
		if(RBIF) 
		{
			sleep_control.recieve_sleep_flag  = 1;
			sleep_control.sleep_count = 15;
			key_control.key_hx_flag_pb = 1;
			OPTION_REG = 0x00;
			OSCCON     = 0x70;
			RBIE       = 0; // 允许PORTB电平变化中断
			RBIF       = 0; // 清中断标志 
		}
		PORTB 	   = 0B00001110; //
		TRISB      = 0B00000000;
		RF_Rx_Mode();
		OPTION_REG = 0x00;
		OSCCON     = 0x70;	// 16MHZ,内部振荡器用作系统时钟,CONFIG关闭WDT时必需软件打开WDT
		Init_System();
		sleep_control.sleep_flag = 0;  
	}
	
	if(key_control.key_hx_flag_pb == 1)
	{
		led_control.led_color      = 1;  // 颜色值复位
		led_control.led_mode       = 2;  // 模式复位
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




