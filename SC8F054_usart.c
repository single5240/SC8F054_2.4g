#include "SC8F054_define.h"
#if FEATURE_SOFT_UART_ENABLE
#include "SC8F054_var.h"
#include <sc.h>

unsigned char uart_tx_busy;
unsigned char uart_rx_ready;
unsigned char uart_tx_data;
unsigned char uart_rx_data;
unsigned char rx_sample_count = 0; 
U8 Tx_Rx_Buf[37];


// send one byte
void UART_Send_Byte(unsigned char dat) 
{
    while(uart_tx_busy);  // wait TX done
    uart_tx_busy = 1;
    uart_tx_data = dat;
}

// check RX ready
unsigned char UART_Rx_Ready(void)
{
    return uart_rx_ready;
}

// read RX byte
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
            case 0: // send start bit
                UART_TX = 0;
                tx_shift_reg = uart_tx_data;
                tx_bit_count = 0;
                tx_state = 1;
                break;
                
            case 1: // send data bits (LSB first)
                UART_TX = tx_shift_reg & 0x01;
                tx_shift_reg >>= 1;
                tx_bit_count++;
                if (tx_bit_count >= 8) {
                    tx_state = 2;
                }
                break;
                
            case 2: // send stop bit
                UART_TX = 1;
                uart_tx_busy = 0;
                tx_state = 0;
                break;
        }
    }
/*    
    switch(rx_state) 
    {
        case 0: // state0: wait start bit
            if (UART_RX == 0) 
            {  // falling edge (start)
                rx_state = 1;    // verify start bit
                rx_sample_count = 0;
            }
            break;
            
        case 1: // state1: sample start mid-bit
            if (rx_sample_count == 1) {  // start mid-bit
                if (UART_RX == 0) {  // valid start bit
                    rx_shift_reg = 0;
                    rx_bit_count = 0;
                    rx_state = 2;  // receive data
                } else {
                    rx_state = 0;  // noise, idle
                }
            }
            break;
            
        case 2: // state2: sample data mid-bit
            if (rx_sample_count == 1) 
            { 
                // LSB first
                rx_shift_reg >>= 1;
                if (UART_RX) 
                {
                    rx_shift_reg |= 0x80;
                }
                rx_bit_count++;
                if (rx_bit_count >= 8) {
                    rx_state = 3;  // prepare stop bit
                }
            }
            break;
            
        case 3: // state3: sample stop mid-bit
            if (rx_sample_count == 1) 
            {
                if (UART_RX) 
                {  // valid stop bit
                	uart_rx_data = rx_shift_reg;
                    //ring_buf_write(rx_shift_reg);
                    uart_rx_ready = 1;
                }
                rx_state = 0;  // back to idle
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
#endif
