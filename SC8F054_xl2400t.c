#include "SC8F054_define.h"
#include "SC8F054_var.h"
#include "xl2400t.h"
#include <sc.h>

unsigned char RF_Test_Adrress[5]={0x23, 0x24, 0x25, 0x26, 0x27}; // RF��ַ

/*************************************************
 * SPIд��һ���ֽڵ�����
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
 * SPI��ȡһ���ֽڵ�����
 * ����ֵ: ��ȡ��������
*************************************************/
static unsigned char RF_SPI_Read_Byte(void)
{
	TRISB  = 0B00100000;
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
 * ��XL2400T�ļĴ���д��һ���ֽڵ�����
 * ������RF_Reg дָ��|�Ĵ�����ַ
 * ������W_Data д�������
*********************************************************************/
void RF_SPI_Write_Reg(unsigned char RF_Reg, unsigned char W_Data)
{
	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg); // д���ַ
	RF_SPI_Write_Byte(W_Data); // д������
	CSN = 1;
}

/*******************************************************
 * ��XL2400T�Ĵ�����ȡһ���ֽڵ�����
 * ����: ��ָ��|�Ĵ�����ַ
 * ����ֵ����ȡ��������
********************************************************/
unsigned char RF_SPI_Read_Reg(unsigned char RF_Reg)
{
	unsigned char rTemp = 0;
	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg);  // д���ַ+��ȡָ��
	rTemp = RF_SPI_Read_Byte(); // ��ȡ����
	CSN = 1;
	return rTemp;
}

/*****************************************
 * ��XL2400T�ļĴ���д��������
 * ����: RFAdress дȡָ��|�Ĵ�����ַ
 * ������*pBuff   ��Ҫд�����ݵĵ�ַ
 * ������Len      ��Ҫд��ĳ���
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
 * ��XL2400T�ļĴ�����ȡ�������
 * ����: RFAdress ��ȡָ��|�Ĵ�����ַ
 * ������*pBuff   ��ȡ�������ݴ�ŵĵ�ַ
 * ������Len      ��Ҫ��ȡ�ĳ���
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
 * ��������CE
************************************************/
void RF_CE_High(void)
{
	RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xEF);
}

/**********************
 * ��������CE
**********************/
void RF_CE_Low(void)
{
	RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xEE);
}

/********************************************
 * ����жϱ��λ
 * ���TX-FIFO
 * ���RX-FIFO
*********************************************/
void RF_Refresh_State(void)
{
	RF_SPI_Write_Reg(W_REGISTER + RF_STATUS, 0x70);
	RF_SPI_Write_Reg(FLUSH_TX, CMD_NOP);
	RF_SPI_Write_Reg(FLUSH_RX, CMD_NOP);
}

/**********************************
 * ����ͨѶƵ��
 * ������Ƶ��
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
 * ���÷�������յ�ַ
*********************************************/
void RF_Set_Address(unsigned char *AddrBuff)
{
	RF_Write_Buff(W_REGISTER + TX_ADDR,    AddrBuff, 5); /*���÷��͵�ַ*/
	RF_Write_Buff(W_REGISTER + RX_ADDR_P0, AddrBuff, 5); /*���ý�������ͨ��0�ĵ�ַ*/
}

/**********************
 * ������λ
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
 * ���÷��书��
****************************************/
void RF_Set_Power(unsigned char Power)
{
	unsigned char Power_Buff[3]={0};
	RF_Read_Buff(RF_SETUP, Power_Buff, 2);
	Power_Buff[1] = Power;
	RF_Write_Buff(W_REGISTER + RF_SETUP, Power_Buff ,2);
}

/*************************
 * ����RFΪ����ģʽ
 *************************/
#if FEATURE_RF_TX_ENABLE
void RF_Tx_Mode(void)
{
   unsigned char Mode_Buff[3] = {0};
   Mode_Buff[0] = 0xee; // ����CRCУ�� 2�ֽ�
   Mode_Buff[1] = 0x80;
   RF_Write_Buff(W_REGISTER + CFG_TOP, Mode_Buff, 2);
   RF_Read_Buff(CFG_TOP, Mode_Buff, 3);
   RF_Refresh_State();
   RF_Set_Chn(76);
   Delay_ms(10); // �ȴ�����Ƶ���ȶ�����װ�ز���������
}
#endif

/************************
 * ����RFΪ����ģʽ
************************/
void RF_Rx_Mode(void)
{
   unsigned char Mode_Buff[3] = {0};
   Mode_Buff[0] = 0xee; // ����CRCУ�� 2�ֽ�
   Mode_Buff[1] = 0xc0; 
   RF_Write_Buff(W_REGISTER + CFG_TOP, Mode_Buff, 2);
   RF_Read_Buff(CFG_TOP, Mode_Buff, 3);
   RF_Refresh_State();
   RF_Set_Chn(76-1);
   RF_CE_High();
   RF_Read_Buff(CFG_TOP, Mode_Buff, 3);
   Delay_ms(10); // �ȴ�����Ƶ���ȶ�������ѯRX FIFO
}

#if FEATURE_RF_TX_ENABLE
unsigned char RF_TX_Data(unsigned char* tx_buff)
{
	unsigned char Temp = 0;
	
    RF_Refresh_State();               	 // ˢ��״̬
	RF_Write_Buff(W_TX_PLOAD, tx_buff, RF_PAYLOAD_SIZE);

#if FEATURE_SOFT_UART_ENABLE
	UART_Send_Byte(tx_buff[0]); 
	UART_Send_Byte(tx_buff[1]); 
	UART_Send_Byte(tx_buff[2]); 
	UART_Send_Byte(tx_buff[3]); 
	UART_Send_Byte(tx_buff[4]); 
#endif

	RF_CE_High(); // ����CE
	Delay_1ms();
	RF_CE_Low();  // ����CE
	Delay_1ms();
	
	Temp = RF_SPI_Read_Reg(RF_STATUS);
#if FEATURE_SOFT_UART_ENABLE
	UART_Send_Byte(Temp); 
#endif

	if(Temp & TX_DS)
	{
		RF_Refresh_State(); // ���FIFO ����жϱ��λ
		return 0x20;
	}
	else
	{
		RF_Refresh_State(); // ���FIFO ����жϱ��λ
		return 0;	
	}
}
#endif

/*************************************************
 * �������ݺ���
 * ���������յ������� ��ŵĵ�ַ
 * ����ֵ�����յ����ݷ���1 û���յ����ݷ���0
**************************************************/
unsigned char RF_RX_Data(unsigned char* rx_buff)
{
	unsigned char received = 0;
	unsigned char payload_length;
	unsigned char i;

	TRISB  = 0B00000000;
	if(key_control.key_rec_flag_pb == 0)
	{
		if(RF_SPI_Read_Reg(RF_STATUS) & RX_DR) // ���������ж�
		{
			RF_CE_Low(); // ����CE
			payload_length = RF_SPI_Read_Reg(R_RX_PL_WID);
			if(payload_length == RF_PAYLOAD_SIZE)
			{
				CSN = 0;
				RF_SPI_Write_Byte(R_RX_PLOAD);
				for(i = 0; i < RF_PAYLOAD_SIZE; i++)
				{
					rx_buff[i] = RF_SPI_Read_Byte();
				}
				CSN = 1;
				sleep_control.sleep_count = 13;
				sleep_control.recieve_sleep_flag = 1;
				received = 1;
			}
			RF_Refresh_State();               // ���FIFO ����жϱ��λ
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

	RF_SPI_Write_Reg(W_REGISTER + SETUP_AW,  0xAF);      // ��ַ����5�ֽ�
	RF_Set_Address(RF_Test_Adrress);                     // ��ַ
	RF_SPI_Write_Reg(W_REGISTER + RF_SETUP,  C_DR_250K); // 
    RF_SPI_Write_Reg(W_REGISTER + EN_RXADDR, 0x01);      // ��������ͨ��0
	RF_SPI_Write_Reg(W_REGISTER + RX_PW_PX,  RF_PAYLOAD_SIZE); // ���ù̶������غ�
	RF_SPI_Write_Reg(W_REGISTER + EN_AA,     0x00);      // ����Ӧ������ͨ����
    RF_SPI_Write_Reg(W_REGISTER + DYNPD,     0x00);      // �ر���������ͨ���Ķ�̬���ȹ���
	RF_SPI_Write_Reg(W_REGISTER + FEATURE,   0x18);      // ��ʹ�ܶ�̬���ȹ���
	RF_SPI_Write_Reg(W_REGISTER + SETUP_RETR,0x33);      // �ش�3�� �ش����1ms
	RF_Set_Power(RF_TX_Power);
}

unsigned char XL2400T_Self_Test(void)
{
	unsigned char result;

	result = 1;
	if(RF_SPI_Read_Reg(EN_RXADDR) != 0x01)
	{
		result = 0;
	}
	if(RF_SPI_Read_Reg(RX_PW_PX) != RF_PAYLOAD_SIZE)
	{
		result = 0;
	}
	if(RF_SPI_Read_Reg(FEATURE) != 0x18)
	{
		result = 0;
	}

	TRISB = 0B00000001;
	return result;
}




