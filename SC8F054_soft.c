#include <sc.h>
#include "SC8F054_define.h"
#include "SC8F054_var.h"

/**----------------------------------------------------------------------------------------------**
 **函数名  ：解码函数
 **功能    ：校验并解析XL2400T的5字节数据帧，执行非电机类按键锁定与LED控制逻辑
 **参数    ：无
 **返回值  ：无
 **----------------------------------------------------------------------------------------------**/
void Soft_Decode(void)
{
	unsigned char command;
	unsigned char mode;
	unsigned char color;
	unsigned char selected;
	unsigned char mask;
	unsigned char value;

	if(soft_recieve_control.data_length_count != 5)
	{
		return;
	}

	if(((soft_data[0] + soft_data[1] + soft_data[2] + soft_data[3]) & 0x0ff) != soft_data[4])
	{
		soft_recieve_control.data_length_count = 0;
		return;
	}

	command = soft_data[3];
	selected = 0;
	if((led_control.add_data >= 1) && (led_control.add_data <= 8))
	{
		mask = (unsigned char)(1 << (led_control.add_data - 1));
		selected = (soft_data[0] & mask) ? 1 : 0;
	}
	else if(led_control.add_data <= 16)
	{
		mask = (unsigned char)(1 << (led_control.add_data - 9));
		selected = (soft_data[1] & mask) ? 1 : 0;
	}

	/* 只有本机灯效、全局灯效和本机DMX帧锁定按键；解锁命令必须选中本机。 */
	if(command != 0x60)
	{
		if((command == 0xD0) || (command == 0xF0) ||
		   ((command == 0xA0) && (soft_data[0] == led_control.add_data)))
		{
			soft_recieve_control.recieve_bit = 1;
		}
		else if(selected && ((command == 0x20) || (command == 0x40) ||
		        (command == 0x80) || (command == 0xB0) ||
		        (command == 0xC0) || (command == 0xE0)))
		{
			soft_recieve_control.recieve_bit = 1;
		}
	}

	if(command != 0x40)
	{
		soft_recieve_control.flow_active = 0;
	}

	/* DMX帧按通道逐帧更新，不参与普通控制帧去重；通道0为全局同步校相。 */
	if(command == 0xA0)
	{
		sleep_control.sleep_count = 13;
		sleep_control.recieve_sleep_flag = 1;
		soft_recieve_control.randnum_flag = 0;
		if(soft_data[0] == 0)
		{
			/* 全局同步：统一慢闪/快闪/频闪相位 */
			led_control.led_mode_count = 0;
		}
		else if(soft_data[0] == led_control.add_data)
		{
			led_control.led_mode       = (soft_data[1] >> 4) & 0x0f;
			led_control.led_color      = LED_OFF;
			led_control.color_p        = LED_OFF;
			led_control.set_red_duty   = (soft_data[1] & 0x0f) * 17;
			led_control.set_green_duty = ((soft_data[2] >> 4) & 0x0f) * 17;
			led_control.set_blue_duty  = (soft_data[2] & 0x0f) * 17;
			if(led_control.led_mode == LED_MODE_OFF)
			{
				led_control.led_mode_count = 0;
				led_control.red_duty   = 0;
				led_control.green_duty = 0;
				led_control.blue_duty  = 0;
			}
			else if(led_control.led_mode == LED_MODE_ON)
			{
				led_control.led_mode_count = 0;
				led_control.red_duty   = led_control.set_red_duty;
				led_control.green_duty = led_control.set_green_duty;
				led_control.blue_duty  = led_control.set_blue_duty;
			}
			else
			{
				/* 动态灯效只更新参数，相位由通道0同步帧校相 */
				led_control.red_duty   = led_control.set_red_duty;
				led_control.green_duty = led_control.set_green_duty;
				led_control.blue_duty  = led_control.set_blue_duty;
			}
		}
		soft_recieve_control.data_length_count = 0;
		soft_recieve_control.Channel = 0;
		soft_recieve_control.function_data = 0;
		return;
	}

	if(soft_recieve_control.last_frame_valid &&
	   (soft_data[0] == soft_recieve_control.temp0) &&
	   (soft_data[1] == soft_recieve_control.temp1) &&
	   (soft_data[2] == soft_recieve_control.temp2) &&
	   (soft_data[3] == soft_recieve_control.temp3))
	{
		soft_recieve_control.data_length_count = 0;
		soft_recieve_control.Channel = 0;
		soft_recieve_control.function_data = 0;
		return;
	}

	soft_recieve_control.temp0 = soft_data[0];
	soft_recieve_control.temp1 = soft_data[1];
	soft_recieve_control.temp2 = soft_data[2];
	soft_recieve_control.temp3 = soft_data[3];
	soft_recieve_control.last_frame_valid = 1;
	soft_recieve_control.randnum_flag = 0;
	sleep_control.sleep_count = 13;
	sleep_control.recieve_sleep_flag = 1;
	soft_recieve_control.function_data = command;
	soft_recieve_control.Channel = soft_data[0];

	color = (soft_data[2] >> 4) & 0x0f;
	mode  = soft_data[2] & 0x0f;

	switch(command)
	{
		case 0x20:                                  // 开关及基础灯效
			if(selected)
			{
				led_control.led_color = color;
				led_control.led_mode  = mode;
				led_control.led_mode_count = 0;
				led_control.quick_control = 0;
				if(color != LED_OFF)
				{
					led_control.last_quick_led = color;
				}
			}
			break;

		case 0x40:                                  // 流水/跑马
			if(!soft_recieve_control.flow_active)
			{
				soft_recieve_control.flow_active = 1;
				led_control.led_mode_count = 0;
			}
			led_control.led_mode = mode;
			led_control.led_color = (selected && (color != LED_OFF)) ? color : LED_OFF;
			break;

		case 0x60:                                  // 解锁本机按键
			if(selected)
			{
				soft_recieve_control.recieve_bit = 0;
				led_control.led_color = color;
				led_control.led_mode  = mode;
				led_control.led_mode_count = 0;
			}
			break;

		case 0x80:                                  // 10级呼吸渐变
			if(selected)
			{
				led_control.led_color              = color;
				led_control.color_p               = 0;
				led_control.breath_time            = 0;
				led_control.breath_flag            = mode;
				led_control.breath_start_off_time  = 10;
				led_control.led_mode_count         = 10;
				led_control.breat_time_control     = 10;
				led_control.led_mode               = LED_MODE_FADING;
			}
			break;

		case 0xB0:                                  // STROBE pulse / QUICK equal blink
			value = soft_data[2] & 0x0f;
			if(selected)
			{
				led_control.quick_control = 1;
				led_control.led_mode_count = 0;
				if((value & 0x03) == 2)
				{
					led_control.led_color = LED_OFF;
					led_control.led_mode = LED_MODE_ON;
				}
				else if((value == 4) || (value == 5))
				{
					/* TX QUICK 4/5: equal blink; count cleared for multi-RX lock. */
					led_control.led_color = led_control.last_quick_led;
					led_control.led_mode = LED_MODE_QUICK;
				}
				else
				{
					/* STROBE on (low nibble 0/1): one-shot pulse. */
					led_control.led_color = led_control.last_quick_led;
					led_control.led_mode = LED_MODE_QUICK1;
				}
			}
			else if(((value & 0x03) == 2) && led_control.quick_control)
			{
				led_control.led_color = led_control.last_quick_led;
				led_control.led_mode = LED_MODE_QUICK1;
				led_control.led_mode_count = 0;
			}
			break;

		case 0xC0:                                  // 修改逻辑通道
			if(selected)
			{
				led_control.add_data = (soft_data[2] & 0x0f) + 1;
			}
			break;

		case 0xD0:                                  // 彩虹分组
			value = color + led_control.add_data;
			while(value >= 10)
			{
				value -= 10;
			}
			led_control.led_color = value + 1;
			led_control.led_mode  = mode;
			led_control.led_mode_count = 0;
			break;

		case 0xE0:                                  // 常亮
			if(selected)
			{
				led_control.led_color = color;
				led_control.led_mode  = LED_MODE_ON;
				led_control.led_mode_count = 0;
			}
			break;

		case 0xF0:                                  // 雪花轮闪
			if(mode == soft_recieve_control.rand_num)
			{
				if(!soft_recieve_control.Snowflake_flag)
				{
					soft_recieve_control.randnum_flag = 1;
					soft_recieve_control.Snowflake_flag = 1;
					soft_recieve_control.Snowflake_dit_off = 0;
					led_control.led_color = color;
					led_control.led_mode = LED_MODE_ON;
				}
			}
			if(soft_recieve_control.Snowflake_flag)
			{
				if(++soft_recieve_control.Snowflake_dit_off > 2)
				{
					soft_recieve_control.Snowflake_flag = 0;
					soft_recieve_control.Snowflake_dit_off = 0;
					led_control.led_color = LED_OFF;
					led_control.led_mode = LED_MODE_OFF;
				}
			}
			break;

		default:
			break;
	}

	soft_recieve_control.data_length_count = 0;
	soft_recieve_control.Channel = 0;
	soft_recieve_control.function_data = 0;
}
