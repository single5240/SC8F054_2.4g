#ifndef SC8F054_VAR_H
#define SC8F054_VAR_H

typedef unsigned char  U8;
typedef unsigned short U16;

typedef struct
{
	unsigned key_pb           : 1;   // key event flag
	unsigned key_down_pb      : 1;   // key pressed flag
	unsigned key_flag_pb      : 1;   // short-press flag
	unsigned key_up_pb        : 1;   // key released flag
	unsigned key_long_flag_pb : 1;   // long-press flag
	unsigned key_hx_flag_pb   : 1;   // wake/restore key flag
	unsigned key_rec_flag_pb   : 1;   // key held (RF pause) flag
	unsigned char  key_up_time_pb;   // key release time counter
	unsigned short key_down_time_pb; // key press time counter
} KEY_CONTROL;

typedef struct
{
	unsigned sleep_flag         : 1; // sleep request flag
	unsigned recieve_sleep_flag : 1; // RX-active: block sleep during WDT wake window
	U16 sleep_count;                 // idle/sleep time counter
} SLEEP_CONTROL;

typedef struct
{
	unsigned char breath_flag;           // breath direction flag
	unsigned char red_duty;              // red duty
	unsigned char green_duty;            // green duty
	unsigned char blue_duty;             // blue duty
	unsigned char set_red_duty;          // target red duty
	unsigned char set_green_duty;        // target green duty
	unsigned char set_blue_duty;         // target blue duty
	unsigned char led_color;             // LED color index
	unsigned char led_mode;              // LED mode
	unsigned char led_mode_count;        // LED mode phase counter
	unsigned char breath_time;           // breath step timer
	unsigned char breath_start_off_time; // breath step interval
	unsigned char mode_t;				 // saved mode
	unsigned char color_p;				 // saved color
	unsigned char count_1ms;             // 1 ms tick
	unsigned char count_10ms;            // 10 ms tick
	unsigned char count_100ms;           // 100 ms tick
	unsigned char count_1000ms;          // 1000 ms tick
	unsigned char last_quick_led;        // last non-off color for quick/strobe
	unsigned char breath_step_r;
	unsigned char breath_step_g;
	unsigned char breath_step_b;
	unsigned char quick_control;         // quick/strobe control active
	unsigned char add_data;         	 // logic channel (1..16)
} LED_CONTROL;

typedef struct
{
	unsigned      jump_flag      : 1; // level-edge flag
	unsigned      recieve_bit    : 1; // key lock from RF
	unsigned      clear_bit      : 1; // clear RX state flag
	unsigned      rand_flag      : 1; // random ready (1=hold)
	unsigned      Snowflake_flag : 1; // snowflake mode active
	unsigned      randnum_flag   : 1; // allow random refresh
	unsigned      quick_flag     : 1; // quick enable
	unsigned      dmx_flag       : 1; // DMX RX flag
	unsigned char stroge_flag;        // interval-quick flag
	unsigned char start_flag;         // RX frame start flag
	unsigned char high_count;         // pulse high counter
	unsigned char recieve_data;       // bit-shift assemble
	unsigned char data_bit_count;     // bit count
	unsigned char data_length_count;  // payload length
	unsigned char dalay_time;         // DMX sync delay for blink/strobe
	unsigned char function_data;      // protocol command byte
	unsigned char temp0;			  // last frame byte0 (dedupe)
	unsigned char temp1;    		  // last frame byte1 (dedupe)
	unsigned char temp2;			  // last frame byte2 (dedupe)
	unsigned char temp3;			  // last frame byte3 (dedupe)
	unsigned char rand_num;           // random 1..8
	unsigned char Channel;			  // channel bitmap byte
	unsigned char dmx_count;          // DMX RX count
	unsigned char Snowflake_dit_off;  // snowflake off counter
	unsigned      flow_active     : 1; // 0x40 chase active; keep phase
	unsigned      last_frame_valid: 1; // last normal frame valid for dedupe
} SOFT_RECIEVE_CONTROL;

// Globals shared across modules (larger than static locals)
extern SLEEP_CONTROL        sleep_control;
extern SOFT_RECIEVE_CONTROL soft_recieve_control;
extern KEY_CONTROL          key_control;
extern LED_CONTROL          led_control;
extern unsigned char        soft_data[5];

void Key_Scan(void);
void Key_Event(void);
void Key_Check_Time(void);
void Init_System(void);
void Led_Color_Prg(void);
void Sleep_Mode(void);
void Soft_Decode(void);
void Soft_Count(void);
void Rand_num(void);
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
