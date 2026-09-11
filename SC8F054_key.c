#include <sc.h>					
#include "SC8F054_define.h"	
#include "SC8F054_var.h"	

/**
 * 函数名称：按键扫描函数
 * 功能说明：检测按键状态（按下/抬起），并更新相应的按键状态标志位，通常需要周期性调用此函数进行按键检测
 */
void Key_Scan(void)
{
	if (KEY)                                  // 检测到按键被按下
    {
        if(!key_control.key_down_pb)          // 如果是刚按下（按键按下标志位未置位）
        {
			key_control.key_rec_flag_pb  = 1; // 
            key_control.key_up_pb        = 0; // 清除按键抬起标志
            key_control.key_down_pb      = 1; // 置位按键按下标志
            key_control.key_down_time_pb = 0; // 清零按键按下时间计数器
            key_control.key_up_time_pb   = 0; // 清零抬起时间计数器
            key_control.key_flag_pb      = 0; // 清除短按标志
            key_control.key_long_flag_pb = 0; // 清除长按标志
            key_control.key_pb           = 0; // 清除按键事件标志
        }
        else                                                                                   
        {
            if((key_control.key_down_time_pb > KEY_SHORT_DOWN_TIME) && !key_control.key_flag_pb)     // 短按70ms且短按标志未置位时，置位短按标志
            {
                key_control.key_flag_pb = 1;  // 置位短按标志
            }
            if((key_control.key_down_time_pb > KEY_LONG_DOWN_TIME) && !key_control.key_long_flag_pb) // 长按1S且长按标志未置位时，置位长按标志并触发按键事件
            {
                key_control.key_long_flag_pb = 1; // 置位长按标志
                key_control.key_pb           = 1; // 置位按键事件标志
            }
        }
    }
    else
    {
    	// 按键刚抬起
        if(!key_control.key_up_pb)                                           
        {
            key_control.key_up_pb      = 1;
            key_control.key_up_time_pb = 0;
        }
        else // 按键持续抬起
        {
            if(key_control.key_up_time_pb > 50)  // 按键抬起时间大于50MS   按下20MS+松手30MS
            {
                key_control.key_down_pb = 0;     // 清除按键按下标志位，恢复按键空闲状态标识
                if(key_control.key_flag_pb && (key_control.key_long_flag_pb == 0)) // 短按生效
                {
					key_control.key_rec_flag_pb = 0;
					key_control.key_flag_pb 	= 0; // 清除短按标志位，防止短按事件重复触发
                    key_control.key_pb      	= 1; // 置位按键事件标志，触发后续短按事件处理
                }
            }
        }
    }
}

/**
 * 函数名称：按键事件处理函数
 * 功能说明：根据按键标志位判断是长按还是短按，并执行相应的处理逻辑，需要在主循环中调用，处理已触发的按键事件
 */
void Key_Event(void)
{
	if(key_control.key_pb && key_control.key_long_flag_pb)  // 长按事件
    {
		key_control.key_pb = 0;                    // 清除按键事件标志位
		led_control.led_color            = LED_OFF;
		led_control.led_mode             = LED_MODE_OFF;
		sleep_control.sleep_count        = 3;
		sleep_control.sleep_flag         = 1;
		sleep_control.recieve_sleep_flag = 0;
    }
    else if(key_control.key_pb == 1)                // 短按事件
    {
	    key_control.key_pb = 0;   				    // 清除短按键事件标志位
		sleep_control.sleep_count 	     = 20;
		sleep_control.recieve_sleep_flag = 1;
 
		if(led_control.led_mode == LED_MODE_COLOR_CHANGE)
        {
			led_control.led_color = LED_OFF;
            led_control.led_mode  = LED_MODE_OFF;
        }
		else if(led_control.led_color == LED_OFF)
        {
			led_control.led_color = LED_RED;
            led_control.led_mode  = LED_MODE_ON;
        }
		else if(led_control.led_color < LED_BLUE)
        {
			led_control.led_color++;
            led_control.led_mode = LED_MODE_ON;
        }
		else
        {
			led_control.led_color      = LED_RED;
            led_control.led_mode       = LED_MODE_COLOR_CHANGE;
            led_control.led_mode_count = 0;
            led_control.color_p        = LED_OFF;
        }
    }
}


/**
 * 函数名称：按键定时器检测函数
 * 功能说明：负责按键按下和抬起时间的计数，需由定时器中断周期性调用，
 * 通常由定时中断触发，用于实现按键长按、短按的时间判断
 */
void Key_Check_Time(void)
{
	if(key_control.key_down_pb)                              // 如果按键处于按下状态，累加按下时间计数器
	{
		key_control.key_down_time_pb++;                      // 累加按下时间   						
		if(key_control.key_down_time_pb >= KEY_DOWN_TIMEOUT) // 按下达到最大3000ms后保持不变
		{    			    
			key_control.key_down_time_pb = KEY_DOWN_TIMEOUT; 
		}
	}
	if(key_control.key_up_pb)                                // 如果按键处于抬起状态，累加按下时间计数器
	{
		key_control.key_up_time_pb++;                        // 累加抬起时间         
		if(key_control.key_up_time_pb >= KEY_UP_TIMEOUT)     // 抬起达到最大255ms后保持不变
		{				    
			key_control.key_up_time_pb = KEY_UP_TIMEOUT;
		}
	}
}












