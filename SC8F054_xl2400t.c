#include "SC8F054_define.h"
#include "SC8F054_var.h"
#include "xl2400t.h"
#include <sc.h>

unsigned char RF_Test_Adrress[5]={0x23, 0x24, 0x25, 0x26, 0x27}; // RF地址

/*************************************************
 * SPI写入一个字节的数据
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
 * SPI读取一个字节的数据
 * 返回值: 读取到的数据
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
 * 向XL2400T的寄存器写入一个字节的数据
 * 参数：RF_Reg 写指令|寄存器地址
 * 参数：W_Data 写入的数据
*********************************************************************/
void RF_SPI_Write_Reg(unsigned char RF_Reg, unsigned char W_Data)
{
	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg); // 写入地址
	RF_SPI_Write_Byte(W_Data); // 写入数据
	CSN = 1;
}

/*******************************************************
 * 从XL2400T寄存器读取一个字节的数据
 * 参数: 读指令|寄存器地址
 * 返回值：读取到的数据
********************************************************/
unsigned char RF_SPI_Read_Reg(unsigned char RF_Reg)
{
	unsigned char rTemp = 0;
	CSN = 0;
	RF_SPI_Write_Byte(RF_Reg);  // 写入地址+读取指令
	rTemp = RF_SPI_Read_Byte(); // 读取数据
	CSN = 1;
	return rTemp;
}

/*****************************************
 * 向XL2400T的寄存器写入多个数据
 * 参数: RFAdress 写取指令|寄存器地址
 * 参数：*pBuff   需要写入数据的地址
 * 参数：Len      需要写入的长度
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
 * 从XL2400T的寄存器读取多个数据
 * 参数: RFAdress 读取指令|寄存器地址
 * 参数：*pBuff   读取到的数据存放的地址
 * 参数：Len      需要读取的长度
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
 * 拉高软件CE
************************************************/
void RF_CE_High(void)
{
	RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xEF);
}

/**********************
 * 拉低软件CE
**********************/
void RF_CE_Low(void)
{
	RF_SPI_Write_Reg(W_REGISTER + CFG_TOP, 0xEE);
}

/********************************************
 * 清除中断标记位
 * 清空TX-FIFO
 * 清空RX-FIFO
*********************************************/
void RF_Refresh_State(void)
{
	RF_SPI_Write_Reg(W_REGISTER + RF_STATUS, 0x70);
	RF_SPI_Write_Reg(FLUSH_TX, CMD_NOP);
	RF_SPI_Write_Reg(FLUSH_RX, CMD_NOP);
}

/**********************************
 * 设置通讯频点
 * 参数：频点
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
 * 配置发送与接收地址
*********************************************/
void RF_Set_Address(unsigned char *AddrBuff)
{
	RF_Write_Buff(W_REGISTER + TX_ADDR,    AddrBuff, 5); /*配置发送地址*/
	RF_Write_Buff(W_REGISTER + RX_ADDR_P0, AddrBuff, 5); /*配置接收数据通道0的地址*/
}

/**********************
 * 基带复位
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
 * 配置发射功率
****************************************/
void RF_Set_Power(unsigned char Power)
{
	unsigned char Power_Buff[3]={0};
	RF_Read_Buff(RF_SETUP, Power_Buff, 2);
	Power_Buff[1] = Power;
	RF_Write_Buff(W_REGISTER + RF_SETUP, Power_Buff ,2);
}

/*************************
 * 配置RF为发送模式
 *************************/
#if FEATURE_RF_TX_ENABLE
void RF_Tx_Mode(void)
{
   unsigned char Mode_Buff[3] = {0};
   Mode_Buff[0] = 0xee; // 启用CRC校验 2字节
   Mode_Buff[1] = 0x80;
   RF_Write_Buff(W_REGISTER + CFG_TOP, Mode_Buff, 2);
   RF_Read_Buff(CFG_TOP, Mode_Buff, 3);
   RF_Refresh_State();
   Delay_ms(10);
   RF_Set_Chn(76);
}
#endif

/************************
 * 配置RF为接收模式
************************/
void RF_Rx_Mode(void)
{
   unsigned char Mode_Buff[3] = {0};
   Mode_Buff[0] = 0xee; // 启用CRC校验 2字节
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
	
    RF_Refresh_State();               	 // 刷新状态
	color_t++;
	if(color_t > 15)
		color_t = 0;

	tx_buff[0] = (0xff & 0x0ff);        // 选中全部手环（通道）
	tx_buff[1] = ((0xff >> 8) & 0x0ff);
	tx_buff[2] = ((color_t << 4) | 2);  // 颜色+模式   
	tx_buff[3] = (0x20);                    
	tx_buff[4] = ((tx_buff[0] + tx_buff[1] + tx_buff[2] + tx_buff[3]) & 0x0ff);                
	RF_Write_Buff(W_TX_PLOAD, tx_buff, 5); // 填写发送内容

#if FEATURE_SOFT_UART_ENABLE
	UART_Send_Byte(tx_buff[0]); 
	UART_Send_Byte(tx_buff[1]); 
	UART_Send_Byte(tx_buff[2]); 
	UART_Send_Byte(tx_buff[3]); 
	UART_Send_Byte(tx_buff[4]); 
#endif

	RF_CE_High(); // 拉高CE
	Delay_1ms();
	RF_CE_Low();  // 拉低CE
	Delay_1ms();
	
	Temp = RF_SPI_Read_Reg(RF_STATUS);
#if FEATURE_SOFT_UART_ENABLE
	UART_Send_Byte(Temp); 
#endif

	// 获取状态寄存器的状态
	if(RF_SPI_Read_Reg(RF_STATUS) & TX_DS) // 触发发送中断
	{
		RF_Refresh_State(); // 清空FIFO 清除中断标记位
		return 0x20;
	}
	else
	{
		RF_Refresh_State(); // 清空FIFO 清除中断标记位
		return 0;	
	}
}
#endif

/*************************************************
 * 接收数据函数
 * 参数：接收到的数据 存放的地址
 * 返回值：接收到数据返回1 没接收到数据返回0
**************************************************/
unsigned char RF_RX_Data(unsigned char* rx_buff)
{
	unsigned char received = 0;

	TRISB  = 0B00000000;
	if(key_control.key_rec_flag_pb == 0)
	{
		if(RF_SPI_Read_Reg(RF_STATUS) & RX_DR) // 触发接收中断
		{
			RF_CE_Low(); // 拉低CE
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
				Soft_Decode(); 				  // 接收码处理函数
				received = 1;
			}
			else
			{
				soft_recieve_control.data_length_count = 0;
			}
			RF_Refresh_State();               // 清空FIFO 清除中断标记位
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

	RF_SPI_Write_Reg(W_REGISTER + SETUP_AW,  0xAF);      // 地址长度5字节
	RF_Set_Address(RF_Test_Adrress);                     // 地址
	RF_SPI_Write_Reg(W_REGISTER + RF_SETUP,  C_DR_250K); // 
    RF_SPI_Write_Reg(W_REGISTER + EN_RXADDR, 0x01);      // 启用数据通道0
	RF_SPI_Write_Reg(W_REGISTER + RX_PW_PX,  5);         // 配置5个接收数据
	RF_SPI_Write_Reg(W_REGISTER + EN_AA,     0x00);      // 配置应答数据通道道
    RF_SPI_Write_Reg(W_REGISTER + DYNPD,     0x00);      // 关闭所有数据通道的动态长度功能
	RF_SPI_Write_Reg(W_REGISTER + FEATURE,   0x18);      // 不使能动态长度功能
	RF_SPI_Write_Reg(W_REGISTER + SETUP_RETR,0x33);      // 重传3次 重传间隔1ms
	RF_Set_Power(RF_TX_Power);
}




