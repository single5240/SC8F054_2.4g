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
	unsigned char breath_flag;           // 呼吸灯标志位
	unsigned char red_duty;              // 红色占空比
	unsigned char green_duty;            // 绿色占空比
	unsigned char blue_duty;             // 蓝色占空比
	unsigned char set_red_duty;          // 设置红色占空比
	unsigned char set_green_duty;        // 设置绿色占空比
	unsigned char set_blue_duty;         // 设置蓝色占空比
	unsigned char led_color;             // 灯颜色切换
	unsigned char led_mode;              // 灯控模式
	unsigned char led_mode_count;        // 灯控模式计数器
	unsigned char breath_time;           // 呼吸灯计数
	unsigned char breath_start_off_time; // 呼吸
	unsigned char mode_t;				 // 记录模式
	unsigned char color_p;				 // 记录颜色
	unsigned char count_1ms;             // 计数1ms
	unsigned char count_10ms;            // 计数10ms
	unsigned char count_100ms;           // 计数100ms
	unsigned char count_1000ms;          // 计数1000ms
	unsigned char last_quick_led;        // 获取上一次灯的颜色
	unsigned char breat_time_control;    // 呼吸灯和贪吃蛇的控制时间
	unsigned char quick_control;         // 快闪控制标志位
	unsigned char add_data;         	 // 通道获取值
} LED_CONTROL;

typedef struct
{
	unsigned      jump_flag      : 1; // 电平跳变标志位
	unsigned      recieve_bit    : 1; // 接收锁定标志位 
	unsigned      clear_bit      : 1; // 清除接收状态标志位 
	unsigned      rand_flag      : 1; // 随机数生成标志位 
	unsigned      Snowflake_flag : 1; // 雪花轮闪激活标志位 
	unsigned      randnum_flag   : 1; // 随机数获取使能标志位
	unsigned      quick_flag     : 1; // 快闪使能标志位
	unsigned      dmx_flag       : 1; // dmx接收标志位
	unsigned char stroge_flag;        // 间隔快闪标志位   
	unsigned char start_flag;         // 接收数据开始标志位
	unsigned char high_count;         // 接受码计数
	unsigned char recieve_data;       // 接受码数据获取
	unsigned char data_bit_count;     // 接受码数据获取
	unsigned char data_length_count;  // 接收数据长度
	unsigned char dalay_time;         // DMX刷时间，保持快闪和频闪同步
	unsigned char function_data;      // 获取协议功能
	unsigned char temp0;			  // 记录上一次的数组第0个的数据，防止帧重复
	unsigned char temp1;    		  // 记录上一次的数组第1个的数据，防止帧重复
	unsigned char temp2;			  // 记录上一次的数组第2个的数据，防止帧重复
	unsigned char temp3;			  // 记录上一次的数组第3个的数据，防止帧重复
	unsigned char Channel;			  // 获取通道1-8的数据
	unsigned char dmx_count;          // dmx接收次数
	unsigned char Snowflake_dit_off;  // 随机计数
	unsigned      flow_active     : 1; // 0x40流水灯效已启动，后续帧不复位相位
	unsigned      last_frame_valid: 1; // 上一普通控制帧有效
} SOFT_RECIEVE_CONTROL;

// 放在这里是变成全局变量，调用了ny8_lib.h文件就可以用，这样做，空间会变大一些
extern SLEEP_CONTROL        sleep_control;
extern SOFT_RECIEVE_CONTROL soft_recieve_control;
extern KEY_CONTROL          key_control;
extern LED_CONTROL          led_control;
extern unsigned char        soft_data[34];

void Key_Scan(void);
void Key_Event(void);
void Key_Check_Time(void);
void Init_System(void);
void Led_Color_Prg(void);
void Sleep_Mode(void);
void Soft_Decode(void);
void Soft_Count(void);
void map_0_255_to_1000_0(U8 red_duty, U8 green_duty, U8 blue_duty);
void Uart_Send_Receive(void);
void UART_Send_Byte(unsigned char dat);
void Delay_1ms(void);
void Delay_ms(unsigned char x);
void Delay_us(unsigned char x);
void Delay_3us(void);
void RF_Tx_Mode(void);
void RF_Rx_Mode(void);
void XL2400T_Init(void);
unsigned char RF_TX_Data(unsigned char* tx_buff);
unsigned char RF_RX_Data(unsigned char* rx_buff);
void RF_CE_High(void);
void RF_CE_Low(void);
void RF_Reset(void);
void RF_SPI_Write_Reg(unsigned char RF_Reg, unsigned char W_Data);


#endif

