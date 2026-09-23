#ifndef __FW_XL2400_H__
#define __FW_XL2400_H__

/*********************************************************************/
/************************* Register addresses ************************/
/*********************************************************************/

#define CFG_TOP				(0X00)
#define	EN_AA				(0X01)
#define	EN_RXADDR			(0X02)
#define	SETUP_AW			(0X03)
#define	SETUP_RETR			(0X04)
#define	RF_CH				(0X05)
#define	RF_SETUP			(0X06)
#define	RF_STATUS			(0X07)
#define	OBSERVE_TX			(0X08)
#define	RSSI				(0X09)
#define	RX_ADDR_P0			(0X0A)
#define	RX_ADDR_P1			(0X0B)
#define	RX_ADDR_P2			(0X2)
#define	RX_ADDR_P3			(0X3)
#define	RX_ADDR_P4			(0X4)
#define	RX_ADDR_P5			(0X5)
#define	RX_ADDR_P2TOP5		(0X0C)
#define	BER_RESULT			(0X0D)
#define	AGC_SETTING			(0X0E)
#define	PGA_SETTING			(0X0F)
#define	TX_ADDR				(0X10)
#define	RX_PW_PX			(0X11)
#define	ANALOG_CFG0			(0X12)
#define	ANALOG_CFG1			(0X13)
#define	ANALOG_CFG2			(0X14)
#define	ANALOG_CFG3			(0X15)
#define	STATUS_FIFO			(0X17)
#define	RSSIREC				(0X18)
#define	TXPROC_CFG			(0X19)
#define	RXPROC_CFG			(0X1A)	
#define	DYNPD				(0X1C)
#define	FEATURE				(0X1D)
#define	RAMP_CFG			(0X1E)

/*********************************************************************/
/*************************** SPI commands ****************************/
/*********************************************************************/

#define	R_REGISTER		    0x00 // read register
#define	W_REGISTER		    0x20 // write register
#define R_RX_PLOAD 			0x61 // read RX payload
#define W_TX_PLOAD			0xA0 // write TX payload
#define FLUSH_TX			0xE1 // flush TX FIFO
#define FLUSH_RX			0xE2 // flush RX FIFO
#define R_RX_PL_WID			0x60 // read RX payload width
#define W_ACK_PLOAD			0xA8
#define W_TX_PLOAD_NOACK	0xB0
#define CMD_NOP				0xFF // no operation

#define C_DR_1M             0x02 // 1 Mbps
#define C_DR_250K           0x22 // 250 kbps

#define RX_DR    		    (0x40) // RX data ready IRQ
#define TX_DS    		    (0x20) // TX data sent IRQ
#define MAX_RT   		    (0x10) // max retransmit IRQ

#define RF_PACKET_SIZE		 8     // packet size config

// XL2400T TX power levels
#define C_RF13dBm 			36 	   // 13 dBm
#define C_RF12dBm 			30 	   // 12 dBm
#define C_RF11dBm 			24 	   // 11 dBm
#define C_RF10dBm 			19	   // 10 dBm
#define C_RF9dBm 			16 	   // 9 dBm
#define C_RF8dBm 			14 	   // 8 dBm
#define C_RF7dBm 			12 	   // 7 dBm
#define C_RF5dBm 			9 	   // 5 dBm
#define C_RF3dBm 			8 	   // 3 dBm
#define C_RF0dBm 			6 	   // 0 dBm
#define C_RF_4dBm 			4 	   // -4 dBm
#define C_RF_9dBm 			2 	   // -9 dBm
#define C_RF_10dBm 			1 	   // -10 dBm

#define RX_DR_FLAG               0X40   // Data ready
#define TX_DS_FLAG               0X20   // Data sent
#define RX_TX_CMP_FLAG           0X60   // Data sent & acked
#define MAX_RT_FLAG              0X10   // Max retried

#define XL2400_TEST_ADDR         "XL240"

#define RF_TX_Power             C_RF7dBm    // default TX power


#endif
