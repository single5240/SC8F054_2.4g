#ifndef SC8F054_DEFINE_H
#define SC8F054_DEFINE_H

#define KEY     RB0
//#define DODAT   RB0
#define UART_TX RB1
#define CSN     RB0
#define SCK     RB4
#define DATA    RB5

/* 当前产品为纯接收、无调试串口版本，未使用功能默认不参与编译。 */
#define FEATURE_RF_RESET_ENABLE  0
#define FEATURE_RF_TX_ENABLE     1 // 乒乓测试的主机和从机都需要发送
#define FEATURE_SOFT_UART_ENABLE 0

#define RF_PAYLOAD_SIZE       5    // 射频底层固定载荷长度，后续乒乓测试可直接复用

#define PINGPONG_ROLE_MASTER   1
#define PINGPONG_ROLE_SLAVE    2
#define PINGPONG_DEVICE_ROLE   PINGPONG_ROLE_MASTER
 // 下载从机时改为PINGPONG_ROLE_SLAVE

#if ((PINGPONG_DEVICE_ROLE != PINGPONG_ROLE_MASTER) && \
     (PINGPONG_DEVICE_ROLE != PINGPONG_ROLE_SLAVE))
#error "Invalid PINGPONG_DEVICE_ROLE"
#endif

#define	KEY_UP_TIME           30   // 按键稳定抬起时间
#define	KEY_UP_TIMEOUT        255  // 按键抬起超时时间

#define	KEY_SHORT_DOWN_TIME   30   // 按键稳定按下时间
#define	KEY_LONG_DOWN_TIME    1000 // 按键长按时间
#define	KEY_DOWN_TIMEOUT      3000 // 按键按下超时

#define LED_OFF               0    // 熄灭
#define LED_RED               1    // 红色
#define LED_GREEN             2    // 绿色
#define LED_BLUE              3    // 蓝色

#define LED_MODE_OFF          1    // 熄灭
#define LED_MODE_ON           2    // 常亮
#define LED_MODE_COLOR_CHANGE 16   // RGB三色轮播

#endif




