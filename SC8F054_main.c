#include <sc.h>
#include "SC8F054_define.h"
#include "SC8F054_var.h"

void main(void)
{
	unsigned char i;

	Init_System();
	XL2400T_Init();
	RF_Rx_Mode();

	if(XL2400T_Self_Test() == 0)
	{
		led_control.color_p = LED_OFF;
		led_control.led_color = LED_RED;
		led_control.led_mode = LED_MODE_ON;
		Led_Color_Prg();
		while(1)
		{
			asm("clrwdt");
		}
	}

	for(i = 0; i < 3; i++)
	{
		led_control.color_p = LED_OFF;
		led_control.led_color = LED_BLUE;
		led_control.led_mode = LED_MODE_ON;
		Led_Color_Prg();
		Delay_ms(150);
		led_control.led_mode = LED_MODE_OFF;
		PWMCON0 = 0x00;
		Delay_ms(150);
	}

	PingPong_Init();

	while(1)
	{
		PingPong_Task();
		Led_Color_Prg();
		Sleep_Mode();
	}
}

/***********************************************
�������ƣ�Timer_Isr
�������ܣ��жϷ���
��ڲ�������
���ڲ�������
************************************************/
void interrupt INT_Isr()
{
	if(TMR2IF)
	{
		TMR2IF = 0;
		led_control.count_1ms++;

		if(led_control.count_1ms >= 20) // 1ms
		{
			Key_Check_Time();
			led_control.count_1ms = 0;
			led_control.count_10ms++;

			if(led_control.count_10ms >= 10) // 10ms
			{
				led_control.count_10ms = 0;
				PingPong_10ms();

				switch(led_control.led_mode)
				{
					case LED_MODE_OFF:
						led_control.red_duty   = 0;
						led_control.green_duty = 0;
						led_control.blue_duty  = 0;
						PWMCON0 = 0x00;
						break;

					case LED_MODE_ON:
						led_control.red_duty   = led_control.set_red_duty;
						led_control.green_duty = led_control.set_green_duty;
						led_control.blue_duty  = led_control.set_blue_duty;
						PWMCON0 = 0x16;
						break;

					case LED_MODE_COLOR_CHANGE:
						led_control.led_mode_count++;
						if(led_control.led_mode_count >= 100) // Լ1���л�һ����ɫ
						{
							led_control.led_mode_count = 0;
							led_control.led_color++;
							if(led_control.led_color > LED_BLUE)
							{
								led_control.led_color = LED_RED;
							}
						}
						led_control.red_duty   = led_control.set_red_duty;
						led_control.green_duty = led_control.set_green_duty;
						led_control.blue_duty  = led_control.set_blue_duty;
						PWMCON0 = 0x16;
						break;

					default:
						led_control.led_color = LED_OFF;
						led_control.led_mode  = LED_MODE_OFF;
						break;
				}

				led_control.count_100ms++;
				if(led_control.count_100ms >= 10) // 100ms
				{
					led_control.count_100ms = 0;
					if(sleep_control.sleep_count < 20000)
					{
						sleep_control.sleep_count++;
					}
				}
			}
		}
	}
}
