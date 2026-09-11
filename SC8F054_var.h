#ifndef SC8F054_VAR_H
#define SC8F054_VAR_H

typedef unsigned char  U8;
typedef unsigned short U16;

typedef struct
{
	unsigned key_pb           : 1;   // 按键事件标志位
	unsigned key_down_pb      : 1;   // 按键按下标志位
	unsigned key_flag_pb      : 1;   // 短按按下标志位
	unsigned key_up_pb        : 1;   // 按键抬起标志位
	unsigned key_long_flag_pb : 1;   // 长按按下标志位
	unsigned key_hx_flag_pb   : 1;   // 按键按下标志位
	unsigned key_rec_flag_pb   : 1;   // 按键按下标志位
	unsigned char  key_up_time_pb;   // 计数按键抬起时间      
	unsigned short key_down_time_pb; // 计数按键按压时间 
} KEY_CONTROL;

typedef struct
{
	unsigned sleep_flag         : 1; // 休眠标志位
	unsigned recieve_sleep_flag : 1; // 接收数据休眠标志位，防止在200ms醒来期间收到杂波，唤醒
	U16 sleep_count;                 // 休眠时间
} SLEEP_CONTROL;

typedef struct
{
	unsigned char red_duty;              // 红色占空比
	unsigned char green_duty;            // 绿色占空比
	unsigned char blue_duty;             // 蓝色占空比
	unsigned char set_red_duty;          // 设置红色占空比
	unsigned char set_green_duty;        // 设置绿色占空比
	unsigned char set_blue_duty;         // 设置蓝色占空比
	unsigned char led_color;             // 灯颜色切换
	unsigned char led_mode;              // 灯控模式
	unsigned char led_mode_count;        // 灯控模式计数器
	unsigned char color_p;				 // 记录颜色
	unsigned char count_1ms;             // 计数1ms
	unsigned char count_10ms;            // 计数10ms
	unsigned char count_100ms;           // 计数100ms
} LED_CONTROL;

typedef struct
{
	unsigned char sequence;
	unsigned char color;
	unsigned char state;
	unsigned char wait_10ms;
	unsigned char led_10ms;
} PINGPONG_CONTROL;

// 放在这里是变成全局变量，调用了ny8_lib.h文件就可以用，这样做，空间会变大一些
extern SLEEP_CONTROL        sleep_control;
extern KEY_CONTROL          key_control;
extern LED_CONTROL          led_control;
extern volatile PINGPONG_CONTROL pingpong_control;
extern unsigned char        rf_data[RF_PAYLOAD_SIZE];

void Key_Scan(void);
void Key_Event(void);
void Key_Check_Time(void);
void Init_System(void);
void Led_Color_Prg(void);
void PingPong_Init(void);
void PingPong_Task(void);
void PingPong_10ms(void);
void Sleep_Mode(void);
void map_0_255_to_1000_0(U8 red_duty, U8 green_duty, U8 blue_duty);
#if FEATURE_SOFT_UART_ENABLE
void Uart_Send_Receive(void);
void UART_Send_Byte(unsigned char dat);
#endif
void Delay_1ms(void);
void Delay_ms(unsigned char x);
void Delay_us(unsigned char x);
void Delay_3us(void);
#if FEATURE_RF_TX_ENABLE
void RF_Tx_Mode(void);
#endif
void RF_Rx_Mode(void);
void XL2400T_Init(void);
unsigned char XL2400T_Self_Test(void);
#if FEATURE_RF_TX_ENABLE
unsigned char RF_TX_Data(unsigned char* tx_buff);
#endif
unsigned char RF_RX_Data(unsigned char* rx_buff);
void RF_CE_High(void);
void RF_CE_Low(void);
#if FEATURE_RF_RESET_ENABLE
void RF_Reset(void);
#endif
void RF_SPI_Write_Reg(unsigned char RF_Reg, unsigned char W_Data);


#endif

