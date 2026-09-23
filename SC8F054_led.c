#include <sc.h>					
#include "SC8F054_define.h"	
#include "SC8F054_var.h"	

/* led_color 0..15, packed R,G,B */
static const unsigned char led_rgb_tab[48] = {
	  0,   0,   0,
	255,   0,   0,
	  0, 255,   0,
	  0,   0, 255,
	255,   0,  60,
	255, 255, 255,
	160,  50,   0,
	 74, 255,  63,
	 50, 100, 255,
	205,  43,  63,
	255, 160,   1,
	255,  20, 200,
	255,  20,   0,
	 10, 180,  50,
	  0, 191, 255,
	100, 255,   0
};

/* Matches led_rgb_tab: duty/10, cached for breath steps */
static const unsigned char led_rgb_step_tab[48] = {
	 0,  0,  0,
	25,  0,  0,
	 0, 25,  0,
	 0,  0, 25,
	25,  0,  6,
	25, 25, 25,
	16,  5,  0,
	 7, 25,  6,
	 5, 10, 25,
	20,  4,  6,
	25, 16,  0,
	25,  2, 20,
	25,  2,  0,
	 1, 18,  5,
	 0, 19, 25,
	10, 25,  0
};

void map_0_255_to_1000_0(U8 red_duty, U8 green_duty, U8 blue_duty)
{
	unsigned int duty_10bit;
	U8 duty;
	unsigned char ch;

	for(ch = 0; ch < 3; ch++)
	{
		if(ch == 0)      duty = red_duty;
		else if(ch == 1) duty = green_duty;
		else             duty = blue_duty;

		duty_10bit = (unsigned int)duty << 2;
		if(duty >= 85)  duty_10bit++;
		if(duty >= 170) duty_10bit++;
		if(duty == 255) duty_10bit++;

		if(ch == 0)
		{
			PWMD23H = (U8)((duty_10bit >> 8) & 0x03);
			PWMD2L  = (U8)duty_10bit;
		}
		else if(ch == 1)
		{
			PWMD01H = (U8)(((duty_10bit >> 8) & 0x03) << 4);
			PWMD1L  = (U8)duty_10bit;
		}
		else
		{
			PWMTH  = (U8)(0x0F | (((duty_10bit >> 8) & 0x03) << 4));
			PWMD4L = (U8)duty_10bit;
		}
	}
}

void Led_Color_Prg(void)
{
	unsigned char idx;
	const unsigned char *p;

	if((led_control.color_p != led_control.led_color) && (led_control.led_mode != 1))
	{
		led_control.color_p = led_control.led_color;
		idx = led_control.led_color;
		if(idx > 15)
		{
			idx = 0;
		}

		p = &led_rgb_tab[idx + idx + idx];
		led_control.red_duty   = p[0];
		led_control.green_duty = p[1];
		led_control.blue_duty  = p[2];
		if(idx == 0)
		{
			PWMCON0 = 0x00;
		}
		else
		{
			PWMCON0 = 0x16;
		}

		led_control.set_red_duty   = led_control.red_duty;
		led_control.set_green_duty = led_control.green_duty;
		led_control.set_blue_duty  = led_control.blue_duty;

		p = &led_rgb_step_tab[idx + idx + idx];
		led_control.breath_step_r = p[0];
		led_control.breath_step_g = p[1];
		led_control.breath_step_b = p[2];

		if((led_control.led_mode == LED_MODE_FADING) && (led_control.breath_flag == 1))
		{
			led_control.red_duty   = 0;
			led_control.green_duty = 0;
			led_control.blue_duty  = 0;
		}
	}

	map_0_255_to_1000_0(led_control.red_duty, led_control.green_duty, led_control.blue_duty);
}
