#include <sc.h>
#include "SC8F054_define.h"
#include "SC8F054_var.h"

#define PINGPONG_FRAME_HEAD          0xA5
#define PINGPONG_FRAME_REQUEST       0x01
#define PINGPONG_FRAME_REPLY         0x02
#define PINGPONG_LED_TIME_10MS       10
#define PINGPONG_REPLY_TIME_10MS     20
#define PINGPONG_NEXT_TIME_10MS      30

#define PINGPONG_STATE_SEND          0
#define PINGPONG_STATE_WAIT_REPLY    1
#define PINGPONG_STATE_WAIT_NEXT     2

/* 固定5字节测试帧：帧头、类型、序号、颜色、前4字节异或校验。 */
volatile PINGPONG_CONTROL pingpong_control = {0, LED_RED, PINGPONG_STATE_SEND, 0, 0};
unsigned char rf_data[RF_PAYLOAD_SIZE] = {0};

static unsigned char PingPong_Checksum(unsigned char *data)
{
	unsigned char checksum;

	checksum = data[0];
	checksum ^= data[1];
	checksum ^= data[2];
	checksum ^= data[3];
	return checksum;
}

static unsigned char PingPong_Frame_Valid(unsigned char frame_type)
{
	if((rf_data[0] != PINGPONG_FRAME_HEAD) ||
	   (rf_data[1] != frame_type) ||
	   (rf_data[3] < LED_RED) ||
	   (rf_data[3] > LED_BLUE))
	{
		return 0;
	}

	if(PingPong_Checksum(rf_data) != rf_data[4])
	{
		return 0;
	}

	return 1;
}

static void PingPong_Build_Frame(unsigned char frame_type,
								unsigned char sequence,
								unsigned char color)
{
	rf_data[0] = PINGPONG_FRAME_HEAD;
	rf_data[1] = frame_type;
	rf_data[2] = sequence;
	rf_data[3] = color;
	rf_data[4] = PingPong_Checksum(rf_data);
}

static void PingPong_Flash(unsigned char color)
{
	led_control.color_p   = LED_OFF;
	led_control.led_color = color;
	led_control.led_mode  = LED_MODE_ON;
	pingpong_control.led_10ms = PINGPONG_LED_TIME_10MS;
	Led_Color_Prg();
}

static void PingPong_Keep_Awake(void)
{
	sleep_control.sleep_flag = 0;
	sleep_control.recieve_sleep_flag = 1;
	sleep_control.sleep_count = 20;
}

static void PingPong_Send(void)
{
	TRISB = 0B00000000;
	RF_Tx_Mode();
	RF_TX_Data(rf_data);
	RF_Rx_Mode();
	TRISB = 0B00000001;
	PingPong_Keep_Awake();
}

void PingPong_Init(void)
{
	pingpong_control.sequence = 0;
	pingpong_control.color = LED_RED;
	pingpong_control.state = PINGPONG_STATE_SEND;
	pingpong_control.wait_10ms = 0;
	pingpong_control.led_10ms = 0;
	led_control.led_color = LED_OFF;
	led_control.led_mode = LED_MODE_OFF;
	PingPong_Keep_Awake();
}

void PingPong_10ms(void)
{
	if(pingpong_control.wait_10ms)
	{
		pingpong_control.wait_10ms--;
	}

	if(pingpong_control.led_10ms)
	{
		pingpong_control.led_10ms--;
		if(pingpong_control.led_10ms == 0)
		{
			led_control.led_color = LED_OFF;
			led_control.led_mode = LED_MODE_OFF;
		}
	}
}

void PingPong_Task(void)
{
#if PINGPONG_DEVICE_ROLE == PINGPONG_ROLE_MASTER
	if(pingpong_control.state == PINGPONG_STATE_SEND)
	{
		PingPong_Build_Frame(PINGPONG_FRAME_REQUEST,
						 pingpong_control.sequence,
						 pingpong_control.color);
		PingPong_Flash(pingpong_control.color);
		PingPong_Send();
		pingpong_control.wait_10ms = PINGPONG_REPLY_TIME_10MS;
		pingpong_control.state = PINGPONG_STATE_WAIT_REPLY;
	}
	else if(pingpong_control.state == PINGPONG_STATE_WAIT_REPLY)
	{
		if(RF_RX_Data(rf_data))
		{
			if(PingPong_Frame_Valid(PINGPONG_FRAME_REPLY) &&
			   (rf_data[2] == pingpong_control.sequence) &&
			   (rf_data[3] == pingpong_control.color))
			{
				pingpong_control.wait_10ms = PINGPONG_NEXT_TIME_10MS;
				pingpong_control.state = PINGPONG_STATE_WAIT_NEXT;
			}
		}
		else if(pingpong_control.wait_10ms == 0)
		{
			pingpong_control.state = PINGPONG_STATE_SEND;
		}
	}
	else
	{
		RF_RX_Data(rf_data);
		if(pingpong_control.wait_10ms == 0)
		{
			pingpong_control.sequence++;
			pingpong_control.color++;
			if(pingpong_control.color > LED_BLUE)
			{
				pingpong_control.color = LED_RED;
			}
			pingpong_control.state = PINGPONG_STATE_SEND;
		}
	}
#else
	if(RF_RX_Data(rf_data))
	{
		if(PingPong_Frame_Valid(PINGPONG_FRAME_REQUEST))
		{
			pingpong_control.sequence = rf_data[2];
			pingpong_control.color = rf_data[3];
			PingPong_Flash(pingpong_control.color);
			PingPong_Build_Frame(PINGPONG_FRAME_REPLY,
							 pingpong_control.sequence,
							 pingpong_control.color);
			PingPong_Send();
		}
	}
#endif
}
