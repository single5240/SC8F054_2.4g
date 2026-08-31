#include "SC8F054_define.h"
#include "SC8F054_var.h"
#include <sc.h>

unsigned char uart_tx_busy;
unsigned char uart_rx_ready;
unsigned char uart_tx_data;
unsigned char uart_rx_data;
unsigned char rx_sample_count = 0; 
U8 Tx_Rx_Buf[37];


// 发送一个字节
void UART_Send_Byte(unsigned char dat) 
{
    while(uart_tx_busy);  // 等待发送完成
    uart_tx_busy = 1;
    uart_tx_data = dat;
}

// 检查是否接收到数据
unsigned char UART_Rx_Ready(void)
{
    return uart_rx_ready;
}

// 读取接收到的数据
unsigned char UART_Rx_Read(void) 
{
    uart_rx_ready = 0;
    return uart_rx_data;
}



void Uart_Send_Receive(void)
{
    static unsigned char tx_state = 0, tx_bit_count = 0, tx_shift_reg = 0;
    static unsigned char rx_state = 0, rx_bit_count = 0, rx_shift_reg = 0;
    
    if (uart_tx_busy && rx_sample_count == 1) 
    {
        switch(tx_state) 
        {
            case 0: // 发送起始位
                UART_TX = 0;
                tx_shift_reg = uart_tx_data;
                tx_bit_count = 0;
                tx_state = 1;
                break;
                
            case 1: // 发送数据位 (LSB first)
                UART_TX = tx_shift_reg & 0x01;
                tx_shift_reg >>= 1;
                tx_bit_count++;
                if (tx_bit_count >= 8) {
                    tx_state = 2;
                }
                break;
                
            case 2: // 发送停止位
                UART_TX = 1;
                uart_tx_busy = 0;
                tx_state = 0;
                break;
        }
    }
/*    
    switch(rx_state) 
    {
        case 0: // 状态0: 等待起始位
            if (UART_RX == 0) 
            {  // 检测到下降沿(起始位)
                rx_state = 1;    // 进入起始位验证
                rx_sample_count = 0;
            }
            break;
            
        case 1: // 状态1: 验证起始位 (在起始位中点采样)
            if (rx_sample_count == 1) {  // 起始位中点
                if (UART_RX == 0) {  // 确认是有效起始位
                    rx_shift_reg = 0;
                    rx_bit_count = 0;
                    rx_state = 2;  // 开始接收数据
                } else {
                    rx_state = 0;  // 噪声，回到空闲
                }
            }
            break;
            
        case 2: // 状态2: 接收数据位 (在数据位中点采样)
            if (rx_sample_count == 1) 
            { 
                // LSB first接收数据
                rx_shift_reg >>= 1;
                if (UART_RX) 
                {
                    rx_shift_reg |= 0x80;
                }
                rx_bit_count++;
                if (rx_bit_count >= 8) {
                    rx_state = 3;  // 准备接收停止位
                }
            }
            break;
            
        case 3: // 状态3: 验证停止位 (在停止位中点采样)
            if (rx_sample_count == 1) 
            {
                if (UART_RX) 
                {  // 有效的停止位
                	uart_rx_data = rx_shift_reg;
                    //ring_buf_write(rx_shift_reg);
                    uart_rx_ready = 1;
                }
                rx_state = 0;  // 回到空闲状态
            }
            break;
    }
*/
    
    rx_sample_count++;
    if (rx_sample_count >= 3) 
    {
        rx_sample_count = 0;
    }
    
}




















































