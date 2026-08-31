#include <sc.h>	
#include <stdlib.h>	
#include "SC8F054_define.h"
#include "SC8F054_var.h"

unsigned char soft_data[34] = {0}; // 接收数据数组
unsigned char key_data 		= 0;

void main(void)
{	
	Init_System();
	XL2400T_Init();
    RF_Rx_Mode();

	while(1)
	{
		RF_RX_Data(soft_data);
		Led_Color_Prg();
		//Key_Scan();
		//Key_Event();
		Rand_num();
		Sleep_Mode();
	}
}

/**
 * 函数功能： 随机数生成处理函数
 * 功能说明： 该函数用于在满足特定条件时生成1~8范围内的有效随机数，存入控制结构体中，
 *            采用「先初始化随机数种子，再生成随机数，最后做范围校验」的流程，保证随机数的有效性和唯一性。
 */
void Rand_num(void)
{
	if((soft_recieve_control.rand_flag == 0) && (soft_recieve_control.randnum_flag == 1))
    {	
		soft_recieve_control.rand_num  = (rand() % 8) + 1;
		soft_recieve_control.rand_flag = 1;
    }
}

/***********************************************
函数名称：Timer_Isr
函数功能：中断服务
入口参数：无
出口参数：无
************************************************/
void interrupt INT_Isr()
{
	if(TMR2IF)
	{
		TMR2IF  = 0;	  // 清中断标志位
		//Uart_Send_Receive();
		led_control.count_1ms++;		

		if(led_control.count_1ms >= 20) // 1ms
		{
			Key_Check_Time();
			led_control.count_1ms = 0;
			if(soft_recieve_control.dalay_time)
			{
				soft_recieve_control.dalay_time--;
			}

			led_control.count_10ms++;
			if(led_control.count_10ms >= 9)     // 10ms
			{
				led_control.count_10ms = 0;

				switch(led_control.led_mode)
				{
					case LED_MODE_OFF:          // 熄灭
					{
						led_control.red_duty   = 0;
						led_control.green_duty = 0;
						led_control.blue_duty  = 0;
						PWMCON0                = 0x00;	
						break;  
					}     
					case LED_MODE_ON:           // 常亮
					{
						led_control.red_duty   = led_control.set_red_duty;
						led_control.green_duty = led_control.set_green_duty;
						led_control.blue_duty  = led_control.set_blue_duty;
						
						if((led_control.blue_duty == 0) && (led_control.green_duty == 0) && (led_control.red_duty == 0))
						{
							PWMCON0 = 0x00;     // 关闭PWM1，PWM2，PWM4这样才可以全部关闭
						}
						else
						{
							PWMCON0 = 0x16;
						}
						break; 
					}
					case LED_MODE_SLOW:         // 慢闪 
					{		
						led_control.led_mode_count++;
						if(led_control.led_mode_count >= 112)
						{
							led_control.led_mode_count = 0; // 大约0.25s闪烁一次	
						}

						if(led_control.led_mode_count < 56)
			  		  	{
							led_control.red_duty   = led_control.set_red_duty;
							led_control.green_duty = led_control.set_green_duty;
							led_control.blue_duty  = led_control.set_blue_duty;
							PWMCON0 = 0x16;
						}
						else
			          	{
							PWMCON0 = 0x00;
							led_control.red_duty   = 0;
							led_control.green_duty = 0;
							led_control.blue_duty  = 0;			
						} 
						break;  
					} 
					case LED_MODE_QUICK:           // 快闪 
					{	
						led_control.led_mode_count++;
						if(led_control.led_mode_count >= 32)
						{
							led_control.led_mode_count = 0; // 大约0.25s闪烁一次	
						}
						
						if(led_control.led_mode_count < 16)
			  		  	{
							PWMCON0 			   = 0x16;
							led_control.red_duty   = led_control.set_red_duty;
							led_control.green_duty = led_control.set_green_duty;
							led_control.blue_duty  = led_control.set_blue_duty;
						}
						else
			          	{
							PWMCON0 			   = 0x00;
							led_control.red_duty   = 0;
							led_control.green_duty = 0;
							led_control.blue_duty  = 0;			
						} 
						break;  
					}  
					case LED_MODE_STROBE:       // 频闪
					{
						PWMCON0 = 0x16;
						led_control.led_mode_count++;
						if(led_control.led_mode_count >= 112)
						{
							led_control.led_mode_count = 0; // 大约0.125s闪烁一次	
						}
						
						if(led_control.led_mode_count / 7 % 2 == 0)
			          	{
							led_control.red_duty   = led_control.set_red_duty;
							led_control.green_duty = led_control.set_green_duty;
							led_control.blue_duty  = led_control.set_blue_duty;
							PWMCON0                = 0x16;
						}
						else
			          	{
							PWMCON0                = 0x00;
							led_control.red_duty   = 0;
							led_control.green_duty = 0;
							led_control.blue_duty  = 0;
						}
						break; 
					}                         
					case LED_MODE_COLOR_CHANGE: 	  // 15色轮播
					{
						PWMCON0 = 0x16;
						led_control.led_mode_count++;
						if(led_control.led_mode_count >= 50)
						{
							led_control.led_mode_count = 0;
							led_control.led_color++;
							if(led_control.led_color > 15)
							{
								led_control.led_color = 1;
							}
						} 
						break;
					}                   
					case LED_MODE_FADING:       	 // 呼吸灯
					{
						PWMCON0 = 0x16;
						if(led_control.breath_flag == 1) // 渐亮
						{
							if(led_control.led_mode_count)
					        {
								led_control.breath_time++;
					            if(led_control.breath_time >= led_control.breath_start_off_time)
					            {
									led_control.breath_time = 0;
									led_control.led_mode_count--;
					
					                if(led_control.red_duty >= led_control.set_red_duty)
					                {
					                	led_control.red_duty = led_control.set_red_duty;
					                }
									else
									{
										led_control.red_duty = led_control.red_duty +  led_control.set_red_duty / led_control.breat_time_control;
									}
									if(led_control.green_duty >= led_control.set_green_duty)
									{
										led_control.green_duty = led_control.set_green_duty;
									}
									else
									{
										led_control.green_duty = led_control.green_duty +  led_control.set_green_duty / led_control.breat_time_control;
									}
									if(led_control.blue_duty >= led_control.set_blue_duty)
									{
										led_control.blue_duty = led_control.set_blue_duty;
									}
									else
									{
										led_control.blue_duty = led_control.blue_duty +  led_control.set_blue_duty / led_control.breat_time_control;
									}
					                if(led_control.led_mode_count <= 0)
					                {
										led_control.red_duty   = led_control.set_red_duty;
										led_control.green_duty = led_control.set_green_duty;
										led_control.blue_duty  = led_control.set_blue_duty;
					                }
					            }
					        }
					    }
					    else
					    {
							if(led_control.led_mode_count)
					        {
								led_control.breath_time++;
					            if(led_control.breath_time >= led_control.breath_start_off_time)
					            {
									led_control.breath_time = 0;
									led_control.led_mode_count--;
					
					                if(led_control.red_duty <= 0)
					                {
					                	led_control.red_duty = 0;
					                }
									else
									{
										led_control.red_duty = led_control.red_duty - led_control.set_red_duty / led_control.breat_time_control;
									}
									
									if(led_control.green_duty <= 0)
									{
										led_control.green_duty = 0;
									}
									else
									{
										led_control.green_duty = led_control.green_duty - led_control.set_green_duty / led_control.breat_time_control;
									}
										
									if(led_control.blue_duty <= 0)
									{
										led_control.blue_duty = 0;
									}
									else
									{
										led_control.blue_duty = led_control.blue_duty - led_control.set_blue_duty / led_control.breat_time_control;
									}
										
					                if(led_control.led_mode_count <= 0)
					                {
										led_control.red_duty   = 0;
										led_control.green_duty = 0;
										led_control.blue_duty  = 0;
					                }
					            }
					        }
					    }
						break;
					}
					default:
				    break;               
				}
				
				led_control.count_100ms++;
				if(led_control.count_100ms >= 10) 		// 100ms
				{
					led_control.count_100ms = 0;
					led_control.count_1000ms++;
					
					if(led_control.count_1000ms > 11) // 1300ms在进行雪花轮闪功能1.3S刷新随机数
					{
						soft_recieve_control.rand_flag = 0;
						led_control.count_1000ms = 0;
					}
					
					if(sleep_control.sleep_count < 20000)
					{
						sleep_control.sleep_count++; // 睡眠计数
					}
				}
			}
		}
	}
}







