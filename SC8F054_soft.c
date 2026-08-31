#include <sc.h>					
#include "SC8F054_define.h"	
#include "SC8F054_var.h"	




/**----------------------------------------------------------------------------------------------**
 **函数名  ：解码函数
 **功能    ：解析接收的脉冲信号（同步码+数据位），校验数据合法性，执行LED控制逻辑
 **参数    ：无
 **返回值  ：无
 **----------------------------------------------------------------------------------------------**/
void Soft_Decode(void) // 接受码处理函数
{ 
	{  /*
		if((soft_recieve_control.data_length_count == 33) &&
		(((soft_data[1] + soft_data[4] + soft_data[8] + soft_data[10] + soft_data[14] + soft_data[24]) & 0x0ff) == soft_data[0])) // DMX数据
		{
			sleep_control.sleep_count         = 13; // 按下按键30m内不进入休眠
			sleep_control.recieve_sleep_flag  = 1;  // 置1，不进入休眠
			soft_recieve_control.randnum_flag = 0;  // 禁止获取随机数
			soft_recieve_control.recieve_bit  = 1;  // 锁定按键
			
			// 本通道数据
			if(((soft_data[1] + soft_data[4] + soft_data[8] + soft_data[10] + soft_data[14] + soft_data[24]) & 0x0ff) == soft_data[0]) 
			{
				led_control.led_mode       = (( soft_data[led_control.add_data * 2 - 1] >> 4) & 0x0f);					
				led_control.set_red_duty   = ((soft_data[led_control.add_data * 2 - 1])      & 0x0f) * 17;
				led_control.set_green_duty = ((soft_data[led_control.add_data * 2] >> 4)     & 0x0f) * 17;
				led_control.set_blue_duty  = ((soft_data[led_control.add_data * 2])          & 0x0f) * 17;
			}
			
			soft_recieve_control.start_flag         = 0; // 清除开始标志位
			soft_recieve_control.clear_bit          = 0; // 清除接收相关标志位和计数值 
			soft_data[0]                            = 0; // 清零接收数据缓冲区首字节：清除帧头残留数据
			soft_recieve_control.data_length_count  = 0; // 清零接收数据次数
		}*/
		if(soft_recieve_control.data_length_count == 5)
		{ 
			// 帧重复检测：与上一次接收的帧比较，避免重复处理
			if((soft_data[0] != soft_recieve_control.temp0) || (soft_data[1] != soft_recieve_control.temp1) 
			|| (soft_data[2] != soft_recieve_control.temp2) || (soft_data[3] != soft_recieve_control.temp3))
			{	 
				// 校验和验证：前4字节和校验等于第5字节
				if(((soft_data[0] + soft_data[1] + soft_data[2] + soft_data[3]) & 0x0ff) == soft_data[4])
				{
					soft_recieve_control.temp0         = soft_data[0];        // 记录上一次的数组第0个的数据
					soft_recieve_control.temp1         = soft_data[1];        // 记录上一次的数组第1个的数据
					soft_recieve_control.temp2         = soft_data[2];        // 记录上一次的数组第2个的数据
					soft_recieve_control.temp3         = soft_data[3];        // 记录上一次的数组第3个的数据
					soft_recieve_control.function_data = soft_data[3];        // 保存功能指令
					soft_recieve_control.Channel       = soft_data[0] & 0xff; // 提获取通道1-8的数据
					sleep_control.sleep_count          = 13;                  // 等于13防止未接收数据进入休眠
					sleep_control.recieve_sleep_flag   = 1;               	  // 置1，不进入休眠
					soft_recieve_control.randnum_flag  = 0;                   // 禁止随机数的获取
					
					if((soft_recieve_control.function_data == 0x20) || (soft_recieve_control.function_data == 0xE0) 
					|| (soft_recieve_control.function_data == 0xC0) || (soft_recieve_control.function_data == 0x40))      
					{ 
						soft_recieve_control.recieve_bit = 1; 			// 锁定按键 

						if((soft_recieve_control.Channel | (soft_data[1] << 8)) & (1 << (led_control.add_data - 1)))
						{
							if(soft_recieve_control.function_data == 0x20)
							{
								led_control.led_color = (soft_data[2] >> 4) & 0x0f;
								led_control.led_mode  = (soft_data[2]) & 0x0f;

								led_control.quick_control = 0;
								if(led_control.led_color != 0)
									led_control.last_quick_led = led_control.led_color;
							}
							else if(soft_recieve_control.function_data == 0xE0)
							{
								led_control.led_mode  = LED_MODE_ON; 
								led_control.led_color = led_control.last_quick_led; 
							}
							else if(soft_recieve_control.function_data == 0xC0)
							{
								led_control.add_data = (soft_data[2] & 0x0f) + 1; // 0-15通道加1转换为1-16通道(因为只有4bit，所以传的时候只能传0-15)
							}
							else if(soft_recieve_control.function_data == 0x40)
							{
								led_control.led_color = (soft_data[2] >>4) & 0x0f;
								led_control.led_mode  = soft_data[2] & 0x0f; 
							}
						}
						else if(soft_recieve_control.function_data == 0x40)
						{
							led_control.led_mode  = LED_MODE_OFF; // 进入灭灯
							led_control.led_color = 0;
						}
						soft_recieve_control.clear_bit = 1;             // 清除接收数据相关的标志位和计数值                                                                      
					}
					else if(soft_recieve_control.function_data == 0x60) // 手环解锁
					{
						soft_recieve_control.recieve_bit = 0; // 解锁按键
						soft_recieve_control.clear_bit   = 1; // 清除接收数据相关的标志位和计数值
						led_control.led_color            = 0;
						led_control.led_mode             = LED_MODE_ON;	
					}
					else if(soft_recieve_control.function_data == 0xD0) // 彩虹
					{
						soft_recieve_control.recieve_bit = 1; // 锁定按键
						led_control.led_color   		 = (soft_data[2] >> 4) & 0x0f;
						led_control.led_color   		 = (led_control.led_color + led_control.add_data) % 10 + 1;
						led_control.led_mode    		 = soft_data[2] & 0x0f;  
						soft_recieve_control.clear_bit   = 1; // 清除接收数据相关的标志位和计数值
					}
					else if(soft_recieve_control.function_data == 0x80) // 呼吸
					{
						soft_recieve_control.recieve_bit = 1; 	 // 锁定按键
						if((soft_recieve_control.Channel | (soft_data[1] << 8)) & (1 << (led_control.add_data - 1)))
						{
							led_control.led_color     		  = (soft_data[2] >> 4) & 0x0f;
							led_control.breath_time    		  = 0;
							led_control.led_mode       		  = LED_MODE_FADING; // 进入呼吸模式
							led_control.breath_flag           = soft_data[2] & 0x0f; 
							led_control.breath_start_off_time = 10;
							led_control.led_mode_count        = 10;
							led_control.breat_time_control    = 10; 
							
							if(led_control.breath_flag == 1)      // 渐亮
							{
								led_control.red_duty   = 0;
								led_control.green_duty = 0;
								led_control.blue_duty  = 0;
							}
							else if(led_control.breath_flag == 0) // 渐暗是1000ms之后完全灭灯
							{
								led_control.color_p = 0;
							}
							else if(led_control.breath_flag == 2) // 贪吃蛇渐暗的15*17=2550ms灭灯，如果用1000ms的话，客户觉得太快了
							{
								led_control.breath_start_off_time = 17;
								led_control.led_mode_count        = 15;
								led_control.breat_time_control    = 15; 
								led_control.color_p               = 0;
							}	
						}             
						soft_recieve_control.clear_bit = 1;           // 清除接收数据相关的标志位和计数值
					}
					else if(soft_recieve_control.function_data == 0xB0) // 快闪
					{
						soft_recieve_control.recieve_bit = 1;   // 锁定按键
						soft_recieve_control.stroge_flag = soft_data[2] & 0x03;

						if((soft_recieve_control.Channel | (soft_data[1] << 8)) & (1 << (led_control.add_data - 1)))
						{
							led_control.led_color           = led_control.last_quick_led;
							led_control.quick_control       = 1;
							led_control.led_mode_count      = 0; // 清零计数，保持闪烁同步
							soft_recieve_control.quick_flag = 1; // 置1，进入快闪模式 
							if(soft_recieve_control.stroge_flag == 2)
							{
								led_control.led_color            = 0;
								soft_recieve_control.quick_flag  = 0; // 置1，进入快闪模式
							}
						}
						else
						{
							if((soft_recieve_control.stroge_flag == 2) && (led_control.quick_control == 1))
							{
								led_control.led_color = led_control.last_quick_led;
							}
							else if(led_control.quick_control == 0)
							{
								if(led_control.led_color == 0)
									led_control.led_color = 0;
							}
						}

						// 放在这里是因为先进入0x20功能点亮灯，把通道关了，不进入快闪模式
						if(soft_recieve_control.quick_flag == 1) 
						{
							if(led_control.last_quick_led >= 1)
								led_control.led_mode = LED_MODE_QUICK; // 放在这里通道关闭后，可以继续闪烁
							soft_recieve_control.quick_flag = 0;       // 清零是因为，按0x20功能，关闭通道，不进入快闪
						}
						
						soft_recieve_control.clear_bit = 1;
					}
					else if(soft_recieve_control.function_data == 0xF0) // 雪花轮闪
					{
						soft_recieve_control.recieve_bit = 1;           // 锁定按键

						// ny8_soft_recieve_control.rand数据1.3S改变一次，范围是1-8随机改变，发送端发送随机数的范围是1-8
						if((soft_data[2] & 0x0f) == soft_recieve_control.rand_num) 
						{
							if(!soft_recieve_control.Snowflake_flag) 
							{
								soft_recieve_control.randnum_flag          = 1; 		  // 
								soft_recieve_control.Snowflake_flag        = 1; 		  // 置位雪花标志，启动雪花轮闪
								soft_recieve_control.Snowflake_dit_off     = 0; 		  // 清零轮闪间隔计数器
								led_control.led_mode                       = LED_MODE_ON; // 设置灯光常亮，启动轮闪
								led_control.led_color                      = ((soft_data[2] >> 4) & 0x0f);
							}
						} 
						
						// 实现灯光亮灭交替
						if(soft_recieve_control.Snowflake_flag) 
						{
							if(++soft_recieve_control.Snowflake_dit_off > 2) // 轮闪间隔判断，控制闪炼频率
							{ 	
								// 灯光亮灭切换：熄灭
								led_control.led_mode 				   = 1;
								soft_recieve_control.Snowflake_dit_off = 0; 
								soft_recieve_control.Snowflake_flag    = 0;
							}
						}
						
						soft_recieve_control.clear_bit = 1;         // 清除接收数据相关的标志位和计数值
					}
					if(soft_recieve_control.clear_bit)              // 清除接收数据相关的标志位和计数值
					{
						soft_recieve_control.data_length_count = 0; // 清零接收字节计数器：重置已接收字节数，
						soft_recieve_control.clear_bit         = 0; // 清零清除标志位本身：完成清除流程后，重置该标志位
						soft_recieve_control.Channel           = 0; // 清零通道1-8的数据
						soft_data[0]                           = 0; // 清零接收数据缓冲区首字节：清除帧头残留数据
						soft_recieve_control.function_data     = 0; // 清零功能指令码缓存：清除本次处理的功能指令
					} 
				}
			}
		}
	}    	
}



