#ifndef SC8F054_DEFINE_H
#define SC8F054_DEFINE_H

#define KEY     RB0
#define DATA    RB0
#define UART_TX RB1
#define SCK     RB4
#define CSN     RB5

/* RX-only product, no debug UART; unused features off by default. */
#define FEATURE_RF_RESET_ENABLE  0
#define FEATURE_RF_TX_ENABLE     0
#define FEATURE_SOFT_UART_ENABLE 0

#define ADD_DAT               14   // default logic channel (match reference)

#define SECOND_US_MIN         15   // protocol header high pulse min (us)
#define SECOND_US_MAX         25   // protocol header high pulse max (us)
#define NUM0_US_MIN		      3    // data bit 0 high pulse min (us)
#define NUM0_US_MAX		      7    // data bit 0 high pulse max (us)
#define NUM1_US_MIN		      8    // data bit 1 high pulse min (us)
#define NUM1_US_MAX		      12   // data bit 1 high pulse max (us)

#define	KEY_UP_TIME           30   // key stable release time
#define	KEY_UP_TIMEOUT        255  // key release timeout

#define	KEY_SHORT_DOWN_TIME   30   // key stable press time
#define	KEY_LONG_DOWN_TIME    1000 // key long-press time
#define	KEY_DOWN_TIMEOUT      3000 // key press timeout

#define LED_OFF               0    // off
#define LED_RED               1    // red
#define LED_GREEN             2    // green
#define LED_BLUE              3    // blue
#define LED_PINK              4    // pink
#define LED_WHITE             5    // white
#define LED_YELLOW            6    // yellow
#define LED_LIGHT_GREEN       7    // light green
#define LED_LIGHT_BLUE        8    // light blue
#define LED_LIGHT_PINK        9    // light pink
#define LED_LIGHT_YELLOW      10   // light yellow
#define LED_PURPLE            11   // purple
#define LED_ORANGE            12   // orange
#define LED_DARK_GREEN        13   // dark green
#define LED_CYAN              14   // cyan
#define LED_TURQUOISE         15   // turquoise

#define LED_MODE_OFF          1    // off
#define LED_MODE_ON           2    // solid on
#define LED_MODE_SLOW		  3    // slow blink
#define LED_MODE_QUICK        4    // equal on/off ~420/420 ms
#define LED_MODE_STROBE       5    // strobe
#define LED_MODE_QUICK1       6    // 0xB0 STROBE one-shot ~420 ms
#define LED_MODE_FADING       14   // breath fade
#define LED_MODE_COLOR_CHANGE 16   // 15-color cycle

#endif



