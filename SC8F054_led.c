#include <sc.h>					
#include "SC8F054_define.h"	
#include "SC8F054_var.h"	



void map_0_255_to_1000_0(U8 red_duty, U8 green_duty, U8 blue_duty)
{
	unsigned int duty_10bit = 0;
	
	/* 1023 = 4 * 255 + 3，分段补偿与 duty * 1023 / 255 完全等价。 */
	duty_10bit = (unsigned int)red_duty << 2;
	if(red_duty >= 85)  duty_10bit++;
	if(red_duty >= 170) duty_10bit++;
	if(red_duty == 255) duty_10bit++;
	PWMD23H  	 = 0x00; 
	PWMD23H 	|= ((duty_10bit >> 8) & 0x03); // 红色PWMD2占空比高2位
	PWMD2L   	 = (U8)duty_10bit;              // 红色PWMD2占空比低8位
	
	// - - PWMD1:9 PWMD1:8 - - PWMD0:9 PWMD0:8
	duty_10bit = (unsigned int)green_duty << 2;
	if(green_duty >= 85)  duty_10bit++;
	if(green_duty >= 170) duty_10bit++;
	if(green_duty == 255) duty_10bit++;
	PWMD01H      = 0x00;	  // 绿色PWMD1占空比高2位
	PWMD01H     |= ((duty_10bit >> 8) & 0x03) << 4; 	  // 绿色PWMD1占空比高2位
	PWMD1L       = (U8)duty_10bit;  // 绿色PWMD1占空比低8位
	
	duty_10bit = (unsigned int)blue_duty << 2;
	if(blue_duty >= 85)  duty_10bit++;
	if(blue_duty >= 170) duty_10bit++;
	if(blue_duty == 255) duty_10bit++;
	PWMTH 	     = 0x0F; 	  // 蓝色PWMD4占空比高2位
	PWMTH 	    |= ((duty_10bit >> 8) & 0x03) << 4; // 蓝色PWMD4占空比高2位
	PWMD4L       = (U8)duty_10bit;  // 蓝色PWMD4占空比低8位
}






/**
 * 函数功能：LED颜色配置函数
 * 功能说明：根据目标LED颜色（led_color）更新RGB三色的占空比，仅在颜色变化且非特定模式（mode≠1）时执行
	 * 核心逻辑：通过switch-case匹配红、绿、蓝三种颜色，设置RGB占空比
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
	        default:
	        break;
	    } 

	    // 将配置好的RGB占空比同步到"设定占空比"变量（set_xxx_duty），供后续模式控制（如常亮、闪烁）调用
	   	led_control.set_red_duty   = led_control.red_duty;
		led_control.set_green_duty = led_control.green_duty;
		led_control.set_blue_duty  = led_control.blue_duty;

	}
	
	map_0_255_to_1000_0(led_control.red_duty, led_control.green_duty, led_control.blue_duty);

}





