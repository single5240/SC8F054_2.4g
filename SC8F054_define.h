#ifndef SC8F054_DEFINE_H
#define SC8F054_DEFINE_H

/* V1.1: KEY/DATA=RB0(分时), G=RB1, B=RB2, R=RB3, CSN=RB4, SCK=RB5 */
#define KEY     RB0
#define DATA    RB0
#define UART_TX RB1
#define CSN     RB4
#define SCK     RB5

/* PORTB bit masks: RB0 KEY/DATA, RB4 CSN, RB5 SCK */
#define TRISB_SPI_OUT     0B00000000 /* SPI write: all out */
#define TRISB_SPI_DATA_IN 0B00000001 /* SPI read: DATA/RB0 in */
#define TRISB_KEY_IN      0B00000001 /* idle: KEY/RB0 in, CSN out */
#define PORTB_IDLE        0B00011110 /* CSN=1, RGB high, SCK=0, DATA latch0 */
#define WPDB_KEY          0B00000001 /* RB0 pulldown for KEY */
#define IOCB_KEY          0B00000001 /* RB0 IOC wake */

/* 当前产品为纯接收、无调试串口版本，未使用功能默认不参与编译。 */
#define FEATURE_RF_RESET_ENABLE  0
#define FEATURE_RF_TX_ENABLE     0
#define FEATURE_SOFT_UART_ENABLE 0

#define ADD_DAT               14   // 默认逻辑通道，与参考工程保持一致

#define SECOND_US_MIN         15   // 捕获遥控器发出的协议头的高电平波形最小范围
#define SECOND_US_MAX         25   // 捕获遥控器发出的协议头的高电平波形最大范围
#define NUM0_US_MIN		      3    // 捕获遥控器发出的数据位是0的高电平波形最小范围
#define NUM0_US_MAX		      7    // 捕获遥控器发出的数据位是0的高电平波形最小范围
#define NUM1_US_MIN		      8    // 捕获遥控器发出的数据位是1的高电平波形最小范围
#define NUM1_US_MAX		      12   // 捕获遥控器发出的数据位是1的高电平波形最大范围

#define	KEY_UP_TIME           30   // 按键稳定抬起时间
#define	KEY_UP_TIMEOUT        255  // 按键抬起超时时间

#define	KEY_SHORT_DOWN_TIME   30   // 按键稳定按下时间
#define	KEY_LONG_DOWN_TIME    1000 // 按键长按时间
#define	KEY_DOWN_TIMEOUT      3000 // 按键按下超时

#define LED_OFF               0    // 熄灭
#define LED_RED               1    // 红色
#define LED_GREEN             2    // 绿色
#define LED_BLUE              3    // 蓝色
#define LED_PINK              4    // 粉色
#define LED_WHITE             5    // 白色
#define LED_YELLOW            6    // 黄色
#define LED_LIGHT_GREEN       7    // 浅绿色
#define LED_LIGHT_BLUE        8    // 浅蓝色
#define LED_LIGHT_PINK        9    // 浅粉色
#define LED_LIGHT_YELLOW      10   // 浅黄色
#define LED_PURPLE            11   // 紫色
#define LED_ORANGE            12   // 橙色
#define LED_DARK_GREEN        13   // 深绿色
#define LED_CYAN              14   // 蓝绿色
#define LED_TURQUOISE         15   // 宝石绿色

#define LED_MODE_OFF          1    // 熄灭
#define LED_MODE_ON           2    // 常亮
#define LED_MODE_SLOW		  3    // 慢闪
#define LED_MODE_QUICK        4    // 快闪
#define LED_MODE_STROBE       5    // 频闪
#define LED_MODE_QUICK1       6    // 间隔快闪
#define LED_MODE_FADING       14   // 呼吸灯
#define LED_MODE_COLOR_CHANGE 16   // 15色轮播

#endif




