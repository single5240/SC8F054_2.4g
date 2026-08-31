#include <sc.h>					
#include "SC8F054_define.h"	
#include "SC8F054_var.h"	



/**
 * 函数名称：
 */	
void map_0_255_to_1000_0(U8 red_duty, U8 green_duty, U8 blue_duty)
{
	unsigned int duty_10bit = 0;
	
	duty_10bit   = (unsigned int)((unsigned long)red_duty * 1023 / 255);
	PWMD23H  	 = 0x00; 
	PWMD23H 	|= ((duty_10bit >> 8) & 0x03); // 红色PWMD2占空比高2位
	PWMD2L   	 = (U8)duty_10bit;              // 红色PWMD2占空比低8位
	
	// - - PWMD1:9 PWMD1:8 - - PWMD0:9 PWMD0:8
	duty_10bit   = (unsigned int)((unsigned long)green_duty * 1023 / 255);
	PWMD01H      = 0x00;	  // 绿色PWMD1占空比高2位
	PWMD01H     |= ((duty_10bit >> 8) & 0x03) << 4; 	  // 绿色PWMD1占空比高2位
	PWMD1L       = (U8)duty_10bit;  // 绿色PWMD1占空比低8位
	
	duty_10bit   = (unsigned int)((unsigned long)blue_duty * 1023 / 255);
	PWMTH 	     = 0x0F; 	  // 蓝色PWMD4占空比高2位
	PWMTH 	    |= ((duty_10bit >> 8) & 0x03) << 4; // 蓝色PWMD4占空比高2位
	PWMD4L       = (U8)duty_10bit;  // 蓝色PWMD4占空比低8位
}






/**
 * 函数功能：LED颜色配置函数
 * 功能说明：根据目标LED颜色（led_color）更新RGB三色的占空比，仅在颜色变化且非特定模式（mode≠1）时执行
 * 核心逻辑：通过switch-case匹配预设颜色，设置红（R）、绿（G）、蓝（B）三色的目标占空比，最终同步到"设定占空比"变量供模式控制使用
 * 备注：占空比范围为0-255，0表示该颜色通道关闭，255表示该颜色通道最大亮度
 */
void Led_Color_Prg(void)
{
	// 条件判断：1. 当前记录的颜色（color_p）≠目标颜色（led_color）；2. LED模式≠1（排除特定不允许颜色切换的模式）
	if((led_control.color_p != led_control.led_color) && (led_control.led_mode != 1))
	{
		led_control.color_p = led_control.led_color; // 更新记录的颜色，避免重复执行配置             
		switch(led_control.led_color)
	    {
			case LED_OFF :             // 关闭
				led_control.red_duty   = 0;
				led_control.green_duty = 0;
				led_control.blue_duty  = 0;
				PWMCON0    = 0X00;	
				break;
			case LED_RED:              // 红色
				led_control.red_duty   = 255;
				led_control.green_duty = 0;
				led_control.blue_duty  = 0;
				PWMCON0    = 0X16;	
				break;
	        case LED_GREEN:            // 绿色
				led_control.red_duty   = 0;
				led_control.green_duty = 255;
				led_control.blue_duty  = 0;
				PWMCON0    = 0X16;	
				break;
	        case LED_BLUE:             // 蓝色
				led_control.red_duty   = 0;
				led_control.green_duty = 0;
				led_control.blue_duty  = 255;
				PWMCON0    = 0X16;	
				break;
	        case LED_PINK:             // 粉色
				led_control.red_duty   = 255;
				led_control.green_duty = 0;
				led_control.blue_duty  = 60;
				PWMCON0    = 0X16;
				break;
	        case LED_WHITE:            // 白色
				led_control.red_duty   = 255;
				led_control.green_duty = 255;
				led_control.blue_duty  = 255;
				PWMCON0    = 0X16;	
				break;
	        case LED_YELLOW:           // 黄色
				led_control.red_duty   = 160;
				led_control.green_duty = 50;
				led_control.blue_duty  = 0;
				PWMCON0    = 0X16;	
				break;
	        case LED_LIGHT_GREEN:      // 淡绿
				led_control.red_duty   = 74;
				led_control.green_duty = 255;
				led_control.blue_duty  = 63;
				PWMCON0    = 0X16;
				break;
	        case LED_LIGHT_BLUE:       // 淡蓝
				led_control.red_duty   = 50;
				led_control.green_duty = 100;
				led_control.blue_duty  = 255;
				PWMCON0    = 0X16; 
				break;
	        case LED_LIGHT_PINK:       // 淡粉
				led_control.red_duty   = 205;
				led_control.green_duty = 43;
				led_control.blue_duty  = 63;
				PWMCON0 = 0X16; 
				break;
	        case LED_LIGHT_YELLOW:     // 淡黄
				led_control.red_duty   = 255;
				led_control.green_duty = 160;
				led_control.blue_duty  = 1;
				PWMCON0 = 0X16; 
				break;
	        case LED_PURPLE:           // 紫色
				led_control.red_duty   = 255;
				led_control.green_duty = 20;
				led_control.blue_duty  = 200;
				PWMCON0 = 0X16; 
				break;
	        case LED_ORANGE:           // 橙色
				led_control.red_duty   = 255;
				led_control.green_duty = 20;
				led_control.blue_duty  = 0;
				PWMCON0 = 0X16; 
				break;
	        case LED_DARK_GREEN:       // 深绿
				led_control.red_duty   = 10;
				led_control.green_duty = 180;
				led_control.blue_duty  = 50;
				PWMCON0 = 0X16; 
				break;
	        case LED_CYAN:             // 蓝绿
				led_control.red_duty   = 0;
				led_control.green_duty = 191;
				led_control.blue_duty  = 255;
				PWMCON0 = 0X16;
				break;
	        case LED_TURQUOISE:        // 宝石绿
				led_control.red_duty   = 100;
				led_control.green_duty = 255;
				led_control.blue_duty  = 0;
				PWMCON0 = 0X16;
				break;
	        default:
	        break;
	    } 

	    // 将配置好的RGB占空比同步到"设定占空比"变量（set_xxx_duty），供后续模式控制（如常亮、闪烁）调用
	   	led_control.set_red_duty   = led_control.red_duty;
		led_control.set_green_duty = led_control.green_duty;
		led_control.set_blue_duty  = led_control.blue_duty;

		if((led_control.led_mode == LED_MODE_FADING) && (led_control.breath_flag == 1))
		{
			led_control.red_duty   = 0;
			led_control.green_duty = 0;
			led_control.blue_duty  = 0;
		}
	}
	
	map_0_255_to_1000_0(led_control.red_duty, led_control.green_duty, led_control.blue_duty);

}





