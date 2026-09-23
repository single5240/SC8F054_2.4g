#include "SC8F054_define.h"
#include "SC8F054_var.h"
#include "xl2400t.h"
#include <sc.h>

unsigned char RF_Test_Adrress[5]={0x23, 0x24, 0x25, 0x26, 0x27}; // RF address

/*************************************************
 * SPI write one byte
**************************************************/
static void RF_SPI_Write_Byte(unsigned char buff)
{
	unsigned char i = 0;
	TRISB  = 0B00000000;
    for(i = 0; i < 8; i++)
	{
        SCK = 0;
		
        if(buff & 0x80)
		{
            DATA = 1;
		}
        else
		{
            DATA = 0;
		}
		
        buff = buff << 1;
        SCK = 1;
    }
	
    DATA = 1;
    SCK = 0;
}

/************************************************
 * SPI read one byte
 * return: byte read
*************************************************/
static unsigned char RF_SPI_Read_Byte(void)
{
	TRISB  = 0B00000001;
    unsigned char  buff = 0;
	unsigned char  i    = 0;

    for(i = 0; i < 8; i++)
    {
        SCK = 0;
        buff = buff << 1;
        SCK = 1;
        if(DATA)
		{
			buff |= 0x01;
		}         
    }
    SCK = 0;
    return buff;
}

/********************************************************************
 * Write one byte to XL2400T register
 * RF_Reg: write cmd | register address
 * W_Data: data byte
*********************************************************************/
void RF_SPI_Write_Reg(unsigned char RF_Reg, unsigned char W_Data)
{
	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg); // write address
	RF_SPI_Write_Byte(W_Data); // write data
	CSN = 1;
}

/*******************************************************
 * Read one byte from XL2400T register
 * RF_Reg: read cmd | register address
 * return: data byte
********************************************************/
unsigned char RF_SPI_Read_Reg(unsigned char RF_Reg)
{
	unsigned char rTemp = 0;
	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg);  // write address + read cmd
	rTemp = RF_SPI_Read_Byte(); // read data
	CSN = 1;
	return rTemp;
}

/*****************************************
 * Write multiple bytes to XL2400T register
 * RF_Reg: write cmd | register address
 * pBuff:  source buffer
 * Len:    length
******************************************/
void RF_Write_Buff(unsigned char RF_Reg, unsigned char *pBuff, unsigned char Len)
{
	unsigned char rTemp = 0;
	unsigned char i 	= 0;

	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg);
	for(i = 0; i < Len; i++)
	{
		rTemp = pBuff[i];
        RF_SPI_Write_Byte(rTemp);
	}
	CSN = 1;
}

/*****************************************
 * Read multiple bytes from XL2400T register
 * RF_Reg: read cmd | register address
 * pBuff:  destination buffer
 * Len:    length
******************************************/
void RF_Read_Buff(unsigned char RF_Reg, unsigned char *pBuff, unsigned char Len)
{
	unsigned char i=0;
	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg);
	for(i = 0 ; i < Len ; i++)
	{
		pBuff[i] = RF_SPI_Read_Byte();
	}
	CSN = 1;
}

/***********************************************
 * Software CE high
************************************************/
void RF_CE_High(void)
{
	RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xEF);
}

/**********************
 * Software CE low
**********************/
void RF_CE_Low(void)
{
	RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xEE);
}

/********************************************
 * Clear IRQ flags; flush TX/RX FIFOs
*********************************************/
void RF_Refresh_State(void)
{
	RF_SPI_Write_Reg(W_REGISTER + RF_STATUS, 0x70);
	RF_SPI_Write_Reg(FLUSH_TX, CMD_NOP);
	RF_SPI_Write_Reg(FLUSH_RX, CMD_NOP);
}

/**********************************
 * Set RF channel
 * Chn: channel index
**********************************/
void RF_Set_Chn(unsigned char Chn)
{
   unsigned temp = 0;
   temp  = RF_SPI_Read_Reg(EN_AA);
   temp &= ~(1 << 6);
   RF_SPI_Write_Reg(W_REGISTER + EN_AA, temp);
   RF_SPI_Write_Reg(W_REGISTER + RF_CH, Chn + 0x60);
   temp  = 0;
   temp  = RF_SPI_Read_Reg(0x00 | 0x01);
   temp |= (1<<6);
   RF_SPI_Write_Reg(W_REGISTER + EN_AA, temp);							
}

/********************************************
 * Configure TX and RX addresses
*********************************************/
void RF_Set_Address(unsigned char *AddrBuff)
{
	RF_Write_Buff(W_REGISTER + TX_ADDR,    AddrBuff, 5); /* TX address */
	RF_Write_Buff(W_REGISTER + RX_ADDR_P0, AddrBuff, 5); /* RX pipe 0 address */
}

/**********************
 * Baseband reset
 **********************/
#if FEATURE_RF_RESET_ENABLE
void RF_Reset(void)
{
   RF_SPI_Write_Reg(W_REGISTER + CFG_TOP,0xEA);
   Delay_ms(1);
   RF_SPI_Write_Reg(W_REGISTER + CFG_TOP,0xEE);
   Delay_ms(1);
}
#endif

/***************************************
 * Set TX power
****************************************/
void RF_Set_Power(unsigned char Power)
{
	unsigned char Power_Buff[3]={0};
	RF_Read_Buff(RF_SETUP, Power_Buff, 2);
	Power_Buff[1] = Power;
	RF_Write_Buff(W_REGISTER + RF_SETUP, Power_Buff ,2);
}

/*************************
 * Configure RF TX mode
 *************************/
#if FEATURE_RF_TX_ENABLE
void RF_Tx_Mode(void)
{
   unsigned char Mode_Buff[3] = {0};
   Mode_Buff[0] = 0xee; // CRC on, 2-byte
   Mode_Buff[1] = 0x80;
   RF_Write_Buff(W_REGISTER + CFG_TOP, Mode_Buff, 2);
   RF_Read_Buff(CFG_TOP, Mode_Buff, 3);
   RF_Refresh_State();
   Delay_ms(10);
   RF_Set_Chn(76);
}
#endif

/************************
 * Configure RF RX mode
************************/
void RF_Rx_Mode(void)
{
   unsigned char Mode_Buff[3] = {0};
   Mode_Buff[0] = 0xee; // CRC on, 2-byte
   Mode_Buff[1] = 0xc0; 
   RF_Write_Buff(W_REGISTER + CFG_TOP, Mode_Buff, 2);
   RF_Read_Buff(CFG_TOP, Mode_Buff, 3);
   RF_Refresh_State();
   RF_CE_High();
   RF_Read_Buff(CFG_TOP, Mode_Buff, 3);
   Delay_ms(10);
   RF_Set_Chn(76-1);
}

#if FEATURE_RF_TX_ENABLE
static unsigned char color_t = 0;
unsigned char RF_TX_Data(unsigned char* tx_buff)
{
	unsigned char Temp = 0;
	
    RF_Refresh_State();               	 // refresh state
	color_t++;
	if(color_t > 15)
		color_t = 0;

	tx_buff[0] = (0xff & 0x0ff);        // select all channels (ch 1-8)
	tx_buff[1] = ((0xff >> 8) & 0x0ff);
	tx_buff[2] = ((color_t << 4) | 2);  // color + mode
	tx_buff[3] = (0x20);                    
	tx_buff[4] = ((tx_buff[0] + tx_buff[1] + tx_buff[2] + tx_buff[3]) & 0x0ff);                
	RF_Write_Buff(W_TX_PLOAD, tx_buff, 5); // load TX payload

#if FEATURE_SOFT_UART_ENABLE
	UART_Send_Byte(tx_buff[0]); 
	UART_Send_Byte(tx_buff[1]); 
	UART_Send_Byte(tx_buff[2]); 
	UART_Send_Byte(tx_buff[3]); 
	UART_Send_Byte(tx_buff[4]); 
#endif

	RF_CE_High(); // CE high
	Delay_1ms();
	RF_CE_Low();  // CE low
	Delay_1ms();
	
	Temp = RF_SPI_Read_Reg(RF_STATUS);
#if FEATURE_SOFT_UART_ENABLE
	UART_Send_Byte(Temp); 
#endif

	// Check STATUS for TX complete
	if(RF_SPI_Read_Reg(RF_STATUS) & TX_DS) // TX_DS IRQ
	{
		RF_Refresh_State(); // flush FIFO, clear IRQ
		return 0x20;
	}
	else
	{
		RF_Refresh_State(); // flush FIFO, clear IRQ
		return 0;	
	}
}
#endif

/*************************************************
 * Receive payload
 * rx_buff: destination (5 bytes when valid)
 * return: 1 if packet handled, else 0
**************************************************/
unsigned char RF_RX_Data(unsigned char* rx_buff)
{
	unsigned char received = 0;

	TRISB  = 0B00000000;
	if(key_control.key_rec_flag_pb == 0)
	{
		if(RF_SPI_Read_Reg(RF_STATUS) & RX_DR) // RX_DR IRQ
		{
			RF_CE_Low(); // CE low
			soft_recieve_control.data_length_count = RF_SPI_Read_Reg(R_RX_PL_WID);
			if(soft_recieve_control.data_length_count == 5)
			{
				CSN = 0;
				RF_SPI_Write_Byte(R_RX_PLOAD);
				rx_buff[0] = RF_SPI_Read_Byte();
				rx_buff[1] = RF_SPI_Read_Byte();
				rx_buff[2] = RF_SPI_Read_Byte();
				rx_buff[3] = RF_SPI_Read_Byte();
				rx_buff[4] = RF_SPI_Read_Byte();
				CSN = 1;
				Soft_Decode(); 				  // decode business frame
				received = 1;
			}
			else
			{
				soft_recieve_control.data_length_count = 0;
			}
			RF_Refresh_State();               // flush FIFO, clear IRQ
			RF_CE_High();
		}
	}

	Delay_3us();
	TRISB  = 0B00000001;
	Delay_3us();
	Key_Scan();
	Key_Event();
	Delay_3us();
	return received;
}


void XL2400T_Init(void)
{
	Delay_ms(150);

	RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0x02);
	Delay_1ms();
    RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0x3e);
	Delay_1ms();

	unsigned char gRfBuffer[8] = {0};
	gRfBuffer[5] = ((gRfBuffer[5] & 0xff) | 0x6d);
	RF_Read_Buff(PGA_SETTING, gRfBuffer, 5);
	Delay_ms(1);
	gRfBuffer[0] = 0x44;
	gRfBuffer[1] = 0x3E;
	gRfBuffer[2] = 0x38;
	gRfBuffer[3] = 0x32;
	gRfBuffer[4] = 0x2A;
	RF_Write_Buff(W_REGISTER + PGA_SETTING, gRfBuffer, 5);
	Delay_1ms();

	RF_SPI_Write_Reg(W_REGISTER + SETUP_AW,  0xAF);      // address width 5 bytes
	RF_Set_Address(RF_Test_Adrress);                     // set address
	RF_SPI_Write_Reg(W_REGISTER + RF_SETUP,  C_DR_250K); // 
    RF_SPI_Write_Reg(W_REGISTER + EN_RXADDR, 0x01);      // enable RX pipe 0
	RF_SPI_Write_Reg(W_REGISTER + RX_PW_PX,  5);         // RX payload 5 bytes
	RF_SPI_Write_Reg(W_REGISTER + EN_AA,     0x00);      // auto-ack pipes off
    RF_SPI_Write_Reg(W_REGISTER + DYNPD,     0x00);      // dynamic payload off
	RF_SPI_Write_Reg(W_REGISTER + FEATURE,   0x18);      // dynamic length feature off
	RF_SPI_Write_Reg(W_REGISTER + SETUP_RETR,0x33);      // 3 retries, 1 ms interval
	RF_Set_Power(RF_TX_Power);
}



