#include <sc.h>					
#include "SC8F054_define.h"	
#include "SC8F054_var.h"	

/**
 * Key_Scan
 * Detect press/release and update key state flags; call periodically.
 */
void Key_Scan(void)
{
	if (KEY)                                  // key pressed
    {
        if(!key_control.key_down_pb)          // rising edge (was not pressed)
        {
			key_control.key_rec_flag_pb  = 1; // 
            key_control.key_up_pb        = 0; // clear release flag
            key_control.key_down_pb      = 1; // set press flag
            key_control.key_down_time_pb = 0; // reset press timer
            key_control.key_up_time_pb   = 0; // reset release timer
            key_control.key_flag_pb      = 0; // clear short-press flag
            key_control.key_long_flag_pb = 0; // clear long-press flag
            key_control.key_pb           = 0; // clear event flag
        }
        else                                                                                   
        {
            if((key_control.key_down_time_pb > KEY_SHORT_DOWN_TIME) && !key_control.key_flag_pb)     // short press armed
            {
                key_control.key_flag_pb = 1;  // set short-press flag
            }
            if((key_control.key_down_time_pb > KEY_LONG_DOWN_TIME) && !key_control.key_long_flag_pb) // long press (~1 s)
            {
                key_control.key_long_flag_pb = 1; // set long-press flag
                key_control.key_pb           = 1; // fire key event
            }
        }
    }
    else
    {
    	// key just released
        if(!key_control.key_up_pb)                                           
        {
            key_control.key_up_pb      = 1;
            key_control.key_up_time_pb = 0;
        }
        else // key still released
        {
            if(key_control.key_up_time_pb > 50)  // release stable >50 ms
            {
                key_control.key_down_pb = 0;     // clear press flag (idle)
				key_control.key_rec_flag_pb = 0;  // resume RF after any key release
                if(key_control.key_flag_pb && (key_control.key_long_flag_pb == 0)) // short press valid
                {
					key_control.key_flag_pb 	= 0; // clear short-press (once)
                    key_control.key_pb      	= 1; // fire short-press event
                }
            }
        }
    }
}

/**
 * Key_Event
 * Handle long/short press actions; call from main loop.
 */
void Key_Event(void)
{
	if(key_control.key_pb && key_control.key_long_flag_pb)  // long press
    {
		key_control.key_pb = 0;                    // clear event
        if(!soft_recieve_control.recieve_bit)      // unlocked (RF not locking key)
		{
			led_control.led_color            = 0;
			led_control.led_mode             = 0;
			sleep_control.sleep_count        = 3;  // reset sleep counter
			sleep_control.sleep_flag         = 1;  // enter sleep
			sleep_control.recieve_sleep_flag = 0;
        }
    }
    else if(key_control.key_pb == 1)                // short press
    {
	    key_control.key_pb = 0;   				    // clear short-press event
		if(!soft_recieve_control.recieve_bit)       // unlocked (RF not locking key)
		{
            sleep_control.sleep_count 	      = 20; // postpone idle sleep after key
			sleep_control.recieve_sleep_flag  = 1;  // block sleep
			soft_recieve_control.randnum_flag = 0;  // block random refresh
 
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
			else if(led_control.led_color < LED_TURQUOISE)
            {
				led_control.led_color++;
                led_control.led_mode = LED_MODE_ON;
            }
			else
            {
				led_control.led_color      = LED_RED;
                led_control.led_mode       = LED_MODE_COLOR_CHANGE;
                led_control.led_mode_count = 0;
                led_control.color_p        = 0;
            }
			
										   
		}
    }
}


/**
 * Key_Check_Time
 * Advance press/release timers; call from Timer ISR.
 */
void Key_Check_Time(void)
{
	if(key_control.key_down_pb)                              // while pressed
	{
		key_control.key_down_time_pb++;                      // press time++
		if(key_control.key_down_time_pb >= KEY_DOWN_TIMEOUT) // clamp at 3000 ms
		{    			    
			key_control.key_down_time_pb = KEY_DOWN_TIMEOUT; 
		}
	}
	if(key_control.key_up_pb)                                // while released
	{
		key_control.key_up_time_pb++;                        // release time++
		if(key_control.key_up_time_pb >= KEY_UP_TIMEOUT)     // clamp at 255 ms
		{				    
			key_control.key_up_time_pb = KEY_UP_TIMEOUT;
		}
	}
}
