opt subtitle "Microchip Technology Omniscient Code Generator v1.45 (PRO mode) build 201711160504"

opt pagewidth 120

	opt pm

	processor	SC8F054
opt include "D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\include\sc8f054.cgen.inc"
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
	FNCALL	_main,_Init_System
	FNCALL	_main,_Led_Color_Prg
	FNCALL	_main,_RF_RX_Data
	FNCALL	_main,_RF_Rx_Mode
	FNCALL	_main,_Rand_num
	FNCALL	_main,_Sleep_Mode
	FNCALL	_main,_XL2400T_Init
	FNCALL	_XL2400T_Init,_Delay_1ms
	FNCALL	_XL2400T_Init,_Delay_ms
	FNCALL	_XL2400T_Init,_RF_Read_Buff
	FNCALL	_XL2400T_Init,_RF_SPI_Write_Reg
	FNCALL	_XL2400T_Init,_RF_Set_Address
	FNCALL	_XL2400T_Init,_RF_Set_Power
	FNCALL	_XL2400T_Init,_RF_Write_Buff
	FNCALL	_RF_Set_Power,_RF_Read_Buff
	FNCALL	_RF_Set_Power,_RF_Write_Buff
	FNCALL	_RF_Set_Address,_RF_Write_Buff
	FNCALL	_Delay_1ms,_Delay_us
	FNCALL	_Sleep_Mode,_Init_System
	FNCALL	_Sleep_Mode,_RF_CE_Low
	FNCALL	_Sleep_Mode,_RF_SPI_Write_Reg
	FNCALL	_Rand_num,_rand
	FNCALL	_rand,___lmul
	FNCALL	_RF_Rx_Mode,_Delay_ms
	FNCALL	_RF_Rx_Mode,_RF_CE_High
	FNCALL	_RF_Rx_Mode,_RF_Read_Buff
	FNCALL	_RF_Rx_Mode,_RF_Refresh_State
	FNCALL	_RF_Rx_Mode,_RF_Set_Chn
	FNCALL	_RF_Rx_Mode,_RF_Write_Buff
	FNCALL	_RF_Write_Buff,_RF_SPI_Write_Byte
	FNCALL	_RF_Set_Chn,_RF_SPI_Read_Reg
	FNCALL	_RF_Set_Chn,_RF_SPI_Write_Reg
	FNCALL	_RF_Read_Buff,_RF_SPI_Read_Byte
	FNCALL	_RF_Read_Buff,_RF_SPI_Write_Byte
	FNCALL	_Delay_ms,_Delay_us
	FNCALL	_RF_RX_Data,_Delay_3us
	FNCALL	_RF_RX_Data,_Key_Event
	FNCALL	_RF_RX_Data,_Key_Scan
	FNCALL	_RF_RX_Data,_RF_CE_High
	FNCALL	_RF_RX_Data,_RF_CE_Low
	FNCALL	_RF_RX_Data,_RF_Refresh_State
	FNCALL	_RF_RX_Data,_RF_SPI_Read_Byte
	FNCALL	_RF_RX_Data,_RF_SPI_Read_Reg
	FNCALL	_RF_RX_Data,_RF_SPI_Write_Byte
	FNCALL	_RF_RX_Data,_Soft_Decode
	FNCALL	_Soft_Decode,___awmod
	FNCALL	_RF_SPI_Read_Reg,_RF_SPI_Read_Byte
	FNCALL	_RF_SPI_Read_Reg,_RF_SPI_Write_Byte
	FNCALL	_RF_Refresh_State,_RF_SPI_Write_Reg
	FNCALL	_RF_CE_Low,_RF_SPI_Write_Reg
	FNCALL	_RF_CE_High,_RF_SPI_Write_Reg
	FNCALL	_RF_SPI_Write_Reg,_RF_SPI_Write_Byte
	FNCALL	_Led_Color_Prg,_map_0_255_to_1000_0
	FNCALL	_map_0_255_to_1000_0,___lldiv
	FNCALL	_map_0_255_to_1000_0,___lmul
	FNROOT	_main
	FNCALL	_INT_Isr,_Key_Check_Time
	FNCALL	_INT_Isr,___lbdiv
	FNCALL	intlevel1,_INT_Isr
	global	intlevel1
	FNROOT	intlevel1
	global	_sleep_control
	global	_led_control
	global	_soft_recieve_control
	global	_randx
	global	_RF_Test_Adrress
psect	idataCOMMON,class=CODE,space=0,delta=2,noexec
global __pidataCOMMON
__pidataCOMMON:
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	10

;initializer for _sleep_control
	retlw	01h
	retlw	low(0)
	retlw	high(0)

psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	line	8

;initializer for _led_control
	retlw	01h
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	01h
	line	9

;initializer for _soft_recieve_control
	retlw	020h
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	low(0)
	retlw	01h
	retlw	low(0)
	retlw	low(0)
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\rand.c"
	line	3

;initializer for _randx
	retlw	01h
	retlw	0
	retlw	0
	retlw	0

psect	idataBANK1,class=CODE,space=0,delta=2,noexec
global __pidataBANK1
__pidataBANK1:
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	6

;initializer for _RF_Test_Adrress
	retlw	023h
	retlw	024h
	retlw	025h
	retlw	026h
	retlw	027h
	global	_key_control
	global	_soft_data
	global	_PWMD01H
_PWMD01H	set	30
	global	_PWMCON2
_PWMCON2	set	29
	global	_PWMT4L
_PWMT4L	set	28
	global	_PWMD4L
_PWMD4L	set	27
	global	_PWMD1L
_PWMD1L	set	26
	global	_PWMTH
_PWMTH	set	24
	global	_PWMTL
_PWMTL	set	23
	global	_PWMCON1
_PWMCON1	set	22
	global	_PWMCON0
_PWMCON0	set	21
	global	_OSCCON
_OSCCON	set	20
	global	_T2CON
_T2CON	set	19
	global	_PR2
_PR2	set	17
	global	_PIE1
_PIE1	set	14
	global	_PIR1
_PIR1	set	13
	global	_ODCONB
_ODCONB	set	12
	global	_INTCON
_INTCON	set	11
	global	_IOCB
_IOCB	set	9
	global	_WPUB
_WPUB	set	8
	global	_WPDB
_WPDB	set	7
	global	_PORTB
_PORTB	set	6
	global	_TRISB
_TRISB	set	5
	global	_OPTION_REG
_OPTION_REG	set	1
	global	_TMR2IE
_TMR2IE	set	113
	global	_TMR2IF
_TMR2IF	set	105
	global	_RBIF
_RBIF	set	88
	global	_RBIE
_RBIE	set	91
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_PWMD23H
_PWMD23H	set	158
	global	_PWMD2L
_PWMD2L	set	155
	global	_ODCONA
_ODCONA	set	140
	global	_IOCA
_IOCA	set	137
	global	_WPUA
_WPUA	set	136
	global	_WPDA
_WPDA	set	135
	global	_TRISA
_TRISA	set	133
; #config settings
	file	"SC8F054_timer_C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	dataCOMMON,class=COMMON,space=1,noexec
global __pdataCOMMON
__pdataCOMMON:
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	10
_sleep_control:
       ds      3

psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_key_control:
       ds      4

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	8
_led_control:
       ds      22

psect	dataBANK0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	9
_soft_recieve_control:
       ds      17

psect	dataBANK0
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\rand.c"
	line	3
_randx:
       ds      4

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_soft_data:
       ds      34

psect	dataBANK1,class=BANK1,space=1,noexec
global __pdataBANK1
__pdataBANK1:
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	6
_RF_Test_Adrress:
       ds      5

	file	"SC8F054_timer_C.as"
	line	#
global btemp
psect inittext,class=CODE,delta=2
global init_fetch0,btemp
;	Called with low address in FSR and high address in W
init_fetch0:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram0
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram0:
	fcall init_fetch0
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram0
; Initialize objects allocated to BANK1
	global __pidataBANK1
psect cinit,class=CODE,delta=2,merge=1
	bsf	status, 5	;RP0=1, select bank1
	fcall	__pidataBANK1+0		;fetch initializer
	movwf	__pdataBANK1+0&07fh		
	fcall	__pidataBANK1+1		;fetch initializer
	movwf	__pdataBANK1+1&07fh		
	fcall	__pidataBANK1+2		;fetch initializer
	movwf	__pdataBANK1+2&07fh		
	fcall	__pidataBANK1+3		;fetch initializer
	movwf	__pdataBANK1+3&07fh		
	fcall	__pidataBANK1+4		;fetch initializer
	movwf	__pdataBANK1+4&07fh		
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
global init_ram0, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+43)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram0
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2,merge=1
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
	fcall	__pidataCOMMON+2		;fetch initializer
	movwf	__pdataCOMMON+2&07fh		
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+022h)
	fcall	clear_ram0
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+04h)
	fcall	clear_ram0
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_Init_System:	; 1 bytes @ 0x0
?_XL2400T_Init:	; 1 bytes @ 0x0
?_RF_Rx_Mode:	; 1 bytes @ 0x0
?_RF_RX_Data:	; 1 bytes @ 0x0
?_Led_Color_Prg:	; 1 bytes @ 0x0
?_Rand_num:	; 1 bytes @ 0x0
?_Sleep_Mode:	; 1 bytes @ 0x0
?_Key_Check_Time:	; 1 bytes @ 0x0
??_Key_Check_Time:	; 1 bytes @ 0x0
?_RF_CE_Low:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_INT_Isr:	; 1 bytes @ 0x0
?_Key_Scan:	; 1 bytes @ 0x0
?_Key_Event:	; 1 bytes @ 0x0
?_Delay_3us:	; 1 bytes @ 0x0
?_Delay_us:	; 1 bytes @ 0x0
?_Delay_1ms:	; 1 bytes @ 0x0
?_Delay_ms:	; 1 bytes @ 0x0
?_Soft_Decode:	; 1 bytes @ 0x0
?_RF_SPI_Write_Byte:	; 1 bytes @ 0x0
?_RF_SPI_Read_Byte:	; 1 bytes @ 0x0
?_RF_SPI_Read_Reg:	; 1 bytes @ 0x0
?_RF_CE_High:	; 1 bytes @ 0x0
?_RF_Refresh_State:	; 1 bytes @ 0x0
?_RF_Set_Chn:	; 1 bytes @ 0x0
?_RF_Set_Address:	; 1 bytes @ 0x0
?_RF_Set_Power:	; 1 bytes @ 0x0
?___lbdiv:	; 1 bytes @ 0x0
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x0
	ds	1
??___lbdiv:	; 1 bytes @ 0x1
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x1
	ds	1
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x2
	ds	1
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x3
	ds	1
??_INT_Isr:	; 1 bytes @ 0x4
	ds	3
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
??_Init_System:	; 1 bytes @ 0x0
??_Key_Scan:	; 1 bytes @ 0x0
??_Key_Event:	; 1 bytes @ 0x0
??_Delay_3us:	; 1 bytes @ 0x0
??_Delay_us:	; 1 bytes @ 0x0
??_RF_SPI_Write_Byte:	; 1 bytes @ 0x0
??_RF_SPI_Read_Byte:	; 1 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	Delay_3us@i
Delay_3us@i:	; 1 bytes @ 0x0
	global	Delay_us@x
Delay_us@x:	; 1 bytes @ 0x0
	global	RF_SPI_Write_Byte@buff
RF_SPI_Write_Byte@buff:	; 1 bytes @ 0x0
	global	RF_SPI_Read_Byte@buff
RF_SPI_Read_Byte@buff:	; 1 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	1
	global	Delay_3us@j
Delay_3us@j:	; 1 bytes @ 0x1
	global	Delay_us@i
Delay_us@i:	; 1 bytes @ 0x1
	global	RF_SPI_Write_Byte@i
RF_SPI_Write_Byte@i:	; 1 bytes @ 0x1
	global	RF_SPI_Read_Byte@i
RF_SPI_Read_Byte@i:	; 1 bytes @ 0x1
	ds	1
?_RF_SPI_Write_Reg:	; 1 bytes @ 0x2
??_RF_SPI_Read_Reg:	; 1 bytes @ 0x2
?_RF_Write_Buff:	; 1 bytes @ 0x2
?_RF_Read_Buff:	; 1 bytes @ 0x2
	global	Delay_us@j
Delay_us@j:	; 1 bytes @ 0x2
	global	RF_SPI_Write_Reg@W_Data
RF_SPI_Write_Reg@W_Data:	; 1 bytes @ 0x2
	global	RF_SPI_Read_Reg@RF_Reg
RF_SPI_Read_Reg@RF_Reg:	; 1 bytes @ 0x2
	global	RF_Write_Buff@pBuff
RF_Write_Buff@pBuff:	; 1 bytes @ 0x2
	global	RF_Read_Buff@pBuff
RF_Read_Buff@pBuff:	; 1 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
??_RF_SPI_Write_Reg:	; 1 bytes @ 0x3
??_Delay_1ms:	; 1 bytes @ 0x3
??_Delay_ms:	; 1 bytes @ 0x3
	global	Delay_ms@x
Delay_ms@x:	; 1 bytes @ 0x3
	global	RF_SPI_Write_Reg@RF_Reg
RF_SPI_Write_Reg@RF_Reg:	; 1 bytes @ 0x3
	global	RF_SPI_Read_Reg@rTemp
RF_SPI_Read_Reg@rTemp:	; 1 bytes @ 0x3
	global	RF_Write_Buff@Len
RF_Write_Buff@Len:	; 1 bytes @ 0x3
	global	RF_Read_Buff@Len
RF_Read_Buff@Len:	; 1 bytes @ 0x3
	ds	1
??_Sleep_Mode:	; 1 bytes @ 0x4
??_RF_CE_Low:	; 1 bytes @ 0x4
??_RF_Write_Buff:	; 1 bytes @ 0x4
??_RF_Read_Buff:	; 1 bytes @ 0x4
??_RF_CE_High:	; 1 bytes @ 0x4
??_RF_Refresh_State:	; 1 bytes @ 0x4
??_RF_Set_Chn:	; 1 bytes @ 0x4
??___awmod:	; 1 bytes @ 0x4
	global	Delay_ms@i
Delay_ms@i:	; 1 bytes @ 0x4
	global	RF_Set_Chn@Chn
RF_Set_Chn@Chn:	; 1 bytes @ 0x4
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	1
	global	RF_Write_Buff@RF_Reg
RF_Write_Buff@RF_Reg:	; 1 bytes @ 0x5
	global	RF_Read_Buff@RF_Reg
RF_Read_Buff@RF_Reg:	; 1 bytes @ 0x5
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x5
	global	RF_Set_Chn@temp
RF_Set_Chn@temp:	; 2 bytes @ 0x5
	ds	1
??_Soft_Decode:	; 1 bytes @ 0x6
	global	RF_Write_Buff@rTemp
RF_Write_Buff@rTemp:	; 1 bytes @ 0x6
	global	RF_Read_Buff@i
RF_Read_Buff@i:	; 1 bytes @ 0x6
	ds	1
	global	RF_Write_Buff@i
RF_Write_Buff@i:	; 1 bytes @ 0x7
	ds	1
??_RF_Rx_Mode:	; 1 bytes @ 0x8
??_RF_Set_Address:	; 1 bytes @ 0x8
??_RF_Set_Power:	; 1 bytes @ 0x8
??___lmul:	; 1 bytes @ 0x8
	global	RF_Set_Address@AddrBuff
RF_Set_Address@AddrBuff:	; 1 bytes @ 0x8
	global	RF_Set_Power@Power
RF_Set_Power@Power:	; 1 bytes @ 0x8
	global	RF_Rx_Mode@Mode_Buff
RF_Rx_Mode@Mode_Buff:	; 3 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds	1
	global	RF_Set_Power@Power_Buff
RF_Set_Power@Power_Buff:	; 3 bytes @ 0x9
	ds	2
??_RF_RX_Data:	; 1 bytes @ 0xB
	global	RF_RX_Data@rx_buff
RF_RX_Data@rx_buff:	; 1 bytes @ 0xB
	ds	1
??_XL2400T_Init:	; 1 bytes @ 0xC
	global	?_rand
?_rand:	; 2 bytes @ 0xC
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0xC
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0xC
	global	XL2400T_Init@gRfBuffer
XL2400T_Init@gRfBuffer:	; 8 bytes @ 0xC
	ds	2
??_Rand_num:	; 1 bytes @ 0xE
??_rand:	; 1 bytes @ 0xE
	ds	2
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x10
	ds	4
??___lldiv:	; 1 bytes @ 0x14
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x14
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x18
	ds	1
?_map_0_255_to_1000_0:	; 1 bytes @ 0x19
	global	map_0_255_to_1000_0@green_duty
map_0_255_to_1000_0@green_duty:	; 1 bytes @ 0x19
	ds	1
	global	map_0_255_to_1000_0@blue_duty
map_0_255_to_1000_0@blue_duty:	; 1 bytes @ 0x1A
	ds	1
??_map_0_255_to_1000_0:	; 1 bytes @ 0x1B
	global	map_0_255_to_1000_0@red_duty
map_0_255_to_1000_0@red_duty:	; 1 bytes @ 0x1B
	ds	1
	global	map_0_255_to_1000_0@duty_10bit
map_0_255_to_1000_0@duty_10bit:	; 2 bytes @ 0x1C
	ds	2
??_Led_Color_Prg:	; 1 bytes @ 0x1E
??_main:	; 1 bytes @ 0x1E
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        51
;!    BSS         38
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14      7      10
;!    BANK0            80     30      77
;!    BANK1            80      0      39

;!
;!Pointer List with Targets:
;!
;!    RF_RX_Data@rx_buff	PTR unsigned char  size(1) Largest target is 34
;!		 -> soft_data(BANK1[34]), 
;!
;!    RF_Set_Address@AddrBuff	PTR unsigned char  size(1) Largest target is 5
;!		 -> RF_Test_Adrress(BANK1[5]), 
;!
;!    RF_Read_Buff@pBuff	PTR unsigned char  size(1) Largest target is 8
;!		 -> XL2400T_Init@gRfBuffer(BANK0[8]), RF_Rx_Mode@Mode_Buff(BANK0[3]), RF_Tx_Mode@Mode_Buff(COMMON[3]), RF_Set_Power@Power_Buff(BANK0[3]), 
;!
;!    RF_Write_Buff@pBuff	PTR unsigned char  size(1) Largest target is 8
;!		 -> RF_Test_Adrress(BANK1[5]), XL2400T_Init@gRfBuffer(BANK0[8]), RF_Rx_Mode@Mode_Buff(BANK0[3]), RF_Tx_Mode@Mode_Buff(COMMON[3]), 
;!		 -> RF_Set_Power@Power_Buff(BANK0[3]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _INT_Isr in COMMON
;!
;!    _INT_Isr->___lbdiv
;!
;!Critical Paths under _main in BANK0
;!
;!    _XL2400T_Init->_RF_Set_Power
;!    _RF_Set_Power->_RF_Write_Buff
;!    _RF_Set_Address->_RF_Write_Buff
;!    _Delay_1ms->_Delay_us
;!    _Sleep_Mode->_RF_SPI_Write_Reg
;!    _Rand_num->_rand
;!    _rand->___lmul
;!    _RF_Rx_Mode->_RF_Write_Buff
;!    _RF_Write_Buff->_RF_SPI_Write_Byte
;!    _RF_Set_Chn->_RF_SPI_Read_Reg
;!    _RF_Set_Chn->_RF_SPI_Write_Reg
;!    _RF_Read_Buff->_RF_SPI_Read_Byte
;!    _RF_Read_Buff->_RF_SPI_Write_Byte
;!    _Delay_ms->_Delay_us
;!    _RF_RX_Data->_Soft_Decode
;!    _Soft_Decode->___awmod
;!    _RF_SPI_Read_Reg->_RF_SPI_Read_Byte
;!    _RF_SPI_Read_Reg->_RF_SPI_Write_Byte
;!    _RF_Refresh_State->_RF_SPI_Write_Reg
;!    _RF_CE_Low->_RF_SPI_Write_Reg
;!    _RF_CE_High->_RF_SPI_Write_Reg
;!    _RF_SPI_Write_Reg->_RF_SPI_Write_Byte
;!    _Led_Color_Prg->_map_0_255_to_1000_0
;!    _map_0_255_to_1000_0->___lldiv
;!    ___lldiv->___lmul
;!
;!Critical Paths under _INT_Isr in BANK0
;!
;!    None.
;!
;!Critical Paths under _main in BANK1
;!
;!    None.
;!
;!Critical Paths under _INT_Isr in BANK1
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 0     0      0   20604
;!                        _Init_System
;!                      _Led_Color_Prg
;!                         _RF_RX_Data
;!                         _RF_Rx_Mode
;!                           _Rand_num
;!                         _Sleep_Mode
;!                       _XL2400T_Init
;! ---------------------------------------------------------------------------------
;! (1) _XL2400T_Init                                         9     9      0    6041
;!                                             12 BANK0      8     8      0
;!                          _Delay_1ms
;!                           _Delay_ms
;!                       _RF_Read_Buff
;!                   _RF_SPI_Write_Reg
;!                     _RF_Set_Address
;!                       _RF_Set_Power
;!                      _RF_Write_Buff
;! ---------------------------------------------------------------------------------
;! (2) _RF_Set_Power                                         4     4      0    1750
;!                                              8 BANK0      4     4      0
;!                       _RF_Read_Buff
;!                      _RF_Write_Buff
;! ---------------------------------------------------------------------------------
;! (2) _RF_Set_Address                                       1     1      0     968
;!                                              8 BANK0      1     1      0
;!                      _RF_Write_Buff
;! ---------------------------------------------------------------------------------
;! (2) _Delay_1ms                                            0     0      0     114
;!                           _Delay_us
;! ---------------------------------------------------------------------------------
;! (1) _Sleep_Mode                                           0     0      0    2402
;!                        _Init_System
;!                          _RF_CE_Low
;!                   _RF_SPI_Write_Reg
;! ---------------------------------------------------------------------------------
;! (2) _Init_System                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _Rand_num                                             0     0      0     516
;!                               _rand
;! ---------------------------------------------------------------------------------
;! (2) _rand                                                 2     0      2     516
;!                                             12 BANK0      2     0      2
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (1) _RF_Rx_Mode                                           3     3      0    5774
;!                                              8 BANK0      3     3      0
;!                           _Delay_ms
;!                         _RF_CE_High
;!                       _RF_Read_Buff
;!                   _RF_Refresh_State
;!                         _RF_Set_Chn
;!                      _RF_Write_Buff
;! ---------------------------------------------------------------------------------
;! (2) _RF_Write_Buff                                        6     4      2     897
;!                                              2 BANK0      6     4      2
;!                  _RF_SPI_Write_Byte
;! ---------------------------------------------------------------------------------
;! (2) _RF_Set_Chn                                           3     3      0    1461
;!                                              4 BANK0      3     3      0
;!                    _RF_SPI_Read_Reg
;!                   _RF_SPI_Write_Reg
;! ---------------------------------------------------------------------------------
;! (3) _RF_Read_Buff                                         5     3      2     759
;!                                              2 BANK0      5     3      2
;!                   _RF_SPI_Read_Byte
;!                  _RF_SPI_Write_Byte
;! ---------------------------------------------------------------------------------
;! (2) _Delay_ms                                             2     2      0     160
;!                                              3 BANK0      2     2      0
;!                           _Delay_us
;! ---------------------------------------------------------------------------------
;! (3) _Delay_us                                             3     3      0     114
;!                                              0 BANK0      3     3      0
;! ---------------------------------------------------------------------------------
;! (1) _RF_RX_Data                                           1     1      0    4564
;!                                             11 BANK0      1     1      0
;!                          _Delay_3us
;!                          _Key_Event
;!                           _Key_Scan
;!                         _RF_CE_High
;!                          _RF_CE_Low
;!                   _RF_Refresh_State
;!                   _RF_SPI_Read_Byte
;!                    _RF_SPI_Read_Reg
;!                  _RF_SPI_Write_Byte
;!                        _Soft_Decode
;! ---------------------------------------------------------------------------------
;! (2) _Soft_Decode                                          5     5      0     402
;!                                              6 BANK0      5     5      0
;!                            ___awmod
;! ---------------------------------------------------------------------------------
;! (3) ___awmod                                              6     2      4     402
;!                                              0 BANK0      6     2      4
;! ---------------------------------------------------------------------------------
;! (3) _RF_SPI_Read_Reg                                      2     2      0     188
;!                                              2 BANK0      2     2      0
;!                   _RF_SPI_Read_Byte
;!                  _RF_SPI_Write_Byte
;! ---------------------------------------------------------------------------------
;! (4) _RF_SPI_Read_Byte                                     2     2      0      72
;!                                              0 BANK0      2     2      0
;! ---------------------------------------------------------------------------------
;! (2) _RF_Refresh_State                                     0     0      0    1201
;!                   _RF_SPI_Write_Reg
;! ---------------------------------------------------------------------------------
;! (2) _RF_CE_Low                                            0     0      0    1201
;!                   _RF_SPI_Write_Reg
;! ---------------------------------------------------------------------------------
;! (2) _RF_CE_High                                           0     0      0    1201
;!                   _RF_SPI_Write_Reg
;! ---------------------------------------------------------------------------------
;! (2) _RF_SPI_Write_Reg                                     2     1      1    1201
;!                                              2 BANK0      2     1      1
;!                  _RF_SPI_Write_Byte
;! ---------------------------------------------------------------------------------
;! (3) _RF_SPI_Write_Byte                                    2     2      0      70
;!                                              0 BANK0      2     2      0
;! ---------------------------------------------------------------------------------
;! (2) _Key_Scan                                             0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _Key_Event                                            0     0      0       0
;! ---------------------------------------------------------------------------------
;! (2) _Delay_3us                                            2     2      0      92
;!                                              0 BANK0      2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _Led_Color_Prg                                        0     0      0    1307
;!                _map_0_255_to_1000_0
;! ---------------------------------------------------------------------------------
;! (2) _map_0_255_to_1000_0                                  5     3      2    1307
;!                                             25 BANK0      5     3      2
;!                            ___lldiv
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (3) ___lmul                                              12     4      8     516
;!                                              0 BANK0     12     4      8
;! ---------------------------------------------------------------------------------
;! (3) ___lldiv                                             13     5      8     480
;!                                             12 BANK0     13     5      8
;!                             ___lmul (ARG)
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 4
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _INT_Isr                                              3     3      0     533
;!                                              4 COMMON     3     3      0
;!                     _Key_Check_Time
;!                            ___lbdiv
;! ---------------------------------------------------------------------------------
;! (6) ___lbdiv                                              4     3      1     533
;!                                              0 COMMON     4     3      1
;! ---------------------------------------------------------------------------------
;! (6) _Key_Check_Time                                       0     0      0       0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 6
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _Init_System
;!   _Led_Color_Prg
;!     _map_0_255_to_1000_0
;!       ___lldiv
;!         ___lmul (ARG)
;!       ___lmul
;!   _RF_RX_Data
;!     _Delay_3us
;!     _Key_Event
;!     _Key_Scan
;!     _RF_CE_High
;!       _RF_SPI_Write_Reg
;!         _RF_SPI_Write_Byte
;!     _RF_CE_Low
;!       _RF_SPI_Write_Reg
;!         _RF_SPI_Write_Byte
;!     _RF_Refresh_State
;!       _RF_SPI_Write_Reg
;!         _RF_SPI_Write_Byte
;!     _RF_SPI_Read_Byte
;!     _RF_SPI_Read_Reg
;!       _RF_SPI_Read_Byte
;!       _RF_SPI_Write_Byte
;!     _RF_SPI_Write_Byte
;!     _Soft_Decode
;!       ___awmod
;!   _RF_Rx_Mode
;!     _Delay_ms
;!       _Delay_us
;!     _RF_CE_High
;!       _RF_SPI_Write_Reg
;!         _RF_SPI_Write_Byte
;!     _RF_Read_Buff
;!       _RF_SPI_Read_Byte
;!       _RF_SPI_Write_Byte
;!     _RF_Refresh_State
;!       _RF_SPI_Write_Reg
;!         _RF_SPI_Write_Byte
;!     _RF_Set_Chn
;!       _RF_SPI_Read_Reg
;!         _RF_SPI_Read_Byte
;!         _RF_SPI_Write_Byte
;!       _RF_SPI_Write_Reg
;!         _RF_SPI_Write_Byte
;!     _RF_Write_Buff
;!       _RF_SPI_Write_Byte
;!   _Rand_num
;!     _rand
;!       ___lmul
;!   _Sleep_Mode
;!     _Init_System
;!     _RF_CE_Low
;!       _RF_SPI_Write_Reg
;!         _RF_SPI_Write_Byte
;!     _RF_SPI_Write_Reg
;!       _RF_SPI_Write_Byte
;!   _XL2400T_Init
;!     _Delay_1ms
;!       _Delay_us
;!     _Delay_ms
;!       _Delay_us
;!     _RF_Read_Buff
;!       _RF_SPI_Read_Byte
;!       _RF_SPI_Write_Byte
;!     _RF_SPI_Write_Reg
;!       _RF_SPI_Write_Byte
;!     _RF_Set_Address
;!       _RF_Write_Buff
;!         _RF_SPI_Write_Byte
;!     _RF_Set_Power
;!       _RF_Read_Buff
;!         _RF_SPI_Read_Byte
;!         _RF_SPI_Write_Byte
;!       _RF_Write_Buff
;!         _RF_SPI_Write_Byte
;!     _RF_Write_Buff
;!       _RF_SPI_Write_Byte
;!
;! _INT_Isr (ROOT)
;!   _Key_Check_Time
;!   ___lbdiv
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK1               50      0      27       6       48.8%
;!BITBANK1            50      0       0       5        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     1E      4D       4       96.3%
;!BITBANK0            50      0       0       3        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      7       A       1       71.4%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0      7E       8        0.0%
;!ABS                  0      0      7E       7        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 9 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_Init_System
;;		_Led_Color_Prg
;;		_RF_RX_Data
;;		_RF_Rx_Mode
;;		_Rand_num
;;		_Sleep_Mode
;;		_XL2400T_Init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
	line	9
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
	line	9
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
;incstack = 0
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	11
	
l6569:	
;SC8F054_main.c: 11: Init_System();
	fcall	_Init_System
	line	12
	
l6571:	
;SC8F054_main.c: 12: XL2400T_Init();
	fcall	_XL2400T_Init
	line	13
	
l6573:	
;SC8F054_main.c: 13: RF_Rx_Mode();
	fcall	_RF_Rx_Mode
	line	17
	
l6575:	
;SC8F054_main.c: 16: {
;SC8F054_main.c: 17: RF_RX_Data(soft_data);
	movlw	(low(_soft_data|((0x0)<<8)))&0ffh
	fcall	_RF_RX_Data
	line	18
	
l6577:	
;SC8F054_main.c: 18: Led_Color_Prg();
	fcall	_Led_Color_Prg
	line	21
	
l6579:	
;SC8F054_main.c: 21: Rand_num();
	fcall	_Rand_num
	line	22
	
l6581:	
;SC8F054_main.c: 22: Sleep_Mode();
	fcall	_Sleep_Mode
	goto	l6575
	global	start
	ljmp	start
	opt stack 0
	line	24
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_XL2400T_Init

;; *************** function _XL2400T_Init *****************
;; Defined at:
;;		line 317 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  gRfBuffer       8   12[BANK0 ] unsigned char [8]
;;  dat             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       8       0
;;      Temps:          0       0       0
;;      Totals:         0       8       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Delay_1ms
;;		_Delay_ms
;;		_RF_Read_Buff
;;		_RF_SPI_Write_Reg
;;		_RF_Set_Address
;;		_RF_Set_Power
;;		_RF_Write_Buff
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	317
global __ptext1
__ptext1:	;psect for function _XL2400T_Init
psect	text1
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	317
	global	__size_of_XL2400T_Init
	__size_of_XL2400T_Init	equ	__end_of_XL2400T_Init-_XL2400T_Init
	
_XL2400T_Init:	
;incstack = 0
	opt	stack 2
; Regs used in _XL2400T_Init: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	320
	
l6251:	
;SC8F054_xl2400t.c: 320: Delay_ms(150);
	movlw	low(096h)
	fcall	_Delay_ms
	line	322
;SC8F054_xl2400t.c: 322: RF_SPI_Write_Reg(0x20 + (0X00), 0x02);
	movlw	low(02h)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(020h)
	fcall	_RF_SPI_Write_Reg
	line	323
;SC8F054_xl2400t.c: 323: Delay_1ms();
	fcall	_Delay_1ms
	line	324
;SC8F054_xl2400t.c: 324: RF_SPI_Write_Reg(0x20 + (0X00), 0x3e);
	movlw	low(03Eh)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(020h)
	fcall	_RF_SPI_Write_Reg
	line	325
;SC8F054_xl2400t.c: 325: Delay_1ms();
	fcall	_Delay_1ms
	line	327
	
l6253:	
;SC8F054_xl2400t.c: 327: unsigned char gRfBuffer[8] = {0};
	movlw	(XL2400T_Init@gRfBuffer)&0ffh
	movwf	fsr0
	movlw	8
	movwf	btemp+1
u1980:
	bcf	status, 7	;select IRP bank0
	clrf	indf
	incf	fsr0,f
	decfsz	btemp+1,f
	goto	u1980
	line	328
	
l6255:	
;SC8F054_xl2400t.c: 328: gRfBuffer[5] = ((gRfBuffer[5] & 0xff) | 0x6d);
	movf	0+(XL2400T_Init@gRfBuffer)+05h,w
	iorlw	06Dh
	movwf	0+(XL2400T_Init@gRfBuffer)+05h
	line	329
	
l6257:	
;SC8F054_xl2400t.c: 329: RF_Read_Buff((0X0F), gRfBuffer, 5);
	movlw	(low(XL2400T_Init@gRfBuffer|((0x0)<<8)))&0ffh
	movwf	(RF_Read_Buff@pBuff)
	movlw	low(05h)
	movwf	(RF_Read_Buff@Len)
	movlw	low(0Fh)
	fcall	_RF_Read_Buff
	line	330
	
l6259:	
;SC8F054_xl2400t.c: 330: Delay_ms(1);
	movlw	low(01h)
	fcall	_Delay_ms
	line	331
	
l6261:	
;SC8F054_xl2400t.c: 331: gRfBuffer[0] = 0x44;
	movlw	low(044h)
	movwf	(XL2400T_Init@gRfBuffer)
	line	332
	
l6263:	
;SC8F054_xl2400t.c: 332: gRfBuffer[1] = 0x3E;
	movlw	low(03Eh)
	movwf	0+(XL2400T_Init@gRfBuffer)+01h
	line	333
	
l6265:	
;SC8F054_xl2400t.c: 333: gRfBuffer[2] = 0x38;
	movlw	low(038h)
	movwf	0+(XL2400T_Init@gRfBuffer)+02h
	line	334
	
l6267:	
;SC8F054_xl2400t.c: 334: gRfBuffer[3] = 0x32;
	movlw	low(032h)
	movwf	0+(XL2400T_Init@gRfBuffer)+03h
	line	335
	
l6269:	
;SC8F054_xl2400t.c: 335: gRfBuffer[4] = 0x2A;
	movlw	low(02Ah)
	movwf	0+(XL2400T_Init@gRfBuffer)+04h
	line	336
	
l6271:	
;SC8F054_xl2400t.c: 336: RF_Write_Buff(0x20 + (0X0F), gRfBuffer, 5);
	movlw	(low(XL2400T_Init@gRfBuffer|((0x0)<<8)))&0ffh
	movwf	(RF_Write_Buff@pBuff)
	movlw	low(05h)
	movwf	(RF_Write_Buff@Len)
	movlw	low(02Fh)
	fcall	_RF_Write_Buff
	line	337
	
l6273:	
;SC8F054_xl2400t.c: 337: Delay_1ms();
	fcall	_Delay_1ms
	line	339
	
l6275:	
;SC8F054_xl2400t.c: 339: RF_SPI_Write_Reg(0x20 + (0X03), 0xAF);
	movlw	low(0AFh)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(023h)
	fcall	_RF_SPI_Write_Reg
	line	340
	
l6277:	
;SC8F054_xl2400t.c: 340: RF_Set_Address(RF_Test_Adrress);
	movlw	(low(_RF_Test_Adrress|((0x0)<<8)))&0ffh
	fcall	_RF_Set_Address
	line	341
	
l6279:	
;SC8F054_xl2400t.c: 341: RF_SPI_Write_Reg(0x20 + (0X06), 0x22);
	movlw	low(022h)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(026h)
	fcall	_RF_SPI_Write_Reg
	line	342
	
l6281:	
;SC8F054_xl2400t.c: 342: RF_SPI_Write_Reg(0x20 + (0X02), 0x01);
	clrf	(RF_SPI_Write_Reg@W_Data)
	incf	(RF_SPI_Write_Reg@W_Data),f
	movlw	low(022h)
	fcall	_RF_SPI_Write_Reg
	line	343
	
l6283:	
;SC8F054_xl2400t.c: 343: RF_SPI_Write_Reg(0x20 + (0X11), 5);
	movlw	low(05h)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(031h)
	fcall	_RF_SPI_Write_Reg
	line	344
	
l6285:	
;SC8F054_xl2400t.c: 344: RF_SPI_Write_Reg(0x20 + (0X01), 0x00);
	clrf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(021h)
	fcall	_RF_SPI_Write_Reg
	line	345
	
l6287:	
;SC8F054_xl2400t.c: 345: RF_SPI_Write_Reg(0x20 + (0X1C), 0x00);
	clrf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(03Ch)
	fcall	_RF_SPI_Write_Reg
	line	346
	
l6289:	
;SC8F054_xl2400t.c: 346: RF_SPI_Write_Reg(0x20 + (0X1D), 0x18);
	movlw	low(018h)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(03Dh)
	fcall	_RF_SPI_Write_Reg
	line	347
	
l6291:	
;SC8F054_xl2400t.c: 347: RF_SPI_Write_Reg(0x20 + (0X04),0x33);
	movlw	low(033h)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(024h)
	fcall	_RF_SPI_Write_Reg
	line	348
	
l6293:	
;SC8F054_xl2400t.c: 348: RF_Set_Power(12);
	movlw	low(0Ch)
	fcall	_RF_Set_Power
	line	349
	
l3575:	
	return
	opt stack 0
GLOBAL	__end_of_XL2400T_Init
	__end_of_XL2400T_Init:
	signat	_XL2400T_Init,89
	global	_RF_Set_Power

;; *************** function _RF_Set_Power *****************
;; Defined at:
;;		line 195 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  Power           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Power           1    8[BANK0 ] unsigned char 
;;  Power_Buff      3    9[BANK0 ] unsigned char [3]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_Read_Buff
;;		_RF_Write_Buff
;; This function is called by:
;;		_XL2400T_Init
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	195
global __ptext2
__ptext2:	;psect for function _RF_Set_Power
psect	text2
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	195
	global	__size_of_RF_Set_Power
	__size_of_RF_Set_Power	equ	__end_of_RF_Set_Power-_RF_Set_Power
	
_RF_Set_Power:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_Set_Power: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Set_Power@Power stored from wreg
	movwf	(RF_Set_Power@Power)
	line	197
	
l6243:	
;SC8F054_xl2400t.c: 197: unsigned char Power_Buff[3]={0};
	clrf	(RF_Set_Power@Power_Buff)
	clrf	(RF_Set_Power@Power_Buff+1)
	clrf	(RF_Set_Power@Power_Buff+2)
	line	198
	
l6245:	
;SC8F054_xl2400t.c: 198: RF_Read_Buff((0X06), Power_Buff, 2);
	movlw	(low(RF_Set_Power@Power_Buff|((0x0)<<8)))&0ffh
	movwf	(RF_Read_Buff@pBuff)
	movlw	low(02h)
	movwf	(RF_Read_Buff@Len)
	movlw	low(06h)
	fcall	_RF_Read_Buff
	line	199
	
l6247:	
;SC8F054_xl2400t.c: 199: Power_Buff[1] = Power;
	movf	(RF_Set_Power@Power),w
	movwf	0+(RF_Set_Power@Power_Buff)+01h
	line	200
	
l6249:	
;SC8F054_xl2400t.c: 200: RF_Write_Buff(0x20 + (0X06), Power_Buff ,2);
	movlw	(low(RF_Set_Power@Power_Buff|((0x0)<<8)))&0ffh
	movwf	(RF_Write_Buff@pBuff)
	movlw	low(02h)
	movwf	(RF_Write_Buff@Len)
	movlw	low(026h)
	fcall	_RF_Write_Buff
	line	201
	
l3545:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_Power
	__end_of_RF_Set_Power:
	signat	_RF_Set_Power,4217
	global	_RF_Set_Address

;; *************** function _RF_Set_Address *****************
;; Defined at:
;;		line 175 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  AddrBuff        1    wreg     PTR unsigned char 
;;		 -> RF_Test_Adrress(5), 
;; Auto vars:     Size  Location     Type
;;  AddrBuff        1    8[BANK0 ] PTR unsigned char 
;;		 -> RF_Test_Adrress(5), 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_Write_Buff
;; This function is called by:
;;		_XL2400T_Init
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	175
global __ptext3
__ptext3:	;psect for function _RF_Set_Address
psect	text3
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	175
	global	__size_of_RF_Set_Address
	__size_of_RF_Set_Address	equ	__end_of_RF_Set_Address-_RF_Set_Address
	
_RF_Set_Address:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_Set_Address: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Set_Address@AddrBuff stored from wreg
	movwf	(RF_Set_Address@AddrBuff)
	line	177
	
l6241:	
;SC8F054_xl2400t.c: 177: RF_Write_Buff(0x20 + (0X10), AddrBuff, 5);
	movf	(RF_Set_Address@AddrBuff),w
	movwf	(RF_Write_Buff@pBuff)
	movlw	low(05h)
	movwf	(RF_Write_Buff@Len)
	movlw	low(030h)
	fcall	_RF_Write_Buff
	line	178
;SC8F054_xl2400t.c: 178: RF_Write_Buff(0x20 + (0X0A), AddrBuff, 5);
	movf	(RF_Set_Address@AddrBuff),w
	movwf	(RF_Write_Buff@pBuff)
	movlw	low(05h)
	movwf	(RF_Write_Buff@Len)
	movlw	low(02Ah)
	fcall	_RF_Write_Buff
	line	179
	
l3537:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_Address
	__end_of_RF_Set_Address:
	signat	_RF_Set_Address,4217
	global	_Delay_1ms

;; *************** function _Delay_1ms *****************
;; Defined at:
;;		line 174 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay_us
;; This function is called by:
;;		_XL2400T_Init
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	174
global __ptext4
__ptext4:	;psect for function _Delay_1ms
psect	text4
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	174
	global	__size_of_Delay_1ms
	__size_of_Delay_1ms	equ	__end_of_Delay_1ms-_Delay_1ms
	
_Delay_1ms:	
;incstack = 0
	opt	stack 3
; Regs used in _Delay_1ms: [wreg+status,2+status,0+pclath+cstack]
	line	176
	
l5979:	
;SC8F054_init.c: 176: Delay_us(15);
	movlw	low(0Fh)
	fcall	_Delay_us
	line	177
	
l1781:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_1ms
	__end_of_Delay_1ms:
	signat	_Delay_1ms,89
	global	_Sleep_Mode

;; *************** function _Sleep_Mode *****************
;; Defined at:
;;		line 69 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Init_System
;;		_RF_CE_Low
;;		_RF_SPI_Write_Reg
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	69
global __ptext5
__ptext5:	;psect for function _Sleep_Mode
psect	text5
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	69
	global	__size_of_Sleep_Mode
	__size_of_Sleep_Mode	equ	__end_of_Sleep_Mode-_Sleep_Mode
	
_Sleep_Mode:	
;incstack = 0
	opt	stack 2
; Regs used in _Sleep_Mode: [wreg+status,2+status,0+pclath+cstack]
	line	71
	
l6449:	
;SC8F054_init.c: 71: if((sleep_control.sleep_count >= 2) && (sleep_control.sleep_count <= 8))
	movlw	0
	subwf	1+(_sleep_control)+01h,w
	movlw	02h
	skipnz
	subwf	0+(_sleep_control)+01h,w
	skipc
	goto	u2051
	goto	u2050
u2051:
	goto	l6459
u2050:
	
l6451:	
	movlw	0
	subwf	1+(_sleep_control)+01h,w
	movlw	09h
	skipnz
	subwf	0+(_sleep_control)+01h,w
	skipnc
	goto	u2061
	goto	u2060
u2061:
	goto	l6459
u2060:
	line	73
	
l6453:	
;SC8F054_init.c: 72: {
;SC8F054_init.c: 73: if((soft_data[0] == 0) || (sleep_control.recieve_sleep_flag == 0))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_soft_data)^080h),w
	btfsc	status,2
	goto	u2071
	goto	u2070
u2071:
	goto	l1753
u2070:
	
l6455:	
	btfsc	(_sleep_control),1
	goto	u2081
	goto	u2080
u2081:
	goto	l6459
u2080:
	
l1753:	
	line	75
;SC8F054_init.c: 74: {
;SC8F054_init.c: 75: sleep_control.sleep_flag = 1;
	bsf	(_sleep_control),0
	line	76
	
l6457:	
;SC8F054_init.c: 76: sleep_control.sleep_count = 0;
	clrf	0+(_sleep_control)+01h
	clrf	1+(_sleep_control)+01h
	line	80
	
l6459:	
;SC8F054_init.c: 77: }
;SC8F054_init.c: 78: }
;SC8F054_init.c: 80: if(sleep_control.sleep_count >= 18000)
	movlw	046h
	subwf	1+(_sleep_control)+01h,w
	movlw	050h
	skipnz
	subwf	0+(_sleep_control)+01h,w
	skipc
	goto	u2091
	goto	u2090
u2091:
	goto	l6467
u2090:
	line	82
	
l6461:	
;SC8F054_init.c: 81: {
;SC8F054_init.c: 82: sleep_control.sleep_count = 0;
	clrf	0+(_sleep_control)+01h
	clrf	1+(_sleep_control)+01h
	line	83
	
l6463:	
;SC8F054_init.c: 83: sleep_control.sleep_flag = 1;
	bsf	(_sleep_control),0
	line	84
	
l6465:	
;SC8F054_init.c: 84: soft_recieve_control.recieve_bit = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_soft_recieve_control),1
	line	86
	
l6467:	
;SC8F054_init.c: 85: }
;SC8F054_init.c: 86: if(sleep_control.sleep_flag == 1)
	btfss	(_sleep_control),0
	goto	u2101
	goto	u2100
u2101:
	goto	l6521
u2100:
	line	88
	
l6469:	
;SC8F054_init.c: 87: {
;SC8F054_init.c: 88: sleep_control.recieve_sleep_flag = 0;
	bcf	(_sleep_control),1
	line	89
	
l6471:	
;SC8F054_init.c: 89: soft_recieve_control.start_flag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	0+(_soft_recieve_control)+02h
	line	90
;SC8F054_init.c: 90: soft_recieve_control.data_length_count = 0;
	clrf	0+(_soft_recieve_control)+06h
	line	91
;SC8F054_init.c: 91: soft_recieve_control.data_bit_count = 0;
	clrf	0+(_soft_recieve_control)+05h
	line	92
;SC8F054_init.c: 92: sleep_control.sleep_count = 0;
	clrf	0+(_sleep_control)+01h
	clrf	1+(_sleep_control)+01h
	line	93
;SC8F054_init.c: 93: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	94
;SC8F054_init.c: 94: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	95
;SC8F054_init.c: 95: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	line	96
;SC8F054_init.c: 96: TRISB = 0B00000000;
	clrf	(5)	;volatile
	line	97
	
l6473:	
;SC8F054_init.c: 97: RF_CE_Low();
	fcall	_RF_CE_Low
	line	98
	
l6475:	
;SC8F054_init.c: 98: RF_SPI_Write_Reg(0x20 + (0X00), 0xe0);
	movlw	low(0E0h)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(020h)
	fcall	_RF_SPI_Write_Reg
	line	99
;SC8F054_init.c: 99: PWMTL = 0;
	clrf	(23)	;volatile
	line	100
;SC8F054_init.c: 100: PWMTH = 0;
	clrf	(24)	;volatile
	line	101
;SC8F054_init.c: 101: PWMCON0 = 0;
	clrf	(21)	;volatile
	line	102
	
l6477:	
;SC8F054_init.c: 102: TMR2IE = 0;
	bcf	(113/8),(113)&7	;volatile
	line	103
;SC8F054_init.c: 103: INTCON = 0;
	clrf	(11)	;volatile
	line	104
;SC8F054_init.c: 104: T2CON = 0;
	clrf	(19)	;volatile
	line	105
;SC8F054_init.c: 105: OPTION_REG = 0;
	clrf	(1)	;volatile
	line	106
;SC8F054_init.c: 106: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	107
;SC8F054_init.c: 107: WPUA = 0B00000000;
	clrf	(136)^080h	;volatile
	line	108
	
l6479:	
;SC8F054_init.c: 108: TRISB = 0B00000001;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	109
	
l6481:	
;SC8F054_init.c: 109: PORTB = 0B00001110;
	movlw	low(0Eh)
	movwf	(6)	;volatile
	line	110
;SC8F054_init.c: 110: WPUB = 0B00000000;
	clrf	(8)	;volatile
	line	111
;SC8F054_init.c: 111: PWMCON0 = 0;
	clrf	(21)	;volatile
	line	112
;SC8F054_init.c: 112: while(RB0);
	
l1756:	
	btfsc	(48/8),(48)&7	;volatile
	goto	u2111
	goto	u2110
u2111:
	goto	l1756
u2110:
	line	113
	
l6483:	
;SC8F054_init.c: 113: OPTION_REG = 0x0F;
	movlw	low(0Fh)
	movwf	(1)	;volatile
	line	114
;SC8F054_init.c: 114: OSCCON = 0X72;
	movlw	low(072h)
	movwf	(20)	;volatile
	line	115
;SC8F054_init.c: 115: IOCB = 0B00000001;
	movlw	low(01h)
	movwf	(9)	;volatile
	line	116
	
l6485:	
;SC8F054_init.c: 116: GIE = 0;
	bcf	(95/8),(95)&7	;volatile
	line	117
	
l6487:	
;SC8F054_init.c: 117: PIE1 = 0;
	clrf	(14)	;volatile
	line	118
	
l6489:	
;SC8F054_init.c: 118: PIR1 = 0;
	clrf	(13)	;volatile
	line	119
	
l6491:	
;SC8F054_init.c: 119: RBIE = 1;
	bsf	(91/8),(91)&7	;volatile
	line	120
	
l6493:	
;SC8F054_init.c: 120: INTCON &= 0xC8;
	movlw	low(0C8h)
	andwf	(11),f	;volatile
	line	121
	
l6495:	
;SC8F054_init.c: 121: PORTB;
	movf	(6),w	;volatile
	line	122
	
l6497:	
;SC8F054_init.c: 122: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	123
# 123 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
clrwdt ;# 
	line	124
# 124 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
nop ;# 
	line	125
# 125 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
clrwdt ;# 
	line	126
# 126 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
sleep ;# 
	line	127
# 127 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
clrwdt ;# 
psect	text5
	line	128
;SC8F054_init.c: 128: while(RB0);
	
l1759:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(48/8),(48)&7	;volatile
	goto	u2121
	goto	u2120
u2121:
	goto	l1759
u2120:
	
l1761:	
	line	129
;SC8F054_init.c: 129: if(RBIF)
	btfss	(88/8),(88)&7	;volatile
	goto	u2131
	goto	u2130
u2131:
	goto	l6513
u2130:
	line	131
	
l6499:	
;SC8F054_init.c: 130: {
;SC8F054_init.c: 131: sleep_control.recieve_sleep_flag = 1;
	bsf	(_sleep_control),1
	line	132
	
l6501:	
;SC8F054_init.c: 132: sleep_control.sleep_count = 15;
	movlw	0Fh
	movwf	0+(_sleep_control)+01h
	clrf	1+(_sleep_control)+01h
	line	133
	
l6503:	
;SC8F054_init.c: 133: key_control.key_hx_flag_pb = 1;
	bsf	(_key_control),5
	line	134
	
l6505:	
;SC8F054_init.c: 134: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	135
	
l6507:	
;SC8F054_init.c: 135: OSCCON = 0x70;
	movlw	low(070h)
	movwf	(20)	;volatile
	line	136
	
l6509:	
;SC8F054_init.c: 136: RBIE = 0;
	bcf	(91/8),(91)&7	;volatile
	line	137
	
l6511:	
;SC8F054_init.c: 137: RBIF = 0;
	bcf	(88/8),(88)&7	;volatile
	line	139
	
l6513:	
;SC8F054_init.c: 138: }
;SC8F054_init.c: 139: PORTB = 0B00111110;
	movlw	low(03Eh)
	movwf	(6)	;volatile
	line	140
	
l6515:	
;SC8F054_init.c: 140: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	141
;SC8F054_init.c: 141: OSCCON = 0x70;
	movlw	low(070h)
	movwf	(20)	;volatile
	line	142
	
l6517:	
;SC8F054_init.c: 142: Init_System();
	fcall	_Init_System
	line	143
	
l6519:	
;SC8F054_init.c: 143: sleep_control.sleep_flag = 0;
	bcf	(_sleep_control),0
	line	146
	
l6521:	
;SC8F054_init.c: 144: }
;SC8F054_init.c: 146: if(key_control.key_hx_flag_pb == 1)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_key_control),5
	goto	u2141
	goto	u2140
u2141:
	goto	l1764
u2140:
	line	148
	
l6523:	
;SC8F054_init.c: 147: {
;SC8F054_init.c: 148: led_control.led_color = 1;
	clrf	0+(_led_control)+07h
	incf	0+(_led_control)+07h,f
	line	149
	
l6525:	
;SC8F054_init.c: 149: led_control.led_mode = 2;
	movlw	low(02h)
	movwf	0+(_led_control)+08h
	line	150
	
l6527:	
;SC8F054_init.c: 150: key_control.key_hx_flag_pb = 0;
	bcf	(_key_control),5
	line	152
	
l1764:	
	return
	opt stack 0
GLOBAL	__end_of_Sleep_Mode
	__end_of_Sleep_Mode:
	signat	_Sleep_Mode,89
	global	_Init_System

;; *************** function _Init_System *****************
;; Defined at:
;;		line 12 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_Sleep_Mode
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	12
global __ptext6
__ptext6:	;psect for function _Init_System
psect	text6
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	12
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
;incstack = 0
	opt	stack 4
; Regs used in _Init_System: [wreg+status,2]
	line	14
	
l5825:	
# 14 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
nop ;# 
psect	text6
	line	15
	
l5827:	
;SC8F054_init.c: 15: OSCCON = 0x70;
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(20)	;volatile
	line	16
	
l5829:	
;SC8F054_init.c: 16: OPTION_REG = 0x00;
	clrf	(1)	;volatile
	line	18
	
l5831:	
;SC8F054_init.c: 18: WPUA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(136)^080h	;volatile
	line	19
	
l5833:	
;SC8F054_init.c: 19: WPDA = 0B00000000;
	clrf	(135)^080h	;volatile
	line	20
	
l5835:	
;SC8F054_init.c: 20: ODCONA = 0B00000000;
	clrf	(140)^080h	;volatile
	line	21
	
l5837:	
;SC8F054_init.c: 21: IOCA = 0B00000000;
	clrf	(137)^080h	;volatile
	line	22
	
l5839:	
;SC8F054_init.c: 22: TRISA = 0B00000000;
	clrf	(133)^080h	;volatile
	line	24
	
l5841:	
;SC8F054_init.c: 24: WPUB = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(8)	;volatile
	line	25
	
l5843:	
;SC8F054_init.c: 25: WPDB = 0B00000001;
	movlw	low(01h)
	movwf	(7)	;volatile
	line	26
;SC8F054_init.c: 26: ODCONB = 0B00000000;
	clrf	(12)	;volatile
	line	27
;SC8F054_init.c: 27: IOCB = 0B00000000;
	clrf	(9)	;volatile
	line	28
	
l5845:	
;SC8F054_init.c: 28: TRISB = 0B00000001;
	movlw	low(01h)
	movwf	(5)	;volatile
	line	29
	
l5847:	
;SC8F054_init.c: 29: PORTB = 0B00001110;
	movlw	low(0Eh)
	movwf	(6)	;volatile
	line	31
	
l5849:	
;SC8F054_init.c: 31: PR2 = 198;
	movlw	low(0C6h)
	movwf	(17)	;volatile
	line	32
	
l5851:	
;SC8F054_init.c: 32: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	33
	
l5853:	
;SC8F054_init.c: 33: TMR2IE = 1;
	bsf	(113/8),(113)&7	;volatile
	line	34
	
l5855:	
;SC8F054_init.c: 34: T2CON = 0B00000100;
	movlw	low(04h)
	movwf	(19)	;volatile
	line	38
;SC8F054_init.c: 38: PWMCON0 = 0;
	clrf	(21)	;volatile
	line	39
;SC8F054_init.c: 39: PWMCON1 = 0B00000000;
	clrf	(22)	;volatile
	line	40
	
l5857:	
;SC8F054_init.c: 40: PWMCON2 = 0B0010110;
	movlw	low(016h)
	movwf	(29)	;volatile
	line	41
	
l5859:	
;SC8F054_init.c: 41: PWMTL = 0xE7;
	movlw	low(0E7h)
	movwf	(23)	;volatile
	line	44
	
l5861:	
;SC8F054_init.c: 44: PWMTH = 0x0F;
	movlw	low(0Fh)
	movwf	(24)	;volatile
	line	45
	
l5863:	
;SC8F054_init.c: 45: PWMT4L = 0xE7;
	movlw	low(0E7h)
	movwf	(28)	;volatile
	line	48
	
l5865:	
;SC8F054_init.c: 48: PWMD23H = 0x30;
	movlw	low(030h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(158)^080h	;volatile
	line	49
	
l5867:	
;SC8F054_init.c: 49: PWMD2L = 0;
	clrf	(155)^080h	;volatile
	line	52
;SC8F054_init.c: 52: PWMD01H = 0x03;
	movlw	low(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(30)	;volatile
	line	53
	
l5869:	
;SC8F054_init.c: 53: PWMD1L = 0;
	clrf	(26)	;volatile
	line	55
	
l5871:	
;SC8F054_init.c: 55: PWMTH = 0x0F;
	movlw	low(0Fh)
	movwf	(24)	;volatile
	line	56
;SC8F054_init.c: 56: PWMD4L = 0;
	clrf	(27)	;volatile
	line	59
	
l5873:	
;SC8F054_init.c: 59: INTCON = 0XC0;
	movlw	low(0C0h)
	movwf	(11)	;volatile
	line	60
	
l1747:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
	signat	_Init_System,89
	global	_Rand_num

;; *************** function _Rand_num *****************
;; Defined at:
;;		line 31 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_rand
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
	line	31
global __ptext7
__ptext7:	;psect for function _Rand_num
psect	text7
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
	line	31
	global	__size_of_Rand_num
	__size_of_Rand_num	equ	__end_of_Rand_num-_Rand_num
	
_Rand_num:	
;incstack = 0
	opt	stack 3
; Regs used in _Rand_num: [wreg+status,2+status,0+pclath+cstack]
	line	33
	
l6441:	
;SC8F054_main.c: 33: if((soft_recieve_control.rand_flag == 0) && (soft_recieve_control.randnum_flag == 1))
	btfsc	(_soft_recieve_control),3
	goto	u2031
	goto	u2030
u2031:
	goto	l572
u2030:
	
l6443:	
	btfss	(_soft_recieve_control),5
	goto	u2041
	goto	u2040
u2041:
	goto	l572
u2040:
	line	35
	
l6445:	
;SC8F054_main.c: 34: {
;SC8F054_main.c: 35: soft_recieve_control.rand_num = (rand() % 8) + 1;
	fcall	_rand
	movf	(0+(?_rand)),w
	andlw	07h
	addlw	01h
	movwf	0+(_soft_recieve_control)+0Dh
	line	36
	
l6447:	
;SC8F054_main.c: 36: soft_recieve_control.rand_flag = 1;
	bsf	(_soft_recieve_control),3
	line	38
	
l572:	
	return
	opt stack 0
GLOBAL	__end_of_Rand_num
	__end_of_Rand_num:
	signat	_Rand_num,89
	global	_rand

;; *************** function _rand *****************
;; Defined at:
;;		line 12 in file "D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\rand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   12[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lmul
;; This function is called by:
;;		_Rand_num
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\rand.c"
	line	12
global __ptext8
__ptext8:	;psect for function _rand
psect	text8
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\rand.c"
	line	12
	global	__size_of_rand
	__size_of_rand	equ	__end_of_rand-_rand
	
_rand:	
;incstack = 0
	opt	stack 3
; Regs used in _rand: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l5875:	
	movlw	041h
	movwf	(___lmul@multiplier+3)
	movlw	0C6h
	movwf	(___lmul@multiplier+2)
	movlw	04Eh
	movwf	(___lmul@multiplier+1)
	movlw	06Dh
	movwf	(___lmul@multiplier)

	movf	(_randx+3),w
	movwf	(___lmul@multiplicand+3)
	movf	(_randx+2),w
	movwf	(___lmul@multiplicand+2)
	movf	(_randx+1),w
	movwf	(___lmul@multiplicand+1)
	movf	(_randx),w
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(_randx+3)
	movf	(2+(?___lmul)),w
	movwf	(_randx+2)
	movf	(1+(?___lmul)),w
	movwf	(_randx+1)
	movf	(0+(?___lmul)),w
	movwf	(_randx)

	line	15
	
l5877:	
	movlw	039h
	addwf	(_randx),f
	movlw	030h
	skipnc
movlw 49
	addwf	(_randx+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(_randx+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_randx+3),f
	line	16
	
l5879:	
	movf	1+(((_randx))+2),w
	movwf	(?_rand+1)
	movf	0+(((_randx))+2),w
	movwf	(?_rand)
	
l5881:	
	bcf	(?_rand)+(15/8),(15)&7
	line	17
	
l4525:	
	return
	opt stack 0
GLOBAL	__end_of_rand
	__end_of_rand:
	signat	_rand,90
	global	_RF_Rx_Mode

;; *************** function _RF_Rx_Mode *****************
;; Defined at:
;;		line 221 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  Mode_Buff       3    8[BANK0 ] unsigned char [3]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Delay_ms
;;		_RF_CE_High
;;		_RF_Read_Buff
;;		_RF_Refresh_State
;;		_RF_Set_Chn
;;		_RF_Write_Buff
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	221
global __ptext9
__ptext9:	;psect for function _RF_Rx_Mode
psect	text9
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	221
	global	__size_of_RF_Rx_Mode
	__size_of_RF_Rx_Mode	equ	__end_of_RF_Rx_Mode-_RF_Rx_Mode
	
_RF_Rx_Mode:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_Rx_Mode: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	223
	
l6295:	
;SC8F054_xl2400t.c: 223: unsigned char Mode_Buff[3] = {0};
	clrf	(RF_Rx_Mode@Mode_Buff)
	clrf	(RF_Rx_Mode@Mode_Buff+1)
	clrf	(RF_Rx_Mode@Mode_Buff+2)
	line	224
	
l6297:	
;SC8F054_xl2400t.c: 224: Mode_Buff[0] = 0xee;
	movlw	low(0EEh)
	movwf	(RF_Rx_Mode@Mode_Buff)
	line	225
;SC8F054_xl2400t.c: 225: Mode_Buff[1] = 0xc0;
	movlw	low(0C0h)
	movwf	0+(RF_Rx_Mode@Mode_Buff)+01h
	line	226
	
l6299:	
;SC8F054_xl2400t.c: 226: RF_Write_Buff(0x20 + (0X00), Mode_Buff, 2);
	movlw	(low(RF_Rx_Mode@Mode_Buff|((0x0)<<8)))&0ffh
	movwf	(RF_Write_Buff@pBuff)
	movlw	low(02h)
	movwf	(RF_Write_Buff@Len)
	movlw	low(020h)
	fcall	_RF_Write_Buff
	line	227
	
l6301:	
;SC8F054_xl2400t.c: 227: RF_Read_Buff((0X00), Mode_Buff, 3);
	movlw	(low(RF_Rx_Mode@Mode_Buff|((0x0)<<8)))&0ffh
	movwf	(RF_Read_Buff@pBuff)
	movlw	low(03h)
	movwf	(RF_Read_Buff@Len)
	movlw	low(0)
	fcall	_RF_Read_Buff
	line	228
	
l6303:	
;SC8F054_xl2400t.c: 228: RF_Refresh_State();
	fcall	_RF_Refresh_State
	line	229
	
l6305:	
;SC8F054_xl2400t.c: 229: RF_CE_High();
	fcall	_RF_CE_High
	line	230
	
l6307:	
;SC8F054_xl2400t.c: 230: RF_Read_Buff((0X00), Mode_Buff, 3);
	movlw	(low(RF_Rx_Mode@Mode_Buff|((0x0)<<8)))&0ffh
	movwf	(RF_Read_Buff@pBuff)
	movlw	low(03h)
	movwf	(RF_Read_Buff@Len)
	movlw	low(0)
	fcall	_RF_Read_Buff
	line	231
	
l6309:	
;SC8F054_xl2400t.c: 231: Delay_ms(10);
	movlw	low(0Ah)
	fcall	_Delay_ms
	line	232
	
l6311:	
;SC8F054_xl2400t.c: 232: RF_Set_Chn(76-1);
	movlw	low(04Bh)
	fcall	_RF_Set_Chn
	line	233
	
l3555:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Rx_Mode
	__end_of_RF_Rx_Mode:
	signat	_RF_Rx_Mode,89
	global	_RF_Write_Buff

;; *************** function _RF_Write_Buff *****************
;; Defined at:
;;		line 94 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  RF_Reg          1    wreg     unsigned char 
;;  pBuff           1    2[BANK0 ] PTR unsigned char 
;;		 -> RF_Test_Adrress(5), XL2400T_Init@gRfBuffer(8), RF_Rx_Mode@Mode_Buff(3), RF_Tx_Mode@Mode_Buff(3), 
;;		 -> RF_Set_Power@Power_Buff(3), 
;;  Len             1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  RF_Reg          1    5[BANK0 ] unsigned char 
;;  i               1    7[BANK0 ] unsigned char 
;;  rTemp           1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       3       0
;;      Temps:          0       1       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_RF_SPI_Write_Byte
;; This function is called by:
;;		_RF_Set_Address
;;		_RF_Set_Power
;;		_RF_Rx_Mode
;;		_XL2400T_Init
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	line	94
global __ptext10
__ptext10:	;psect for function _RF_Write_Buff
psect	text10
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	94
	global	__size_of_RF_Write_Buff
	__size_of_RF_Write_Buff	equ	__end_of_RF_Write_Buff-_RF_Write_Buff
	
_RF_Write_Buff:	
;incstack = 0
	opt	stack 3
; Regs used in _RF_Write_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Write_Buff@RF_Reg stored from wreg
	movwf	(RF_Write_Buff@RF_Reg)
	line	96
	
l5721:	
	line	97
;SC8F054_xl2400t.c: 97: unsigned char i = 0;
	clrf	(RF_Write_Buff@i)
	line	99
	
l5723:	
;SC8F054_xl2400t.c: 99: RB0 = 0;
	bcf	(48/8),(48)&7	;volatile
	line	100
	
l5725:	
;SC8F054_xl2400t.c: 100: RF_SPI_Write_Byte(RF_Reg);
	movf	(RF_Write_Buff@RF_Reg),w
	fcall	_RF_SPI_Write_Byte
	line	101
	
l5727:	
;SC8F054_xl2400t.c: 101: for(i = 0; i < Len; i++)
	clrf	(RF_Write_Buff@i)
	goto	l5735
	line	103
	
l5729:	
;SC8F054_xl2400t.c: 102: {
;SC8F054_xl2400t.c: 103: rTemp = pBuff[i];
	movf	(RF_Write_Buff@i),w
	addwf	(RF_Write_Buff@pBuff),w
	movwf	(??_RF_Write_Buff+0)+0
	movf	0+(??_RF_Write_Buff+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(RF_Write_Buff@rTemp)
	line	104
	
l5731:	
;SC8F054_xl2400t.c: 104: RF_SPI_Write_Byte(rTemp);
	movf	(RF_Write_Buff@rTemp),w
	fcall	_RF_SPI_Write_Byte
	line	101
	
l5733:	
	incf	(RF_Write_Buff@i),f
	
l5735:	
	movf	(RF_Write_Buff@Len),w
	subwf	(RF_Write_Buff@i),w
	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l5729
u1200:
	
l3515:	
	line	106
;SC8F054_xl2400t.c: 105: }
;SC8F054_xl2400t.c: 106: RB0 = 1;
	bsf	(48/8),(48)&7	;volatile
	line	107
	
l3516:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Write_Buff
	__end_of_RF_Write_Buff:
	signat	_RF_Write_Buff,12409
	global	_RF_Set_Chn

;; *************** function _RF_Set_Chn *****************
;; Defined at:
;;		line 159 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  Chn             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Chn             1    4[BANK0 ] unsigned char 
;;  temp            2    5[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_SPI_Read_Reg
;;		_RF_SPI_Write_Reg
;; This function is called by:
;;		_RF_Rx_Mode
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	line	159
global __ptext11
__ptext11:	;psect for function _RF_Set_Chn
psect	text11
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	159
	global	__size_of_RF_Set_Chn
	__size_of_RF_Set_Chn	equ	__end_of_RF_Set_Chn-_RF_Set_Chn
	
_RF_Set_Chn:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_Set_Chn: [wreg+status,2+status,0+pclath+cstack]
;RF_Set_Chn@Chn stored from wreg
	movwf	(RF_Set_Chn@Chn)
	line	161
	
l6227:	
	line	162
	
l6229:	
;SC8F054_xl2400t.c: 162: temp = RF_SPI_Read_Reg((0X01));
	movlw	low(01h)
	fcall	_RF_SPI_Read_Reg
	movwf	(RF_Set_Chn@temp)
	clrf	(RF_Set_Chn@temp+1)
	line	163
	
l6231:	
;SC8F054_xl2400t.c: 163: temp &= ~(1 << 6);
	bcf	(RF_Set_Chn@temp)+(6/8),(6)&7
	line	164
	
l6233:	
;SC8F054_xl2400t.c: 164: RF_SPI_Write_Reg(0x20 + (0X01), temp);
	movf	(RF_Set_Chn@temp),w
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(021h)
	fcall	_RF_SPI_Write_Reg
	line	165
	
l6235:	
;SC8F054_xl2400t.c: 165: RF_SPI_Write_Reg(0x20 + (0X05), Chn + 0x60);
	movf	(RF_Set_Chn@Chn),w
	addlw	060h
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(025h)
	fcall	_RF_SPI_Write_Reg
	line	166
	
l6237:	
;SC8F054_xl2400t.c: 166: temp = 0;
	clrf	(RF_Set_Chn@temp)
	clrf	(RF_Set_Chn@temp+1)
	line	167
;SC8F054_xl2400t.c: 167: temp = RF_SPI_Read_Reg(0x00 | 0x01);
	movlw	low(01h)
	fcall	_RF_SPI_Read_Reg
	movwf	(RF_Set_Chn@temp)
	clrf	(RF_Set_Chn@temp+1)
	line	168
	
l6239:	
;SC8F054_xl2400t.c: 168: temp |= (1<<6);
	bsf	(RF_Set_Chn@temp)+(6/8),(6)&7
	line	169
;SC8F054_xl2400t.c: 169: RF_SPI_Write_Reg(0x20 + (0X01), temp);
	movf	(RF_Set_Chn@temp),w
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(021h)
	fcall	_RF_SPI_Write_Reg
	line	170
	
l3534:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Set_Chn
	__end_of_RF_Set_Chn:
	signat	_RF_Set_Chn,4217
	global	_RF_Read_Buff

;; *************** function _RF_Read_Buff *****************
;; Defined at:
;;		line 115 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  RF_Reg          1    wreg     unsigned char 
;;  pBuff           1    2[BANK0 ] PTR unsigned char 
;;		 -> XL2400T_Init@gRfBuffer(8), RF_Rx_Mode@Mode_Buff(3), RF_Tx_Mode@Mode_Buff(3), RF_Set_Power@Power_Buff(3), 
;;  Len             1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  RF_Reg          1    5[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       2       0
;;      Temps:          0       1       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_RF_SPI_Read_Byte
;;		_RF_SPI_Write_Byte
;; This function is called by:
;;		_RF_Set_Power
;;		_RF_Rx_Mode
;;		_XL2400T_Init
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	line	115
global __ptext12
__ptext12:	;psect for function _RF_Read_Buff
psect	text12
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	115
	global	__size_of_RF_Read_Buff
	__size_of_RF_Read_Buff	equ	__end_of_RF_Read_Buff-_RF_Read_Buff
	
_RF_Read_Buff:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_Read_Buff: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_Read_Buff@RF_Reg stored from wreg
	movwf	(RF_Read_Buff@RF_Reg)
	line	117
	
l5737:	
	line	118
	
l5739:	
;SC8F054_xl2400t.c: 118: RB0 = 0;
	bcf	(48/8),(48)&7	;volatile
	line	119
	
l5741:	
;SC8F054_xl2400t.c: 119: RF_SPI_Write_Byte(RF_Reg);
	movf	(RF_Read_Buff@RF_Reg),w
	fcall	_RF_SPI_Write_Byte
	line	120
	
l5743:	
;SC8F054_xl2400t.c: 120: for(i = 0 ; i < Len ; i++)
	clrf	(RF_Read_Buff@i)
	goto	l5749
	line	122
	
l5745:	
;SC8F054_xl2400t.c: 121: {
;SC8F054_xl2400t.c: 122: pBuff[i] = RF_SPI_Read_Byte();
	movf	(RF_Read_Buff@i),w
	addwf	(RF_Read_Buff@pBuff),w
	movwf	(??_RF_Read_Buff+0)+0
	movf	0+(??_RF_Read_Buff+0)+0,w
	movwf	fsr0
	fcall	_RF_SPI_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	120
	
l5747:	
	incf	(RF_Read_Buff@i),f
	
l5749:	
	movf	(RF_Read_Buff@Len),w
	subwf	(RF_Read_Buff@i),w
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l5745
u1210:
	
l3521:	
	line	124
;SC8F054_xl2400t.c: 123: }
;SC8F054_xl2400t.c: 124: RB0 = 1;
	bsf	(48/8),(48)&7	;volatile
	line	125
	
l3522:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Read_Buff
	__end_of_RF_Read_Buff:
	signat	_RF_Read_Buff,12409
	global	_Delay_ms

;; *************** function _Delay_ms *****************
;; Defined at:
;;		line 179 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    3[BANK0 ] unsigned char 
;;  i               1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Delay_us
;; This function is called by:
;;		_RF_Rx_Mode
;;		_XL2400T_Init
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	179
global __ptext13
__ptext13:	;psect for function _Delay_ms
psect	text13
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	179
	global	__size_of_Delay_ms
	__size_of_Delay_ms	equ	__end_of_Delay_ms-_Delay_ms
	
_Delay_ms:	
;incstack = 0
	opt	stack 3
; Regs used in _Delay_ms: [wreg+status,2+status,0+pclath+cstack]
;Delay_ms@x stored from wreg
	movwf	(Delay_ms@x)
	line	182
	
l5981:	
;SC8F054_init.c: 181: unsigned char i;
;SC8F054_init.c: 182: for(i = 0; i < x; i++)
	clrf	(Delay_ms@i)
	goto	l5987
	line	184
	
l5983:	
;SC8F054_init.c: 183: {
;SC8F054_init.c: 184: Delay_us(15);
	movlw	low(0Fh)
	fcall	_Delay_us
	line	182
	
l5985:	
	incf	(Delay_ms@i),f
	
l5987:	
	movf	(Delay_ms@x),w
	subwf	(Delay_ms@i),w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l5983
u1550:
	line	187
	
l1787:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_ms
	__end_of_Delay_ms:
	signat	_Delay_ms,4217
	global	_Delay_us

;; *************** function _Delay_us *****************
;; Defined at:
;;		line 164 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    0[BANK0 ] unsigned char 
;;  j               1    2[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Delay_1ms
;;		_Delay_ms
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	line	164
global __ptext14
__ptext14:	;psect for function _Delay_us
psect	text14
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	164
	global	__size_of_Delay_us
	__size_of_Delay_us	equ	__end_of_Delay_us-_Delay_us
	
_Delay_us:	
;incstack = 0
	opt	stack 3
; Regs used in _Delay_us: [wreg+status,2+status,0]
;Delay_us@x stored from wreg
	movwf	(Delay_us@x)
	line	167
	
l5687:	
;SC8F054_init.c: 166: unsigned char i,j;
;SC8F054_init.c: 167: for(i=x;i>0;i--)
	movf	(Delay_us@x),w
	movwf	(Delay_us@i)
	
l5689:	
	movf	((Delay_us@i)),w
	btfss	status,2
	goto	u1181
	goto	u1180
u1181:
	goto	l1774
u1180:
	goto	l1778
	line	168
	
l1774:	
	line	169
# 169 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
nop ;# 
psect	text14
	line	170
	
l5693:	
;SC8F054_init.c: 170: for(j=153;j>0;j--);
	movlw	low(099h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Delay_us@j)
	
l5699:	
	decf	(Delay_us@j),f
	
l5701:	
	movf	((Delay_us@j)),w
	btfss	status,2
	goto	u1191
	goto	u1190
u1191:
	goto	l5699
u1190:
	line	167
	
l5703:	
	decf	(Delay_us@i),f
	goto	l5689
	line	172
	
l1778:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_us
	__end_of_Delay_us:
	signat	_Delay_us,4217
	global	_RF_RX_Data

;; *************** function _RF_RX_Data *****************
;; Defined at:
;;		line 285 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  rx_buff         1    wreg     PTR unsigned char 
;;		 -> soft_data(34), 
;; Auto vars:     Size  Location     Type
;;  rx_buff         1   11[BANK0 ] PTR unsigned char 
;;		 -> soft_data(34), 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_Delay_3us
;;		_Key_Event
;;		_Key_Scan
;;		_RF_CE_High
;;		_RF_CE_Low
;;		_RF_Refresh_State
;;		_RF_SPI_Read_Byte
;;		_RF_SPI_Read_Reg
;;		_RF_SPI_Write_Byte
;;		_Soft_Decode
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	285
global __ptext15
__ptext15:	;psect for function _RF_RX_Data
psect	text15
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	285
	global	__size_of_RF_RX_Data
	__size_of_RF_RX_Data	equ	__end_of_RF_RX_Data-_RF_RX_Data
	
_RF_RX_Data:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_RX_Data: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;RF_RX_Data@rx_buff stored from wreg
	movwf	(RF_RX_Data@rx_buff)
	line	287
	
l6313:	
;SC8F054_xl2400t.c: 287: TRISB = 0B00000000;
	clrf	(5)	;volatile
	line	288
	
l6315:	
;SC8F054_xl2400t.c: 288: if(key_control.key_rec_flag_pb == 0)
	btfsc	(_key_control),6
	goto	u1991
	goto	u1990
u1991:
	goto	l6341
u1990:
	line	290
	
l6317:	
;SC8F054_xl2400t.c: 289: {
;SC8F054_xl2400t.c: 290: if(RF_SPI_Read_Reg((0X07)) & (0x40))
	movlw	low(07h)
	fcall	_RF_SPI_Read_Reg
	andlw	040h
	btfsc	status,2
	goto	u2001
	goto	u2000
u2001:
	goto	l6341
u2000:
	line	292
	
l6319:	
;SC8F054_xl2400t.c: 291: {
;SC8F054_xl2400t.c: 292: RF_CE_Low();
	fcall	_RF_CE_Low
	line	293
;SC8F054_xl2400t.c: 293: soft_recieve_control.data_length_count = RF_SPI_Read_Reg(0x60);
	movlw	low(060h)
	fcall	_RF_SPI_Read_Reg
	movwf	0+(_soft_recieve_control)+06h
	line	294
	
l6321:	
;SC8F054_xl2400t.c: 294: RB0 = 0;
	bcf	(48/8),(48)&7	;volatile
	line	295
;SC8F054_xl2400t.c: 295: RF_SPI_Write_Byte(0x61);
	movlw	low(061h)
	fcall	_RF_SPI_Write_Byte
	line	296
	
l6323:	
;SC8F054_xl2400t.c: 296: rx_buff[0] = RF_SPI_Read_Byte();
	movf	(RF_RX_Data@rx_buff),w
	movwf	fsr0
	fcall	_RF_SPI_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	297
	
l6325:	
;SC8F054_xl2400t.c: 297: rx_buff[1] = RF_SPI_Read_Byte();
	incf	(RF_RX_Data@rx_buff),w
	movwf	fsr0
	fcall	_RF_SPI_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	298
	
l6327:	
;SC8F054_xl2400t.c: 298: rx_buff[2] = RF_SPI_Read_Byte();
	movf	(RF_RX_Data@rx_buff),w
	addlw	02h
	movwf	fsr0
	fcall	_RF_SPI_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	299
	
l6329:	
;SC8F054_xl2400t.c: 299: rx_buff[3] = RF_SPI_Read_Byte();
	movf	(RF_RX_Data@rx_buff),w
	addlw	03h
	movwf	fsr0
	fcall	_RF_SPI_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	300
	
l6331:	
;SC8F054_xl2400t.c: 300: rx_buff[4] = RF_SPI_Read_Byte();
	movf	(RF_RX_Data@rx_buff),w
	addlw	04h
	movwf	fsr0
	fcall	_RF_SPI_Read_Byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	301
	
l6333:	
;SC8F054_xl2400t.c: 301: RB0 = 1;
	bsf	(48/8),(48)&7	;volatile
	line	302
	
l6335:	
;SC8F054_xl2400t.c: 302: Soft_Decode();
	fcall	_Soft_Decode
	line	303
	
l6337:	
;SC8F054_xl2400t.c: 303: RF_Refresh_State();
	fcall	_RF_Refresh_State
	line	304
	
l6339:	
;SC8F054_xl2400t.c: 304: RF_CE_High();
	fcall	_RF_CE_High
	line	308
	
l6341:	
;SC8F054_xl2400t.c: 305: }
;SC8F054_xl2400t.c: 306: }
;SC8F054_xl2400t.c: 308: Delay_3us();
	fcall	_Delay_3us
	line	309
	
l6343:	
;SC8F054_xl2400t.c: 309: TRISB = 0B00000001;
	movlw	low(01h)
	movwf	(5)	;volatile
	line	310
	
l6345:	
;SC8F054_xl2400t.c: 310: Delay_3us();
	fcall	_Delay_3us
	line	311
	
l6347:	
;SC8F054_xl2400t.c: 311: Key_Scan();
	fcall	_Key_Scan
	line	312
	
l6349:	
;SC8F054_xl2400t.c: 312: Key_Event();
	fcall	_Key_Event
	line	313
	
l6351:	
;SC8F054_xl2400t.c: 313: Delay_3us();
	fcall	_Delay_3us
	line	314
	
l3570:	
	return
	opt stack 0
GLOBAL	__end_of_RF_RX_Data
	__end_of_RF_RX_Data:
	signat	_RF_RX_Data,4217
	global	_Soft_Decode

;; *************** function _Soft_Decode *****************
;; Defined at:
;;		line 14 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_soft.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 900/0
;;		On exit  : 800/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       5       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___awmod
;; This function is called by:
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_soft.c"
	line	14
global __ptext16
__ptext16:	;psect for function _Soft_Decode
psect	text16
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_soft.c"
	line	14
	global	__size_of_Soft_Decode
	__size_of_Soft_Decode	equ	__end_of_Soft_Decode-_Soft_Decode
	
_Soft_Decode:	
;incstack = 0
	opt	stack 3
; Regs used in _Soft_Decode: [wreg+status,2+status,0+pclath+cstack]
	line	39
	
l6015:	
;SC8F054_soft.c: 16: {
;SC8F054_soft.c: 39: if(soft_recieve_control.data_length_count == 5)
		movlw	5
	xorwf	(0+(_soft_recieve_control)+06h),w
	btfss	status,2
	goto	u1561
	goto	u1560
u1561:
	goto	l2939
u1560:
	line	43
	
l6017:	
;SC8F054_soft.c: 40: {
;SC8F054_soft.c: 42: if((soft_data[0] != soft_recieve_control.temp0) || (soft_data[1] != soft_recieve_control.temp1)
;SC8F054_soft.c: 43: || (soft_data[2] != soft_recieve_control.temp2) || (soft_data[3] != soft_recieve_control.temp3))
	movf	0+(_soft_recieve_control)+09h,w
	bsf	status, 5	;RP0=1, select bank1
	xorwf	(_soft_data)^080h,w
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l6025
u1570:
	
l6019:	
	movf	0+(_soft_data)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	xorwf	0+(_soft_recieve_control)+0Ah,w
	skipz
	goto	u1581
	goto	u1580
u1581:
	goto	l6025
u1580:
	
l6021:	
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	xorwf	0+(_soft_recieve_control)+0Bh,w
	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l6025
u1590:
	
l6023:	
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	xorwf	0+(_soft_recieve_control)+0Ch,w
	skipnz
	goto	u1601
	goto	u1600
u1601:
	goto	l2939
u1600:
	line	46
	
l6025:	
;SC8F054_soft.c: 44: {
;SC8F054_soft.c: 46: if(((soft_data[0] + soft_data[1] + soft_data[2] + soft_data[3]) & 0x0ff) == soft_data[4])
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	addwf	0+(_soft_data)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_Soft_Decode+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	0+(??_Soft_Decode+0)+0,w
	movwf	(??_Soft_Decode+1)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(_soft_data)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	0+(??_Soft_Decode+1)+0,w
	bsf	status, 5	;RP0=1, select bank1
	xorwf	0+(_soft_data)^080h+04h,w
	skipz
	goto	u1611
	goto	u1610
u1611:
	goto	l2939
u1610:
	line	48
	
l6027:	
;SC8F054_soft.c: 47: {
;SC8F054_soft.c: 48: soft_recieve_control.temp0 = soft_data[0];
	movf	(_soft_data)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_soft_recieve_control)+09h
	line	49
;SC8F054_soft.c: 49: soft_recieve_control.temp1 = soft_data[1];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_soft_recieve_control)+0Ah
	line	50
;SC8F054_soft.c: 50: soft_recieve_control.temp2 = soft_data[2];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_soft_recieve_control)+0Bh
	line	51
;SC8F054_soft.c: 51: soft_recieve_control.temp3 = soft_data[3];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_soft_recieve_control)+0Ch
	line	52
;SC8F054_soft.c: 52: soft_recieve_control.function_data = soft_data[3];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_soft_recieve_control)+08h
	line	53
;SC8F054_soft.c: 53: soft_recieve_control.Channel = soft_data[0] & 0xff;
	bsf	status, 5	;RP0=1, select bank1
	movf	(_soft_data)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_soft_recieve_control)+0Eh
	line	54
;SC8F054_soft.c: 54: sleep_control.sleep_count = 13;
	movlw	0Dh
	movwf	0+(_sleep_control)+01h
	clrf	1+(_sleep_control)+01h
	line	55
	
l6029:	
;SC8F054_soft.c: 55: sleep_control.recieve_sleep_flag = 1;
	bsf	(_sleep_control),1
	line	56
	
l6031:	
;SC8F054_soft.c: 56: soft_recieve_control.randnum_flag = 0;
	bcf	(_soft_recieve_control),5
	line	59
	
l6033:	
;SC8F054_soft.c: 58: if((soft_recieve_control.function_data == 0x20) || (soft_recieve_control.function_data == 0xE0)
;SC8F054_soft.c: 59: || (soft_recieve_control.function_data == 0xC0) || (soft_recieve_control.function_data == 0x40))
		movlw	32
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfsc	status,2
	goto	u1621
	goto	u1620
u1621:
	goto	l2897
u1620:
	
l6035:	
		movlw	224
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfsc	status,2
	goto	u1631
	goto	u1630
u1631:
	goto	l2897
u1630:
	
l6037:	
		movlw	192
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfsc	status,2
	goto	u1641
	goto	u1640
u1641:
	goto	l2897
u1640:
	
l6039:	
		movlw	64
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1651
	goto	u1650
u1651:
	goto	l6081
u1650:
	
l2897:	
	line	61
;SC8F054_soft.c: 60: {
;SC8F054_soft.c: 61: soft_recieve_control.recieve_bit = 1;
	bsf	(_soft_recieve_control),1
	line	63
	
l6041:	
;SC8F054_soft.c: 63: if((soft_recieve_control.Channel | (soft_data[1] << 8)) & (1 << (led_control.add_data - 1)))
	movf	0+(_led_control)+015h,w
	addlw	-1
	movwf	(??_Soft_Decode+0)+0
	incf	(??_Soft_Decode+0)+0,f
	movlw	01h
	movwf	(??_Soft_Decode+1)+0
	movlw	0
	movwf	(??_Soft_Decode+1)+0+1
	goto	u1664
u1665:
	clrc
	rlf	(??_Soft_Decode+1)+0,f
	rlf	(??_Soft_Decode+1)+1,f
u1664:
	decfsz	(??_Soft_Decode+0)+0,f
	goto	u1665
	
	movf	0+(??_Soft_Decode+1)+0,w
	andwf	0+(_soft_recieve_control)+0Eh,w
	movwf	(??_Soft_Decode+3)+0
	movf	1+(??_Soft_Decode+1)+0,w
	bsf	status, 5	;RP0=1, select bank1
	andwf	0+(_soft_data)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(??_Soft_Decode+3)+0
	movf	((??_Soft_Decode+3)+0),w
iorwf	((??_Soft_Decode+3)+1),w
	btfsc	status,2
	goto	u1671
	goto	u1670
u1671:
	goto	l6073
u1670:
	line	65
	
l6043:	
;SC8F054_soft.c: 64: {
;SC8F054_soft.c: 65: if(soft_recieve_control.function_data == 0x20)
		movlw	32
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1681
	goto	u1680
u1681:
	goto	l6057
u1680:
	line	67
	
l6045:	
;SC8F054_soft.c: 66: {
;SC8F054_soft.c: 67: led_control.led_color = (soft_data[2] >> 4) & 0x0f;
	bsf	status, 5	;RP0=1, select bank1
	swapf	0+(_soft_data)^080h+02h,w
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+07h
	movlw	low(0Fh)
	andwf	0+(_led_control)+07h,f
	line	68
	
l6047:	
;SC8F054_soft.c: 68: led_control.led_mode = (soft_data[2]) & 0x0f;
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+08h
	
l6049:	
	movlw	low(0Fh)
	andwf	0+(_led_control)+08h,f
	line	70
	
l6051:	
;SC8F054_soft.c: 70: led_control.quick_control = 0;
	clrf	0+(_led_control)+014h
	line	71
	
l6053:	
;SC8F054_soft.c: 71: if(led_control.led_color != 0)
	movf	(0+(_led_control)+07h),w
	btfsc	status,2
	goto	u1691
	goto	u1690
u1691:
	goto	l6079
u1690:
	line	72
	
l6055:	
;SC8F054_soft.c: 72: led_control.last_quick_led = led_control.led_color;
	movf	0+(_led_control)+07h,w
	movwf	0+(_led_control)+012h
	goto	l6079
	line	74
	
l6057:	
;SC8F054_soft.c: 74: else if(soft_recieve_control.function_data == 0xE0)
		movlw	224
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1701
	goto	u1700
u1701:
	goto	l6061
u1700:
	line	76
	
l6059:	
;SC8F054_soft.c: 75: {
;SC8F054_soft.c: 76: led_control.led_mode = 2;
	movlw	low(02h)
	movwf	0+(_led_control)+08h
	line	77
;SC8F054_soft.c: 77: led_control.led_color = led_control.last_quick_led;
	movf	0+(_led_control)+012h,w
	movwf	0+(_led_control)+07h
	line	78
;SC8F054_soft.c: 78: }
	goto	l6079
	line	79
	
l6061:	
;SC8F054_soft.c: 79: else if(soft_recieve_control.function_data == 0xC0)
		movlw	192
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1711
	goto	u1710
u1711:
	goto	l6065
u1710:
	line	81
	
l6063:	
;SC8F054_soft.c: 80: {
;SC8F054_soft.c: 81: led_control.add_data = (soft_data[2] & 0x0f) + 1;
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	andlw	0Fh
	addlw	01h
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+015h
	line	82
;SC8F054_soft.c: 82: }
	goto	l6079
	line	83
	
l6065:	
;SC8F054_soft.c: 83: else if(soft_recieve_control.function_data == 0x40)
		movlw	64
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1721
	goto	u1720
u1721:
	goto	l6079
u1720:
	line	85
	
l6067:	
;SC8F054_soft.c: 84: {
;SC8F054_soft.c: 85: led_control.led_color = (soft_data[2] >>4) & 0x0f;
	bsf	status, 5	;RP0=1, select bank1
	swapf	0+(_soft_data)^080h+02h,w
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+07h
	movlw	low(0Fh)
	andwf	0+(_led_control)+07h,f
	line	86
	
l6069:	
;SC8F054_soft.c: 86: led_control.led_mode = soft_data[2] & 0x0f;
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+08h
	
l6071:	
	movlw	low(0Fh)
	andwf	0+(_led_control)+08h,f
	goto	l6079
	line	89
	
l6073:	
;SC8F054_soft.c: 89: else if(soft_recieve_control.function_data == 0x40)
		movlw	64
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1731
	goto	u1730
u1731:
	goto	l6079
u1730:
	line	91
	
l6075:	
;SC8F054_soft.c: 90: {
;SC8F054_soft.c: 91: led_control.led_mode = 1;
	clrf	0+(_led_control)+08h
	incf	0+(_led_control)+08h,f
	line	92
	
l6077:	
;SC8F054_soft.c: 92: led_control.led_color = 0;
	clrf	0+(_led_control)+07h
	line	94
	
l6079:	
;SC8F054_soft.c: 93: }
;SC8F054_soft.c: 94: soft_recieve_control.clear_bit = 1;
	bsf	(_soft_recieve_control),2
	line	95
;SC8F054_soft.c: 95: }
	goto	l6217
	line	96
	
l6081:	
;SC8F054_soft.c: 96: else if(soft_recieve_control.function_data == 0x60)
		movlw	96
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1741
	goto	u1740
u1741:
	goto	l6089
u1740:
	line	98
	
l6083:	
;SC8F054_soft.c: 97: {
;SC8F054_soft.c: 98: soft_recieve_control.recieve_bit = 0;
	bcf	(_soft_recieve_control),1
	line	99
;SC8F054_soft.c: 99: soft_recieve_control.clear_bit = 1;
	bsf	(_soft_recieve_control),2
	line	100
	
l6085:	
;SC8F054_soft.c: 100: led_control.led_color = 0;
	clrf	0+(_led_control)+07h
	line	101
	
l6087:	
;SC8F054_soft.c: 101: led_control.led_mode = 2;
	movlw	low(02h)
	movwf	0+(_led_control)+08h
	line	102
;SC8F054_soft.c: 102: }
	goto	l6217
	line	103
	
l6089:	
;SC8F054_soft.c: 103: else if(soft_recieve_control.function_data == 0xD0)
		movlw	208
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1751
	goto	u1750
u1751:
	goto	l6103
u1750:
	line	105
	
l6091:	
;SC8F054_soft.c: 104: {
;SC8F054_soft.c: 105: soft_recieve_control.recieve_bit = 1;
	bsf	(_soft_recieve_control),1
	line	106
	
l6093:	
;SC8F054_soft.c: 106: led_control.led_color = (soft_data[2] >> 4) & 0x0f;
	bsf	status, 5	;RP0=1, select bank1
	swapf	0+(_soft_data)^080h+02h,w
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+07h
	movlw	low(0Fh)
	andwf	0+(_led_control)+07h,f
	line	107
	
l6095:	
;SC8F054_soft.c: 107: led_control.led_color = (led_control.led_color + led_control.add_data) % 10 + 1;
	movlw	0Ah
	movwf	(___awmod@divisor)
	clrf	(___awmod@divisor+1)
	movf	0+(_led_control)+07h,w
	addwf	0+(_led_control)+015h,w
	movwf	(___awmod@dividend)
	clrf	(___awmod@dividend)+1
	rlf	1+(___awmod@dividend),f
	
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	01h
	movwf	0+(_led_control)+07h
	goto	l6069
	line	111
	
l6103:	
;SC8F054_soft.c: 111: else if(soft_recieve_control.function_data == 0x80)
		movlw	128
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1761
	goto	u1760
u1761:
	goto	l6141
u1760:
	line	113
	
l6105:	
;SC8F054_soft.c: 112: {
;SC8F054_soft.c: 113: soft_recieve_control.recieve_bit = 1;
	bsf	(_soft_recieve_control),1
	line	114
	
l6107:	
;SC8F054_soft.c: 114: if((soft_recieve_control.Channel | (soft_data[1] << 8)) & (1 << (led_control.add_data - 1)))
	movf	0+(_led_control)+015h,w
	addlw	-1
	movwf	(??_Soft_Decode+0)+0
	incf	(??_Soft_Decode+0)+0,f
	movlw	01h
	movwf	(??_Soft_Decode+1)+0
	movlw	0
	movwf	(??_Soft_Decode+1)+0+1
	goto	u1774
u1775:
	clrc
	rlf	(??_Soft_Decode+1)+0,f
	rlf	(??_Soft_Decode+1)+1,f
u1774:
	decfsz	(??_Soft_Decode+0)+0,f
	goto	u1775
	
	movf	0+(??_Soft_Decode+1)+0,w
	andwf	0+(_soft_recieve_control)+0Eh,w
	movwf	(??_Soft_Decode+3)+0
	movf	1+(??_Soft_Decode+1)+0,w
	bsf	status, 5	;RP0=1, select bank1
	andwf	0+(_soft_data)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(??_Soft_Decode+3)+0
	movf	((??_Soft_Decode+3)+0),w
iorwf	((??_Soft_Decode+3)+1),w
	btfsc	status,2
	goto	u1781
	goto	u1780
u1781:
	goto	l6079
u1780:
	line	116
	
l6109:	
;SC8F054_soft.c: 115: {
;SC8F054_soft.c: 116: led_control.led_color = (soft_data[2] >> 4) & 0x0f;
	bsf	status, 5	;RP0=1, select bank1
	swapf	0+(_soft_data)^080h+02h,w
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+07h
	movlw	low(0Fh)
	andwf	0+(_led_control)+07h,f
	line	117
	
l6111:	
;SC8F054_soft.c: 117: led_control.breath_time = 0;
	clrf	0+(_led_control)+0Ah
	line	118
	
l6113:	
;SC8F054_soft.c: 118: led_control.led_mode = 14;
	movlw	low(0Eh)
	movwf	0+(_led_control)+08h
	line	119
	
l6115:	
;SC8F054_soft.c: 119: led_control.breath_flag = soft_data[2] & 0x0f;
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_led_control)
	
l6117:	
	movlw	low(0Fh)
	andwf	(_led_control),f
	line	120
	
l6119:	
;SC8F054_soft.c: 120: led_control.breath_start_off_time = 10;
	movlw	low(0Ah)
	movwf	0+(_led_control)+0Bh
	line	121
	
l6121:	
;SC8F054_soft.c: 121: led_control.led_mode_count = 10;
	movlw	low(0Ah)
	movwf	0+(_led_control)+09h
	line	122
	
l6123:	
;SC8F054_soft.c: 122: led_control.breat_time_control = 10;
	movlw	low(0Ah)
	movwf	0+(_led_control)+013h
	line	124
	
l6125:	
;SC8F054_soft.c: 124: if(led_control.breath_flag == 1)
		decf	((_led_control)),w
	btfss	status,2
	goto	u1791
	goto	u1790
u1791:
	goto	l6129
u1790:
	line	126
	
l6127:	
;SC8F054_soft.c: 125: {
;SC8F054_soft.c: 126: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	127
;SC8F054_soft.c: 127: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	128
;SC8F054_soft.c: 128: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	line	129
;SC8F054_soft.c: 129: }
	goto	l6079
	line	130
	
l6129:	
;SC8F054_soft.c: 130: else if(led_control.breath_flag == 0)
	movf	((_led_control)),w
	btfss	status,2
	goto	u1801
	goto	u1800
u1801:
	goto	l6133
u1800:
	line	132
	
l6131:	
;SC8F054_soft.c: 131: {
;SC8F054_soft.c: 132: led_control.color_p = 0;
	clrf	0+(_led_control)+0Dh
	line	133
;SC8F054_soft.c: 133: }
	goto	l6079
	line	134
	
l6133:	
;SC8F054_soft.c: 134: else if(led_control.breath_flag == 2)
		movlw	2
	xorwf	((_led_control)),w
	btfss	status,2
	goto	u1811
	goto	u1810
u1811:
	goto	l2917
u1810:
	line	136
	
l6135:	
;SC8F054_soft.c: 135: {
;SC8F054_soft.c: 136: led_control.breath_start_off_time = 17;
	movlw	low(011h)
	movwf	0+(_led_control)+0Bh
	line	137
;SC8F054_soft.c: 137: led_control.led_mode_count = 15;
	movlw	low(0Fh)
	movwf	0+(_led_control)+09h
	line	138
;SC8F054_soft.c: 138: led_control.breat_time_control = 15;
	movlw	low(0Fh)
	movwf	0+(_led_control)+013h
	goto	l6131
	line	141
	
l2917:	
	goto	l6079
	line	144
	
l6141:	
;SC8F054_soft.c: 144: else if(soft_recieve_control.function_data == 0xB0)
		movlw	176
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1821
	goto	u1820
u1821:
	goto	l6187
u1820:
	line	146
	
l6143:	
;SC8F054_soft.c: 145: {
;SC8F054_soft.c: 146: soft_recieve_control.recieve_bit = 1;
	bsf	(_soft_recieve_control),1
	line	147
	
l6145:	
;SC8F054_soft.c: 147: soft_recieve_control.stroge_flag = soft_data[2] & 0x03;
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_soft_recieve_control)+01h
	
l6147:	
	movlw	low(03h)
	andwf	0+(_soft_recieve_control)+01h,f
	line	149
	
l6149:	
;SC8F054_soft.c: 149: if((soft_recieve_control.Channel | (soft_data[1] << 8)) & (1 << (led_control.add_data - 1)))
	movf	0+(_led_control)+015h,w
	addlw	-1
	movwf	(??_Soft_Decode+0)+0
	incf	(??_Soft_Decode+0)+0,f
	movlw	01h
	movwf	(??_Soft_Decode+1)+0
	movlw	0
	movwf	(??_Soft_Decode+1)+0+1
	goto	u1834
u1835:
	clrc
	rlf	(??_Soft_Decode+1)+0,f
	rlf	(??_Soft_Decode+1)+1,f
u1834:
	decfsz	(??_Soft_Decode+0)+0,f
	goto	u1835
	
	movf	0+(??_Soft_Decode+1)+0,w
	andwf	0+(_soft_recieve_control)+0Eh,w
	movwf	(??_Soft_Decode+3)+0
	movf	1+(??_Soft_Decode+1)+0,w
	bsf	status, 5	;RP0=1, select bank1
	andwf	0+(_soft_data)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(??_Soft_Decode+3)+0
	movf	((??_Soft_Decode+3)+0),w
iorwf	((??_Soft_Decode+3)+1),w
	btfsc	status,2
	goto	u1841
	goto	u1840
u1841:
	goto	l6165
u1840:
	line	151
	
l6151:	
;SC8F054_soft.c: 150: {
;SC8F054_soft.c: 151: led_control.led_color = led_control.last_quick_led;
	movf	0+(_led_control)+012h,w
	movwf	0+(_led_control)+07h
	line	152
	
l6153:	
;SC8F054_soft.c: 152: led_control.quick_control = 1;
	clrf	0+(_led_control)+014h
	incf	0+(_led_control)+014h,f
	line	153
	
l6155:	
;SC8F054_soft.c: 153: led_control.led_mode_count = 0;
	clrf	0+(_led_control)+09h
	line	154
	
l6157:	
;SC8F054_soft.c: 154: soft_recieve_control.quick_flag = 1;
	bsf	(_soft_recieve_control),6
	line	155
	
l6159:	
;SC8F054_soft.c: 155: if(soft_recieve_control.stroge_flag == 2)
		movlw	2
	xorwf	(0+(_soft_recieve_control)+01h),w
	btfss	status,2
	goto	u1851
	goto	u1850
u1851:
	goto	l6177
u1850:
	line	157
	
l6161:	
;SC8F054_soft.c: 156: {
;SC8F054_soft.c: 157: led_control.led_color = 0;
	clrf	0+(_led_control)+07h
	line	158
	
l6163:	
;SC8F054_soft.c: 158: soft_recieve_control.quick_flag = 0;
	bcf	(_soft_recieve_control),6
	goto	l6177
	line	163
	
l6165:	
;SC8F054_soft.c: 161: else
;SC8F054_soft.c: 162: {
;SC8F054_soft.c: 163: if((soft_recieve_control.stroge_flag == 2) && (led_control.quick_control == 1))
		movlw	2
	xorwf	(0+(_soft_recieve_control)+01h),w
	btfss	status,2
	goto	u1861
	goto	u1860
u1861:
	goto	l6171
u1860:
	
l6167:	
		decf	(0+(_led_control)+014h),w
	btfss	status,2
	goto	u1871
	goto	u1870
u1871:
	goto	l6171
u1870:
	line	165
	
l6169:	
;SC8F054_soft.c: 164: {
;SC8F054_soft.c: 165: led_control.led_color = led_control.last_quick_led;
	movf	0+(_led_control)+012h,w
	movwf	0+(_led_control)+07h
	line	166
;SC8F054_soft.c: 166: }
	goto	l6177
	line	167
	
l6171:	
;SC8F054_soft.c: 167: else if(led_control.quick_control == 0)
	movf	(0+(_led_control)+014h),w
	btfss	status,2
	goto	u1881
	goto	u1880
u1881:
	goto	l6177
u1880:
	line	169
	
l6173:	
;SC8F054_soft.c: 168: {
;SC8F054_soft.c: 169: if(led_control.led_color == 0)
	movf	(0+(_led_control)+07h),w
	btfss	status,2
	goto	u1891
	goto	u1890
u1891:
	goto	l6177
u1890:
	line	170
	
l6175:	
;SC8F054_soft.c: 170: led_control.led_color = 0;
	clrf	0+(_led_control)+07h
	line	175
	
l6177:	
;SC8F054_soft.c: 171: }
;SC8F054_soft.c: 172: }
;SC8F054_soft.c: 175: if(soft_recieve_control.quick_flag == 1)
	btfss	(_soft_recieve_control),6
	goto	u1901
	goto	u1900
u1901:
	goto	l6079
u1900:
	line	177
	
l6179:	
;SC8F054_soft.c: 176: {
;SC8F054_soft.c: 177: if(led_control.last_quick_led >= 1)
	movf	(0+(_led_control)+012h),w
	btfsc	status,2
	goto	u1911
	goto	u1910
u1911:
	goto	l6183
u1910:
	line	178
	
l6181:	
;SC8F054_soft.c: 178: led_control.led_mode = 4;
	movlw	low(04h)
	movwf	0+(_led_control)+08h
	line	179
	
l6183:	
;SC8F054_soft.c: 179: soft_recieve_control.quick_flag = 0;
	bcf	(_soft_recieve_control),6
	goto	l6079
	line	184
	
l6187:	
;SC8F054_soft.c: 184: else if(soft_recieve_control.function_data == 0xF0)
		movlw	240
	xorwf	(0+(_soft_recieve_control)+08h),w
	btfss	status,2
	goto	u1921
	goto	u1920
u1921:
	goto	l2913
u1920:
	line	186
	
l6189:	
;SC8F054_soft.c: 185: {
;SC8F054_soft.c: 186: soft_recieve_control.recieve_bit = 1;
	bsf	(_soft_recieve_control),1
	line	189
	
l6191:	
;SC8F054_soft.c: 189: if((soft_data[2] & 0x0f) == soft_recieve_control.rand_num)
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_soft_data)^080h+02h,w
	andlw	0Fh
	bcf	status, 5	;RP0=0, select bank0
	xorwf	0+(_soft_recieve_control)+0Dh,w
	skipz
	goto	u1931
	goto	u1930
u1931:
	goto	l6205
u1930:
	line	191
	
l6193:	
;SC8F054_soft.c: 190: {
;SC8F054_soft.c: 191: if(!soft_recieve_control.Snowflake_flag)
	btfsc	(_soft_recieve_control),4
	goto	u1941
	goto	u1940
u1941:
	goto	l6205
u1940:
	line	193
	
l6195:	
;SC8F054_soft.c: 192: {
;SC8F054_soft.c: 193: soft_recieve_control.randnum_flag = 1;
	bsf	(_soft_recieve_control),5
	line	194
;SC8F054_soft.c: 194: soft_recieve_control.Snowflake_flag = 1;
	bsf	(_soft_recieve_control),4
	line	195
	
l6197:	
;SC8F054_soft.c: 195: soft_recieve_control.Snowflake_dit_off = 0;
	clrf	0+(_soft_recieve_control)+010h
	line	196
	
l6199:	
;SC8F054_soft.c: 196: led_control.led_mode = 2;
	movlw	low(02h)
	movwf	0+(_led_control)+08h
	line	197
	
l6201:	
;SC8F054_soft.c: 197: led_control.led_color = ((soft_data[2] >> 4) & 0x0f);
	bsf	status, 5	;RP0=1, select bank1
	swapf	0+(_soft_data)^080h+02h,w
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_led_control)+07h
	
l6203:	
	movlw	low(0Fh)
	andwf	0+(_led_control)+07h,f
	line	202
	
l6205:	
;SC8F054_soft.c: 198: }
;SC8F054_soft.c: 199: }
;SC8F054_soft.c: 202: if(soft_recieve_control.Snowflake_flag)
	btfss	(_soft_recieve_control),4
	goto	u1951
	goto	u1950
u1951:
	goto	l6079
u1950:
	line	204
	
l6207:	
;SC8F054_soft.c: 203: {
;SC8F054_soft.c: 204: if(++soft_recieve_control.Snowflake_dit_off > 2)
	movlw	low(03h)
	incf	0+(_soft_recieve_control)+010h,f
	subwf	(0+(_soft_recieve_control)+010h),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l6079
u1960:
	line	207
	
l6209:	
;SC8F054_soft.c: 205: {
;SC8F054_soft.c: 207: led_control.led_mode = 1;
	clrf	0+(_led_control)+08h
	incf	0+(_led_control)+08h,f
	line	208
	
l6211:	
;SC8F054_soft.c: 208: soft_recieve_control.Snowflake_dit_off = 0;
	clrf	0+(_soft_recieve_control)+010h
	line	209
	
l6213:	
;SC8F054_soft.c: 209: soft_recieve_control.Snowflake_flag = 0;
	bcf	(_soft_recieve_control),4
	goto	l6079
	line	215
	
l2913:	
	
l6217:	
;SC8F054_soft.c: 214: }
;SC8F054_soft.c: 215: if(soft_recieve_control.clear_bit)
	btfss	(_soft_recieve_control),2
	goto	u1971
	goto	u1970
u1971:
	goto	l2891
u1970:
	line	217
	
l6219:	
;SC8F054_soft.c: 216: {
;SC8F054_soft.c: 217: soft_recieve_control.data_length_count = 0;
	clrf	0+(_soft_recieve_control)+06h
	line	218
	
l6221:	
;SC8F054_soft.c: 218: soft_recieve_control.clear_bit = 0;
	bcf	(_soft_recieve_control),2
	line	219
;SC8F054_soft.c: 219: soft_recieve_control.Channel = 0;
	clrf	0+(_soft_recieve_control)+0Eh
	line	220
;SC8F054_soft.c: 220: soft_data[0] = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_soft_data)^080h
	line	221
;SC8F054_soft.c: 221: soft_recieve_control.function_data = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	0+(_soft_recieve_control)+08h
	goto	l2939
	line	224
	
l2891:	
	line	227
	
l2939:	
	return
	opt stack 0
GLOBAL	__end_of_Soft_Decode
	__end_of_Soft_Decode:
	signat	_Soft_Decode,89
	global	___awmod

;; *************** function ___awmod *****************
;; Defined at:
;;		line 6 in file "D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    5[BANK0 ] unsigned char 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 900/0
;;		On exit  : 900/0
;;		Unchanged: 800/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       4       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Soft_Decode
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\awmod.c"
	line	6
global __ptext17
__ptext17:	;psect for function ___awmod
psect	text17
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\awmod.c"
	line	6
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
;incstack = 0
	opt	stack 3
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	13
	
l5763:	
	clrf	(___awmod@sign)
	line	14
	
l5765:	
	btfss	(___awmod@dividend+1),7
	goto	u1251
	goto	u1250
u1251:
	goto	l5771
u1250:
	line	15
	
l5767:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	16
	
l5769:	
	clrf	(___awmod@sign)
	incf	(___awmod@sign),f
	line	18
	
l5771:	
	btfss	(___awmod@divisor+1),7
	goto	u1261
	goto	u1260
u1261:
	goto	l5775
u1260:
	line	19
	
l5773:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	line	20
	
l5775:	
	movf	((___awmod@divisor)),w
iorwf	((___awmod@divisor+1)),w
	btfsc	status,2
	goto	u1271
	goto	u1270
u1271:
	goto	l5791
u1270:
	line	21
	
l5777:	
	clrf	(___awmod@counter)
	incf	(___awmod@counter),f
	line	22
	goto	l5781
	line	23
	
l5779:	
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	line	24
	incf	(___awmod@counter),f
	line	22
	
l5781:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u1281
	goto	u1280
u1281:
	goto	l5779
u1280:
	line	27
	
l5783:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u1295
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u1295:
	skipc
	goto	u1291
	goto	u1290
u1291:
	goto	l5787
u1290:
	line	28
	
l5785:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	line	29
	
l5787:	
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	line	30
	
l5789:	
	decfsz	(___awmod@counter),f
	goto	u1301
	goto	u1300
u1301:
	goto	l5783
u1300:
	line	32
	
l5791:	
	movf	((___awmod@sign)),w
	btfsc	status,2
	goto	u1311
	goto	u1310
u1311:
	goto	l5795
u1310:
	line	33
	
l5793:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	34
	
l5795:	
	movf	(___awmod@dividend+1),w
	movwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	movwf	(?___awmod)
	line	35
	
l4308:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
	signat	___awmod,8314
	global	_RF_SPI_Read_Reg

;; *************** function _RF_SPI_Read_Reg *****************
;; Defined at:
;;		line 78 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  RF_Reg          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  RF_Reg          1    2[BANK0 ] unsigned char 
;;  rTemp           1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_RF_SPI_Read_Byte
;;		_RF_SPI_Write_Byte
;; This function is called by:
;;		_RF_Set_Chn
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	78
global __ptext18
__ptext18:	;psect for function _RF_SPI_Read_Reg
psect	text18
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	78
	global	__size_of_RF_SPI_Read_Reg
	__size_of_RF_SPI_Read_Reg	equ	__end_of_RF_SPI_Read_Reg-_RF_SPI_Read_Reg
	
_RF_SPI_Read_Reg:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_SPI_Read_Reg: [wreg+status,2+status,0+pclath+cstack]
;RF_SPI_Read_Reg@RF_Reg stored from wreg
	movwf	(RF_SPI_Read_Reg@RF_Reg)
	line	80
	
l5707:	
	line	81
	
l5709:	
;SC8F054_xl2400t.c: 81: RB0 = 0;
	bcf	(48/8),(48)&7	;volatile
	line	82
	
l5711:	
;SC8F054_xl2400t.c: 82: RF_SPI_Write_Byte(RF_Reg);
	movf	(RF_SPI_Read_Reg@RF_Reg),w
	fcall	_RF_SPI_Write_Byte
	line	83
	
l5713:	
;SC8F054_xl2400t.c: 83: rTemp = RF_SPI_Read_Byte();
	fcall	_RF_SPI_Read_Byte
	movwf	(RF_SPI_Read_Reg@rTemp)
	line	84
	
l5715:	
;SC8F054_xl2400t.c: 84: RB0 = 1;
	bsf	(48/8),(48)&7	;volatile
	line	85
	
l5717:	
;SC8F054_xl2400t.c: 85: return rTemp;
	movf	(RF_SPI_Read_Reg@rTemp),w
	line	86
	
l3510:	
	return
	opt stack 0
GLOBAL	__end_of_RF_SPI_Read_Reg
	__end_of_RF_SPI_Read_Reg:
	signat	_RF_SPI_Read_Reg,4217
	global	_RF_SPI_Read_Byte

;; *************** function _RF_SPI_Read_Byte *****************
;; Defined at:
;;		line 40 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    1[BANK0 ] unsigned char 
;;  buff            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_SPI_Read_Reg
;;		_RF_Read_Buff
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=0
	line	40
global __ptext19
__ptext19:	;psect for function _RF_SPI_Read_Byte
psect	text19
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	40
	global	__size_of_RF_SPI_Read_Byte
	__size_of_RF_SPI_Read_Byte	equ	__end_of_RF_SPI_Read_Byte-_RF_SPI_Read_Byte
	
_RF_SPI_Read_Byte:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_SPI_Read_Byte: [wreg+status,2+status,0]
	line	42
	
l5659:	
;SC8F054_xl2400t.c: 42: TRISB = 0B00100000;
	movlw	low(020h)
	movwf	(5)	;volatile
	line	43
	
l5661:	
;SC8F054_xl2400t.c: 43: unsigned char buff = 0;
	clrf	(RF_SPI_Read_Byte@buff)
	line	44
	
l5663:	
	line	46
	
l5665:	
;SC8F054_xl2400t.c: 46: for(i = 0; i < 8; i++)
	clrf	(RF_SPI_Read_Byte@i)
	line	47
	
l3501:	
	line	48
;SC8F054_xl2400t.c: 47: {
;SC8F054_xl2400t.c: 48: RB4 = 0;
	bcf	(52/8),(52)&7	;volatile
	line	49
;SC8F054_xl2400t.c: 49: buff = buff << 1;
	clrc
	rlf	(RF_SPI_Read_Byte@buff),f
	line	50
;SC8F054_xl2400t.c: 50: RB4 = 1;
	bsf	(52/8),(52)&7	;volatile
	line	51
;SC8F054_xl2400t.c: 51: if(RB5)
	btfss	(53/8),(53)&7	;volatile
	goto	u1161
	goto	u1160
u1161:
	goto	l5673
u1160:
	line	53
	
l5671:	
;SC8F054_xl2400t.c: 52: {
;SC8F054_xl2400t.c: 53: buff |= 0x01;
	bsf	(RF_SPI_Read_Byte@buff)+(0/8),(0)&7
	line	46
	
l5673:	
	incf	(RF_SPI_Read_Byte@i),f
	
l5675:	
	movlw	low(08h)
	subwf	(RF_SPI_Read_Byte@i),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l3501
u1170:
	
l3502:	
	line	56
;SC8F054_xl2400t.c: 54: }
;SC8F054_xl2400t.c: 55: }
;SC8F054_xl2400t.c: 56: RB4 = 0;
	bcf	(52/8),(52)&7	;volatile
	line	57
	
l5677:	
;SC8F054_xl2400t.c: 57: return buff;
	movf	(RF_SPI_Read_Byte@buff),w
	line	58
	
l3504:	
	return
	opt stack 0
GLOBAL	__end_of_RF_SPI_Read_Byte
	__end_of_RF_SPI_Read_Byte:
	signat	_RF_SPI_Read_Byte,89
	global	_RF_Refresh_State

;; *************** function _RF_Refresh_State *****************
;; Defined at:
;;		line 148 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_SPI_Write_Reg
;; This function is called by:
;;		_RF_Rx_Mode
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=0
	line	148
global __ptext20
__ptext20:	;psect for function _RF_Refresh_State
psect	text20
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	148
	global	__size_of_RF_Refresh_State
	__size_of_RF_Refresh_State	equ	__end_of_RF_Refresh_State-_RF_Refresh_State
	
_RF_Refresh_State:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_Refresh_State: [wreg+status,2+status,0+pclath+cstack]
	line	150
	
l6225:	
;SC8F054_xl2400t.c: 150: RF_SPI_Write_Reg(0x20 + (0X07), 0x70);
	movlw	low(070h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(027h)
	fcall	_RF_SPI_Write_Reg
	line	151
;SC8F054_xl2400t.c: 151: RF_SPI_Write_Reg(0xE1, 0xFF);
	movlw	low(0FFh)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(0E1h)
	fcall	_RF_SPI_Write_Reg
	line	152
;SC8F054_xl2400t.c: 152: RF_SPI_Write_Reg(0xE2, 0xFF);
	movlw	low(0FFh)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(0E2h)
	fcall	_RF_SPI_Write_Reg
	line	153
	
l3531:	
	return
	opt stack 0
GLOBAL	__end_of_RF_Refresh_State
	__end_of_RF_Refresh_State:
	signat	_RF_Refresh_State,89
	global	_RF_CE_Low

;; *************** function _RF_CE_Low *****************
;; Defined at:
;;		line 138 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_SPI_Write_Reg
;; This function is called by:
;;		_Sleep_Mode
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=0
	line	138
global __ptext21
__ptext21:	;psect for function _RF_CE_Low
psect	text21
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	138
	global	__size_of_RF_CE_Low
	__size_of_RF_CE_Low	equ	__end_of_RF_CE_Low-_RF_CE_Low
	
_RF_CE_Low:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_CE_Low: [wreg+status,2+status,0+pclath+cstack]
	line	140
	
l5957:	
;SC8F054_xl2400t.c: 140: RF_SPI_Write_Reg(0x20 + (0X00), 0xEE);
	movlw	low(0EEh)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(020h)
	fcall	_RF_SPI_Write_Reg
	line	141
	
l3528:	
	return
	opt stack 0
GLOBAL	__end_of_RF_CE_Low
	__end_of_RF_CE_Low:
	signat	_RF_CE_Low,89
	global	_RF_CE_High

;; *************** function _RF_CE_High *****************
;; Defined at:
;;		line 130 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_RF_SPI_Write_Reg
;; This function is called by:
;;		_RF_Rx_Mode
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=0
	line	130
global __ptext22
__ptext22:	;psect for function _RF_CE_High
psect	text22
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	130
	global	__size_of_RF_CE_High
	__size_of_RF_CE_High	equ	__end_of_RF_CE_High-_RF_CE_High
	
_RF_CE_High:	
;incstack = 0
	opt	stack 2
; Regs used in _RF_CE_High: [wreg+status,2+status,0+pclath+cstack]
	line	132
	
l6223:	
;SC8F054_xl2400t.c: 132: RF_SPI_Write_Reg(0x20 + (0X00), 0xEF);
	movlw	low(0EFh)
	movwf	(RF_SPI_Write_Reg@W_Data)
	movlw	low(020h)
	fcall	_RF_SPI_Write_Reg
	line	133
	
l3525:	
	return
	opt stack 0
GLOBAL	__end_of_RF_CE_High
	__end_of_RF_CE_High:
	signat	_RF_CE_High,89
	global	_RF_SPI_Write_Reg

;; *************** function _RF_SPI_Write_Reg *****************
;; Defined at:
;;		line 65 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  RF_Reg          1    wreg     unsigned char 
;;  W_Data          1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  RF_Reg          1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       1       0
;;      Locals:         0       1       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_RF_SPI_Write_Byte
;; This function is called by:
;;		_Sleep_Mode
;;		_RF_CE_High
;;		_RF_CE_Low
;;		_RF_Refresh_State
;;		_RF_Set_Chn
;;		_XL2400T_Init
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	line	65
global __ptext23
__ptext23:	;psect for function _RF_SPI_Write_Reg
psect	text23
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	65
	global	__size_of_RF_SPI_Write_Reg
	__size_of_RF_SPI_Write_Reg	equ	__end_of_RF_SPI_Write_Reg-_RF_SPI_Write_Reg
	
_RF_SPI_Write_Reg:	
;incstack = 0
	opt	stack 3
; Regs used in _RF_SPI_Write_Reg: [wreg+status,2+status,0+pclath+cstack]
;RF_SPI_Write_Reg@RF_Reg stored from wreg
	movwf	(RF_SPI_Write_Reg@RF_Reg)
	line	67
	
l5681:	
;SC8F054_xl2400t.c: 67: RB0 = 0;
	bcf	(48/8),(48)&7	;volatile
	line	68
	
l5683:	
;SC8F054_xl2400t.c: 68: RF_SPI_Write_Byte(RF_Reg);
	movf	(RF_SPI_Write_Reg@RF_Reg),w
	fcall	_RF_SPI_Write_Byte
	line	69
;SC8F054_xl2400t.c: 69: RF_SPI_Write_Byte(W_Data);
	movf	(RF_SPI_Write_Reg@W_Data),w
	fcall	_RF_SPI_Write_Byte
	line	70
	
l5685:	
;SC8F054_xl2400t.c: 70: RB0 = 1;
	bsf	(48/8),(48)&7	;volatile
	line	71
	
l3507:	
	return
	opt stack 0
GLOBAL	__end_of_RF_SPI_Write_Reg
	__end_of_RF_SPI_Write_Reg:
	signat	_RF_SPI_Write_Reg,8313
	global	_RF_SPI_Write_Byte

;; *************** function _RF_SPI_Write_Byte *****************
;; Defined at:
;;		line 11 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
;; Parameters:    Size  Location     Type
;;  buff            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  buff            1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_SPI_Write_Reg
;;		_RF_SPI_Read_Reg
;;		_RF_Write_Buff
;;		_RF_Read_Buff
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	line	11
global __ptext24
__ptext24:	;psect for function _RF_SPI_Write_Byte
psect	text24
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_xl2400t.c"
	line	11
	global	__size_of_RF_SPI_Write_Byte
	__size_of_RF_SPI_Write_Byte	equ	__end_of_RF_SPI_Write_Byte-_RF_SPI_Write_Byte
	
_RF_SPI_Write_Byte:	
;incstack = 0
	opt	stack 3
; Regs used in _RF_SPI_Write_Byte: [wreg+status,2+status,0]
;RF_SPI_Write_Byte@buff stored from wreg
	movwf	(RF_SPI_Write_Byte@buff)
	line	13
	
l5647:	
;SC8F054_xl2400t.c: 13: unsigned char i = 0;
	clrf	(RF_SPI_Write_Byte@i)
	line	14
;SC8F054_xl2400t.c: 14: TRISB = 0B00000000;
	clrf	(5)	;volatile
	line	15
;SC8F054_xl2400t.c: 15: for(i = 0; i < 8; i++)
	clrf	(RF_SPI_Write_Byte@i)
	line	16
	
l3494:	
	line	17
;SC8F054_xl2400t.c: 16: {
;SC8F054_xl2400t.c: 17: RB4 = 0;
	bcf	(52/8),(52)&7	;volatile
	line	19
;SC8F054_xl2400t.c: 19: if(buff & 0x80)
	btfss	(RF_SPI_Write_Byte@buff),(7)&7
	goto	u1141
	goto	u1140
u1141:
	goto	l3496
u1140:
	line	21
	
l5653:	
;SC8F054_xl2400t.c: 20: {
;SC8F054_xl2400t.c: 21: RB5 = 1;
	bsf	(53/8),(53)&7	;volatile
	line	22
;SC8F054_xl2400t.c: 22: }
	goto	l3497
	line	23
	
l3496:	
	line	25
;SC8F054_xl2400t.c: 23: else
;SC8F054_xl2400t.c: 24: {
;SC8F054_xl2400t.c: 25: RB5 = 0;
	bcf	(53/8),(53)&7	;volatile
	line	26
	
l3497:	
	line	28
;SC8F054_xl2400t.c: 26: }
;SC8F054_xl2400t.c: 28: buff = buff << 1;
	clrc
	rlf	(RF_SPI_Write_Byte@buff),f
	line	29
;SC8F054_xl2400t.c: 29: RB4 = 1;
	bsf	(52/8),(52)&7	;volatile
	line	15
	
l5655:	
	incf	(RF_SPI_Write_Byte@i),f
	
l5657:	
	movlw	low(08h)
	subwf	(RF_SPI_Write_Byte@i),w
	skipc
	goto	u1151
	goto	u1150
u1151:
	goto	l3494
u1150:
	
l3495:	
	line	32
;SC8F054_xl2400t.c: 30: }
;SC8F054_xl2400t.c: 32: RB5 = 1;
	bsf	(53/8),(53)&7	;volatile
	line	33
;SC8F054_xl2400t.c: 33: RB4 = 0;
	bcf	(52/8),(52)&7	;volatile
	line	34
	
l3498:	
	return
	opt stack 0
GLOBAL	__end_of_RF_SPI_Write_Byte
	__end_of_RF_SPI_Write_Byte:
	signat	_RF_SPI_Write_Byte,4217
	global	_Key_Scan

;; *************** function _Key_Scan *****************
;; Defined at:
;;		line 9 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
	line	9
global __ptext25
__ptext25:	;psect for function _Key_Scan
psect	text25
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
	line	9
	global	__size_of_Key_Scan
	__size_of_Key_Scan	equ	__end_of_Key_Scan-_Key_Scan
	
_Key_Scan:	
;incstack = 0
	opt	stack 4
; Regs used in _Key_Scan: [wreg+status,2]
	line	11
	
l5885:	
;SC8F054_key.c: 11: if (RB0)
	btfss	(48/8),(48)&7	;volatile
	goto	u1361
	goto	u1360
u1361:
	goto	l1170
u1360:
	line	13
	
l5887:	
;SC8F054_key.c: 12: {
;SC8F054_key.c: 13: if(!key_control.key_down_pb)
	btfsc	(_key_control),1
	goto	u1371
	goto	u1370
u1371:
	goto	l5899
u1370:
	line	15
	
l5889:	
;SC8F054_key.c: 14: {
;SC8F054_key.c: 15: key_control.key_rec_flag_pb = 1;
	bsf	(_key_control),6
	line	16
;SC8F054_key.c: 16: key_control.key_up_pb = 0;
	bcf	(_key_control),3
	line	17
;SC8F054_key.c: 17: key_control.key_down_pb = 1;
	bsf	(_key_control),1
	line	18
	
l5891:	
;SC8F054_key.c: 18: key_control.key_down_time_pb = 0;
	clrf	0+(_key_control)+02h
	clrf	1+(_key_control)+02h
	line	19
;SC8F054_key.c: 19: key_control.key_up_time_pb = 0;
	clrf	0+(_key_control)+01h
	line	20
	
l5893:	
;SC8F054_key.c: 20: key_control.key_flag_pb = 0;
	bcf	(_key_control),2
	line	21
	
l5895:	
;SC8F054_key.c: 21: key_control.key_long_flag_pb = 0;
	bcf	(_key_control),4
	line	22
	
l5897:	
;SC8F054_key.c: 22: key_control.key_pb = 0;
	bcf	(_key_control),0
	line	23
;SC8F054_key.c: 23: }
	goto	l1180
	line	26
	
l5899:	
;SC8F054_key.c: 24: else
;SC8F054_key.c: 25: {
;SC8F054_key.c: 26: if((key_control.key_down_time_pb > 70) && !key_control.key_flag_pb)
	movlw	0
	subwf	1+(_key_control)+02h,w
	movlw	047h
	skipnz
	subwf	0+(_key_control)+02h,w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l5905
u1380:
	
l5901:	
	btfsc	(_key_control),2
	goto	u1391
	goto	u1390
u1391:
	goto	l5905
u1390:
	line	28
	
l5903:	
;SC8F054_key.c: 27: {
;SC8F054_key.c: 28: key_control.key_flag_pb = 1;
	bsf	(_key_control),2
	line	30
	
l5905:	
;SC8F054_key.c: 29: }
;SC8F054_key.c: 30: if((key_control.key_down_time_pb > 1000) && !key_control.key_long_flag_pb)
	movlw	03h
	subwf	1+(_key_control)+02h,w
	movlw	0E9h
	skipnz
	subwf	0+(_key_control)+02h,w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l1180
u1400:
	
l5907:	
	btfsc	(_key_control),4
	goto	u1411
	goto	u1410
u1411:
	goto	l1180
u1410:
	line	32
	
l5909:	
;SC8F054_key.c: 31: {
;SC8F054_key.c: 32: key_control.key_long_flag_pb = 1;
	bsf	(_key_control),4
	line	33
;SC8F054_key.c: 33: key_control.key_pb = 1;
	bsf	(_key_control),0
	goto	l1180
	line	37
	
l1170:	
	line	40
;SC8F054_key.c: 37: else
;SC8F054_key.c: 38: {
;SC8F054_key.c: 40: if(!key_control.key_up_pb)
	btfsc	(_key_control),3
	goto	u1421
	goto	u1420
u1421:
	goto	l5915
u1420:
	line	42
	
l5911:	
;SC8F054_key.c: 41: {
;SC8F054_key.c: 42: key_control.key_up_pb = 1;
	bsf	(_key_control),3
	line	43
	
l5913:	
;SC8F054_key.c: 43: key_control.key_up_time_pb = 0;
	clrf	0+(_key_control)+01h
	line	44
;SC8F054_key.c: 44: }
	goto	l1180
	line	47
	
l5915:	
;SC8F054_key.c: 45: else
;SC8F054_key.c: 46: {
;SC8F054_key.c: 47: if(key_control.key_up_time_pb > 50)
	movlw	low(033h)
	subwf	0+(_key_control)+01h,w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l1180
u1430:
	line	49
	
l5917:	
;SC8F054_key.c: 48: {
;SC8F054_key.c: 49: key_control.key_down_pb = 0;
	bcf	(_key_control),1
	line	50
;SC8F054_key.c: 50: if(key_control.key_flag_pb && (key_control.key_long_flag_pb == 0))
	btfss	(_key_control),2
	goto	u1441
	goto	u1440
u1441:
	goto	l1180
u1440:
	
l5919:	
	btfsc	(_key_control),4
	goto	u1451
	goto	u1450
u1451:
	goto	l1180
u1450:
	line	52
	
l5921:	
;SC8F054_key.c: 51: {
;SC8F054_key.c: 52: key_control.key_rec_flag_pb = 0;
	bcf	(_key_control),6
	line	53
;SC8F054_key.c: 53: key_control.key_flag_pb = 0;
	bcf	(_key_control),2
	line	54
;SC8F054_key.c: 54: key_control.key_pb = 1;
	bsf	(_key_control),0
	line	59
	
l1180:	
	return
	opt stack 0
GLOBAL	__end_of_Key_Scan
	__end_of_Key_Scan:
	signat	_Key_Scan,89
	global	_Key_Event

;; *************** function _Key_Event *****************
;; Defined at:
;;		line 65 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text26,local,class=CODE,delta=2,merge=1,group=0
	line	65
global __ptext26
__ptext26:	;psect for function _Key_Event
psect	text26
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
	line	65
	global	__size_of_Key_Event
	__size_of_Key_Event	equ	__end_of_Key_Event-_Key_Event
	
_Key_Event:	
;incstack = 0
	opt	stack 4
; Regs used in _Key_Event: [wreg+status,2+status,0]
	line	67
	
l5923:	
;SC8F054_key.c: 67: if(key_control.key_pb && key_control.key_long_flag_pb)
	btfss	(_key_control),0
	goto	u1461
	goto	u1460
u1461:
	goto	l1183
u1460:
	
l5925:	
	btfss	(_key_control),4
	goto	u1471
	goto	u1470
u1471:
	goto	l1183
u1470:
	line	69
	
l5927:	
;SC8F054_key.c: 68: {
;SC8F054_key.c: 69: key_control.key_pb = 0;
	bcf	(_key_control),0
	line	70
;SC8F054_key.c: 70: if(!soft_recieve_control.recieve_bit)
	btfsc	(_soft_recieve_control),1
	goto	u1481
	goto	u1480
u1481:
	goto	l1191
u1480:
	line	72
	
l5929:	
;SC8F054_key.c: 71: {
;SC8F054_key.c: 72: led_control.led_color = 0;
	clrf	0+(_led_control)+07h
	line	73
;SC8F054_key.c: 73: led_control.led_mode = 0;
	clrf	0+(_led_control)+08h
	line	74
	
l5931:	
;SC8F054_key.c: 74: sleep_control.sleep_count = 3;
	movlw	03h
	movwf	0+(_sleep_control)+01h
	clrf	1+(_sleep_control)+01h
	line	75
	
l5933:	
;SC8F054_key.c: 75: sleep_control.sleep_flag = 1;
	bsf	(_sleep_control),0
	line	76
	
l5935:	
;SC8F054_key.c: 76: sleep_control.recieve_sleep_flag = 0;
	bcf	(_sleep_control),1
	goto	l1191
	line	77
	
l1184:	
	line	78
;SC8F054_key.c: 77: }
;SC8F054_key.c: 78: }
	goto	l1191
	line	79
	
l1183:	
;SC8F054_key.c: 79: else if(key_control.key_pb == 1)
	btfss	(_key_control),0
	goto	u1491
	goto	u1490
u1491:
	goto	l1191
u1490:
	line	81
	
l5937:	
;SC8F054_key.c: 80: {
;SC8F054_key.c: 81: key_control.key_pb = 0;
	bcf	(_key_control),0
	line	82
;SC8F054_key.c: 82: if(!soft_recieve_control.recieve_bit)
	btfsc	(_soft_recieve_control),1
	goto	u1501
	goto	u1500
u1501:
	goto	l1191
u1500:
	line	84
	
l5939:	
;SC8F054_key.c: 83: {
;SC8F054_key.c: 84: sleep_control.sleep_count = 20;
	movlw	014h
	movwf	0+(_sleep_control)+01h
	clrf	1+(_sleep_control)+01h
	line	85
	
l5941:	
;SC8F054_key.c: 85: sleep_control.recieve_sleep_flag = 1;
	bsf	(_sleep_control),1
	line	86
	
l5943:	
;SC8F054_key.c: 86: soft_recieve_control.randnum_flag = 0;
	bcf	(_soft_recieve_control),5
	line	88
	
l5945:	
;SC8F054_key.c: 88: if(led_control.led_mode == 16)
		movlw	16
	xorwf	(0+(_led_control)+08h),w
	btfss	status,2
	goto	u1511
	goto	u1510
u1511:
	goto	l5951
u1510:
	line	90
	
l5947:	
;SC8F054_key.c: 89: {
;SC8F054_key.c: 90: led_control.led_color = 0;
	clrf	0+(_led_control)+07h
	line	91
	
l5949:	
;SC8F054_key.c: 91: led_control.led_mode = 2;
	movlw	low(02h)
	movwf	0+(_led_control)+08h
	line	92
;SC8F054_key.c: 92: }
	goto	l1191
	line	95
	
l5951:	
;SC8F054_key.c: 93: else
;SC8F054_key.c: 94: {
;SC8F054_key.c: 95: led_control.led_color++;
	incf	0+(_led_control)+07h,f
	line	96
	
l5953:	
;SC8F054_key.c: 96: if(led_control.led_color >= 16)
	movlw	low(010h)
	subwf	0+(_led_control)+07h,w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l1184
u1520:
	line	98
	
l5955:	
;SC8F054_key.c: 97: {
;SC8F054_key.c: 98: led_control.led_mode = 16;
	movlw	low(010h)
	movwf	0+(_led_control)+08h
	line	105
	
l1191:	
	return
	opt stack 0
GLOBAL	__end_of_Key_Event
	__end_of_Key_Event:
	signat	_Key_Event,89
	global	_Delay_3us

;; *************** function _Delay_3us *****************
;; Defined at:
;;		line 154 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1    1[BANK0 ] unsigned char 
;;  i               1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       2       0
;;      Temps:          0       0       0
;;      Totals:         0       2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_RF_RX_Data
;; This function uses a non-reentrant model
;;
psect	text27,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	154
global __ptext27
__ptext27:	;psect for function _Delay_3us
psect	text27
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
	line	154
	global	__size_of_Delay_3us
	__size_of_Delay_3us	equ	__end_of_Delay_3us-_Delay_3us
	
_Delay_3us:	
;incstack = 0
	opt	stack 4
; Regs used in _Delay_3us: [wreg+status,2+status,0]
	line	157
	
l5959:	
;SC8F054_init.c: 156: unsigned char i,j;
;SC8F054_init.c: 157: for(i=1;i>0;i--)
	clrf	(Delay_3us@i)
	incf	(Delay_3us@i),f
	line	158
	
l1767:	
	line	159
# 159 "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_init.c"
nop ;# 
psect	text27
	line	160
	
l5965:	
;SC8F054_init.c: 160: for(j=5;j>0;j--);
	movlw	low(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Delay_3us@j)
	
l5971:	
	decf	(Delay_3us@j),f
	
l5973:	
	movf	((Delay_3us@j)),w
	btfss	status,2
	goto	u1531
	goto	u1530
u1531:
	goto	l5971
u1530:
	line	157
	
l5975:	
	decf	(Delay_3us@i),f
	
l5977:	
	movf	((Delay_3us@i)),w
	btfss	status,2
	goto	u1541
	goto	u1540
u1541:
	goto	l1767
u1540:
	line	162
	
l1771:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_3us
	__end_of_Delay_3us:
	signat	_Delay_3us,89
	global	_Led_Color_Prg

;; *************** function _Led_Color_Prg *****************
;; Defined at:
;;		line 42 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_map_0_255_to_1000_0
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text28,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_led.c"
	line	42
global __ptext28
__ptext28:	;psect for function _Led_Color_Prg
psect	text28
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_led.c"
	line	42
	global	__size_of_Led_Color_Prg
	__size_of_Led_Color_Prg	equ	__end_of_Led_Color_Prg-_Led_Color_Prg
	
_Led_Color_Prg:	
;incstack = 0
	opt	stack 3
; Regs used in _Led_Color_Prg: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	45
	
l6353:	
;SC8F054_led.c: 45: if((led_control.color_p != led_control.led_color) && (led_control.led_mode != 1))
	movf	0+(_led_control)+0Dh,w
	xorwf	0+(_led_control)+07h,w
	skipnz
	goto	u2011
	goto	u2010
u2011:
	goto	l6435
u2010:
	
l6355:	
		decf	(0+(_led_control)+08h),w
	btfsc	status,2
	goto	u2021
	goto	u2020
u2021:
	goto	l6435
u2020:
	line	47
	
l6357:	
;SC8F054_led.c: 46: {
;SC8F054_led.c: 47: led_control.color_p = led_control.led_color;
	movf	0+(_led_control)+07h,w
	movwf	0+(_led_control)+0Dh
	line	48
;SC8F054_led.c: 48: switch(led_control.led_color)
	goto	l6431
	line	51
	
l6359:	
;SC8F054_led.c: 51: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	52
;SC8F054_led.c: 52: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	53
;SC8F054_led.c: 53: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	line	54
;SC8F054_led.c: 54: PWMCON0 = 0X00;
	clrf	(21)	;volatile
	line	55
;SC8F054_led.c: 55: break;
	goto	l6433
	line	57
	
l6361:	
;SC8F054_led.c: 57: led_control.red_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+01h
	line	58
	
l6363:	
;SC8F054_led.c: 58: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	59
	
l6365:	
;SC8F054_led.c: 59: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	line	60
;SC8F054_led.c: 60: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	61
;SC8F054_led.c: 61: break;
	goto	l6433
	line	63
	
l6367:	
;SC8F054_led.c: 63: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	64
	
l6369:	
;SC8F054_led.c: 64: led_control.green_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+02h
	goto	l6365
	line	69
	
l6373:	
;SC8F054_led.c: 69: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	70
;SC8F054_led.c: 70: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	71
	
l6375:	
;SC8F054_led.c: 71: led_control.blue_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+03h
	line	72
	
l6377:	
;SC8F054_led.c: 72: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	73
;SC8F054_led.c: 73: break;
	goto	l6433
	line	75
	
l6379:	
;SC8F054_led.c: 75: led_control.red_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+01h
	line	76
	
l6381:	
;SC8F054_led.c: 76: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	77
	
l6383:	
;SC8F054_led.c: 77: led_control.blue_duty = 60;
	movlw	low(03Ch)
	movwf	0+(_led_control)+03h
	goto	l6377
	line	81
	
l6387:	
;SC8F054_led.c: 81: led_control.red_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+01h
	line	82
;SC8F054_led.c: 82: led_control.green_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+02h
	line	83
;SC8F054_led.c: 83: led_control.blue_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+03h
	line	84
;SC8F054_led.c: 84: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	85
;SC8F054_led.c: 85: break;
	goto	l6433
	line	87
	
l6389:	
;SC8F054_led.c: 87: led_control.red_duty = 160;
	movlw	low(0A0h)
	movwf	0+(_led_control)+01h
	line	88
;SC8F054_led.c: 88: led_control.green_duty = 50;
	movlw	low(032h)
	movwf	0+(_led_control)+02h
	line	89
	
l6391:	
;SC8F054_led.c: 89: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	goto	l6377
	line	93
	
l6395:	
;SC8F054_led.c: 93: led_control.red_duty = 74;
	movlw	low(04Ah)
	movwf	0+(_led_control)+01h
	line	94
;SC8F054_led.c: 94: led_control.green_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+02h
	line	95
;SC8F054_led.c: 95: led_control.blue_duty = 63;
	movlw	low(03Fh)
	movwf	0+(_led_control)+03h
	line	96
;SC8F054_led.c: 96: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	97
;SC8F054_led.c: 97: break;
	goto	l6433
	line	99
	
l6397:	
;SC8F054_led.c: 99: led_control.red_duty = 50;
	movlw	low(032h)
	movwf	0+(_led_control)+01h
	line	100
;SC8F054_led.c: 100: led_control.green_duty = 100;
	movlw	low(064h)
	movwf	0+(_led_control)+02h
	line	101
;SC8F054_led.c: 101: led_control.blue_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+03h
	line	102
;SC8F054_led.c: 102: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	103
;SC8F054_led.c: 103: break;
	goto	l6433
	line	105
	
l6399:	
;SC8F054_led.c: 105: led_control.red_duty = 205;
	movlw	low(0CDh)
	movwf	0+(_led_control)+01h
	line	106
;SC8F054_led.c: 106: led_control.green_duty = 43;
	movlw	low(02Bh)
	movwf	0+(_led_control)+02h
	line	107
;SC8F054_led.c: 107: led_control.blue_duty = 63;
	movlw	low(03Fh)
	movwf	0+(_led_control)+03h
	line	108
;SC8F054_led.c: 108: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	109
;SC8F054_led.c: 109: break;
	goto	l6433
	line	111
	
l6401:	
;SC8F054_led.c: 111: led_control.red_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+01h
	line	112
;SC8F054_led.c: 112: led_control.green_duty = 160;
	movlw	low(0A0h)
	movwf	0+(_led_control)+02h
	line	113
	
l6403:	
;SC8F054_led.c: 113: led_control.blue_duty = 1;
	clrf	0+(_led_control)+03h
	incf	0+(_led_control)+03h,f
	line	114
;SC8F054_led.c: 114: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	115
;SC8F054_led.c: 115: break;
	goto	l6433
	line	117
	
l6405:	
;SC8F054_led.c: 117: led_control.red_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+01h
	line	118
;SC8F054_led.c: 118: led_control.green_duty = 20;
	movlw	low(014h)
	movwf	0+(_led_control)+02h
	line	119
;SC8F054_led.c: 119: led_control.blue_duty = 200;
	movlw	low(0C8h)
	movwf	0+(_led_control)+03h
	line	120
;SC8F054_led.c: 120: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	121
;SC8F054_led.c: 121: break;
	goto	l6433
	line	123
	
l6407:	
;SC8F054_led.c: 123: led_control.red_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+01h
	line	124
;SC8F054_led.c: 124: led_control.green_duty = 20;
	movlw	low(014h)
	movwf	0+(_led_control)+02h
	goto	l6391
	line	129
	
l6413:	
;SC8F054_led.c: 129: led_control.red_duty = 10;
	movlw	low(0Ah)
	movwf	0+(_led_control)+01h
	line	130
;SC8F054_led.c: 130: led_control.green_duty = 180;
	movlw	low(0B4h)
	movwf	0+(_led_control)+02h
	line	131
;SC8F054_led.c: 131: led_control.blue_duty = 50;
	movlw	low(032h)
	movwf	0+(_led_control)+03h
	line	132
;SC8F054_led.c: 132: PWMCON0 = 0X16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	133
;SC8F054_led.c: 133: break;
	goto	l6433
	line	135
	
l6415:	
;SC8F054_led.c: 135: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	136
	
l6417:	
;SC8F054_led.c: 136: led_control.green_duty = 191;
	movlw	low(0BFh)
	movwf	0+(_led_control)+02h
	goto	l6375
	line	141
	
l6423:	
;SC8F054_led.c: 141: led_control.red_duty = 100;
	movlw	low(064h)
	movwf	0+(_led_control)+01h
	line	142
;SC8F054_led.c: 142: led_control.green_duty = 255;
	movlw	low(0FFh)
	movwf	0+(_led_control)+02h
	goto	l6391
	line	48
	
l6431:	
	movf	0+(_led_control)+07h,w
	; Switch size 1, requested type "speed"
; Number of cases is 16, Range of values is 0 to 15
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           22     6 (fixed)
; simple_byte           49    25 (average)
; jumptable            260     6 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	16
	subwf	fsr,w
skipnc
goto l6433
movlw high(S6815)
movwf pclath
	movlw low(S6815)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6815:
	ljmp	l6359
	ljmp	l6361
	ljmp	l6367
	ljmp	l6373
	ljmp	l6379
	ljmp	l6387
	ljmp	l6389
	ljmp	l6395
	ljmp	l6397
	ljmp	l6399
	ljmp	l6401
	ljmp	l6405
	ljmp	l6407
	ljmp	l6413
	ljmp	l6415
	ljmp	l6423
psect	text28

	line	151
	
l6433:	
;SC8F054_led.c: 151: led_control.set_red_duty = led_control.red_duty;
	movf	0+(_led_control)+01h,w
	movwf	0+(_led_control)+04h
	line	152
;SC8F054_led.c: 152: led_control.set_green_duty = led_control.green_duty;
	movf	0+(_led_control)+02h,w
	movwf	0+(_led_control)+05h
	line	153
;SC8F054_led.c: 153: led_control.set_blue_duty = led_control.blue_duty;
	movf	0+(_led_control)+03h,w
	movwf	0+(_led_control)+06h
	line	156
	
l6435:	
;SC8F054_led.c: 154: }
;SC8F054_led.c: 156: map_0_255_to_1000_0(led_control.red_duty, led_control.green_duty, led_control.blue_duty);
	movf	0+(_led_control)+02h,w
	movwf	(map_0_255_to_1000_0@green_duty)
	movf	0+(_led_control)+03h,w
	movwf	(map_0_255_to_1000_0@blue_duty)
	movf	0+(_led_control)+01h,w
	fcall	_map_0_255_to_1000_0
	line	158
	
l2347:	
	return
	opt stack 0
GLOBAL	__end_of_Led_Color_Prg
	__end_of_Led_Color_Prg:
	signat	_Led_Color_Prg,89
	global	_map_0_255_to_1000_0

;; *************** function _map_0_255_to_1000_0 *****************
;; Defined at:
;;		line 10 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_led.c"
;; Parameters:    Size  Location     Type
;;  red_duty        1    wreg     unsigned char 
;;  green_duty      1   25[BANK0 ] unsigned char 
;;  blue_duty       1   26[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  red_duty        1   27[BANK0 ] unsigned char 
;;  duty_10bit      2   28[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       2       0
;;      Locals:         0       3       0
;;      Temps:          0       0       0
;;      Totals:         0       5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lldiv
;;		___lmul
;; This function is called by:
;;		_Led_Color_Prg
;; This function uses a non-reentrant model
;;
psect	text29,local,class=CODE,delta=2,merge=1,group=0
	line	10
global __ptext29
__ptext29:	;psect for function _map_0_255_to_1000_0
psect	text29
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_led.c"
	line	10
	global	__size_of_map_0_255_to_1000_0
	__size_of_map_0_255_to_1000_0	equ	__end_of_map_0_255_to_1000_0-_map_0_255_to_1000_0
	
_map_0_255_to_1000_0:	
;incstack = 0
	opt	stack 3
; Regs used in _map_0_255_to_1000_0: [wreg+status,2+status,0+pclath+cstack]
;map_0_255_to_1000_0@red_duty stored from wreg
	movwf	(map_0_255_to_1000_0@red_duty)
	line	12
	
l5989:	
	line	14
	
l5991:	
;SC8F054_led.c: 14: duty_10bit = (unsigned int)((unsigned long)red_duty * 1023 / 255);
	movlw	0FFh
	movwf	(___lldiv@divisor)
	clrf	(___lldiv@divisor+1)
	clrf	(___lldiv@divisor+2)
	clrf	(___lldiv@divisor+3)

	movf	(map_0_255_to_1000_0@red_duty),w
	movwf	(___lmul@multiplier)
	clrf	(___lmul@multiplier+1)
	clrf	(___lmul@multiplier+2)
	clrf	(___lmul@multiplier+3)

	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	03h
	movwf	(___lmul@multiplicand+1)
	movlw	0FFh
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(1+(?___lldiv)),w
	movwf	(map_0_255_to_1000_0@duty_10bit+1)
	movf	(0+(?___lldiv)),w
	movwf	(map_0_255_to_1000_0@duty_10bit)
	line	15
	
l5993:	
;SC8F054_led.c: 15: PWMD23H = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	16
	
l5995:	
;SC8F054_led.c: 16: PWMD23H |= ((duty_10bit >> 8) & 0x03);
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(map_0_255_to_1000_0@duty_10bit)+01h,w
	andlw	03h
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(158)^080h,f	;volatile
	line	17
	
l5997:	
;SC8F054_led.c: 17: PWMD2L = red_duty;
	bcf	status, 5	;RP0=0, select bank0
	movf	(map_0_255_to_1000_0@red_duty),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	20
	
l5999:	
;SC8F054_led.c: 20: duty_10bit = (unsigned int)((unsigned long)green_duty * 1023 / 255);
	movlw	0FFh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(___lldiv@divisor)
	clrf	(___lldiv@divisor+1)
	clrf	(___lldiv@divisor+2)
	clrf	(___lldiv@divisor+3)

	movf	(map_0_255_to_1000_0@green_duty),w
	movwf	(___lmul@multiplier)
	clrf	(___lmul@multiplier+1)
	clrf	(___lmul@multiplier+2)
	clrf	(___lmul@multiplier+3)

	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	03h
	movwf	(___lmul@multiplicand+1)
	movlw	0FFh
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(1+(?___lldiv)),w
	movwf	(map_0_255_to_1000_0@duty_10bit+1)
	movf	(0+(?___lldiv)),w
	movwf	(map_0_255_to_1000_0@duty_10bit)
	line	21
	
l6001:	
;SC8F054_led.c: 21: PWMD01H = 0x00;
	clrf	(30)	;volatile
	line	22
	
l6003:	
;SC8F054_led.c: 22: PWMD01H |= ((duty_10bit >> 8) & 0x03) << 4;
	swapf	0+(map_0_255_to_1000_0@duty_10bit)+01h,w
	andlw	03h shl 4
	iorwf	(30),f	;volatile
	line	23
	
l6005:	
;SC8F054_led.c: 23: PWMD1L = green_duty;
	movf	(map_0_255_to_1000_0@green_duty),w
	movwf	(26)	;volatile
	line	25
	
l6007:	
;SC8F054_led.c: 25: duty_10bit = (unsigned int)((unsigned long)blue_duty * 1023 / 255);
	movlw	0FFh
	movwf	(___lldiv@divisor)
	clrf	(___lldiv@divisor+1)
	clrf	(___lldiv@divisor+2)
	clrf	(___lldiv@divisor+3)

	movf	(map_0_255_to_1000_0@blue_duty),w
	movwf	(___lmul@multiplier)
	clrf	(___lmul@multiplier+1)
	clrf	(___lmul@multiplier+2)
	clrf	(___lmul@multiplier+3)

	movlw	0
	movwf	(___lmul@multiplicand+3)
	movlw	0
	movwf	(___lmul@multiplicand+2)
	movlw	03h
	movwf	(___lmul@multiplicand+1)
	movlw	0FFh
	movwf	(___lmul@multiplicand)

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(___lldiv@dividend+3)
	movf	(2+(?___lmul)),w
	movwf	(___lldiv@dividend+2)
	movf	(1+(?___lmul)),w
	movwf	(___lldiv@dividend+1)
	movf	(0+(?___lmul)),w
	movwf	(___lldiv@dividend)

	fcall	___lldiv
	movf	(1+(?___lldiv)),w
	movwf	(map_0_255_to_1000_0@duty_10bit+1)
	movf	(0+(?___lldiv)),w
	movwf	(map_0_255_to_1000_0@duty_10bit)
	line	26
	
l6009:	
;SC8F054_led.c: 26: PWMTH = 0x0F;
	movlw	low(0Fh)
	movwf	(24)	;volatile
	line	27
	
l6011:	
;SC8F054_led.c: 27: PWMTH |= ((duty_10bit >> 8) & 0x03) << 4;
	swapf	0+(map_0_255_to_1000_0@duty_10bit)+01h,w
	andlw	03h shl 4
	iorwf	(24),f	;volatile
	line	28
	
l6013:	
;SC8F054_led.c: 28: PWMD4L = blue_duty;
	movf	(map_0_255_to_1000_0@blue_duty),w
	movwf	(27)	;volatile
	line	29
	
l2324:	
	return
	opt stack 0
GLOBAL	__end_of_map_0_255_to_1000_0
	__end_of_map_0_255_to_1000_0:
	signat	_map_0_255_to_1000_0,12409
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       8       0
;;      Locals:         0       4       0
;;      Temps:          0       0       0
;;      Totals:         0      12       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_map_0_255_to_1000_0
;;		_rand
;; This function uses a non-reentrant model
;;
psect	text30,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\Umul32.c"
	line	15
global __ptext30
__ptext30:	;psect for function ___lmul
psect	text30
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\Umul32.c"
	line	15
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
;incstack = 0
	opt	stack 3
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l5751:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	120
	
l4169:	
	line	121
	btfss	(___lmul@multiplier),(0)&7
	goto	u1221
	goto	u1220
u1221:
	goto	l5755
u1220:
	line	122
	
l5753:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1231
	addwf	(___lmul@product+1),f
u1231:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1232
	addwf	(___lmul@product+2),f
u1232:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1233
	addwf	(___lmul@product+3),f
u1233:

	line	123
	
l5755:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	124
	
l5757:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	125
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l4169
u1240:
	line	128
	
l5759:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	129
	
l4172:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___lldiv

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 6 in file "D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4   12[BANK0 ] unsigned long 
;;  dividend        4   16[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   20[BANK0 ] unsigned long 
;;  counter         1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   12[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       8       0
;;      Locals:         0       5       0
;;      Temps:          0       0       0
;;      Totals:         0      13       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_map_0_255_to_1000_0
;; This function uses a non-reentrant model
;;
psect	text31,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\lldiv.c"
	line	6
global __ptext31
__ptext31:	;psect for function ___lldiv
psect	text31
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\lldiv.c"
	line	6
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
;incstack = 0
	opt	stack 3
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	14
	
l5799:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	15
	
l5801:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u1321
	goto	u1320
u1321:
	goto	l5821
u1320:
	line	16
	
l5803:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	17
	goto	l5807
	line	18
	
l5805:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	19
	incf	(___lldiv@counter),f
	line	17
	
l5807:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u1331
	goto	u1330
u1331:
	goto	l5805
u1330:
	line	22
	
l5809:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	23
	
l5811:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u1345
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u1345
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u1345
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u1345:
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l5817
u1340:
	line	24
	
l5813:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	25
	
l5815:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	27
	
l5817:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	28
	
l5819:	
	decfsz	(___lldiv@counter),f
	goto	u1351
	goto	u1350
u1351:
	goto	l5809
u1350:
	line	30
	
l5821:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	31
	
l4449:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
	signat	___lldiv,8316
	global	_INT_Isr

;; *************** function _INT_Isr *****************
;; Defined at:
;;		line 46 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          3       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Key_Check_Time
;;		___lbdiv
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text32,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
	line	46
global __ptext32
__ptext32:	;psect for function _INT_Isr
psect	text32
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_main.c"
	line	46
	global	__size_of_INT_Isr
	__size_of_INT_Isr	equ	__end_of_INT_Isr-_INT_Isr
	
_INT_Isr:	
;incstack = 0
	opt	stack 2
; Regs used in _INT_Isr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_INT_Isr+0)
	movf	fsr0,w
	movwf	(??_INT_Isr+1)
	movf	pclath,w
	movwf	(??_INT_Isr+2)
	ljmp	_INT_Isr
psect	text32
	line	48
	
i1l6583:	
;SC8F054_main.c: 48: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(105/8),(105)&7	;volatile
	goto	u223_21
	goto	u223_20
u223_21:
	goto	i1l627
u223_20:
	line	50
	
i1l6585:	
;SC8F054_main.c: 49: {
;SC8F054_main.c: 50: TMR2IF = 0;
	bcf	(105/8),(105)&7	;volatile
	line	52
	
i1l6587:	
;SC8F054_main.c: 52: led_control.count_1ms++;
	incf	0+(_led_control)+0Eh,f
	line	54
	
i1l6589:	
;SC8F054_main.c: 54: if(led_control.count_1ms >= 20)
	movlw	low(014h)
	subwf	0+(_led_control)+0Eh,w
	skipc
	goto	u224_21
	goto	u224_20
u224_21:
	goto	i1l627
u224_20:
	line	56
	
i1l6591:	
;SC8F054_main.c: 55: {
;SC8F054_main.c: 56: Key_Check_Time();
	fcall	_Key_Check_Time
	line	57
	
i1l6593:	
;SC8F054_main.c: 57: led_control.count_1ms = 0;
	clrf	0+(_led_control)+0Eh
	line	58
	
i1l6595:	
;SC8F054_main.c: 58: if(soft_recieve_control.dalay_time)
	movf	(0+(_soft_recieve_control)+07h),w
	btfsc	status,2
	goto	u225_21
	goto	u225_20
u225_21:
	goto	i1l579
u225_20:
	line	60
	
i1l6597:	
;SC8F054_main.c: 59: {
;SC8F054_main.c: 60: soft_recieve_control.dalay_time--;
	decf	0+(_soft_recieve_control)+07h,f
	line	61
	
i1l579:	
	line	63
;SC8F054_main.c: 61: }
;SC8F054_main.c: 63: led_control.count_10ms++;
	incf	0+(_led_control)+0Fh,f
	line	64
	
i1l6599:	
;SC8F054_main.c: 64: if(led_control.count_10ms >= 9)
	movlw	low(09h)
	subwf	0+(_led_control)+0Fh,w
	skipc
	goto	u226_21
	goto	u226_20
u226_21:
	goto	i1l627
u226_20:
	line	66
	
i1l6601:	
;SC8F054_main.c: 65: {
;SC8F054_main.c: 66: led_control.count_10ms = 0;
	clrf	0+(_led_control)+0Fh
	line	68
;SC8F054_main.c: 68: switch(led_control.led_mode)
	goto	i1l6739
	line	72
	
i1l6603:	
;SC8F054_main.c: 71: {
;SC8F054_main.c: 72: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	73
;SC8F054_main.c: 73: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	74
;SC8F054_main.c: 74: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	line	75
;SC8F054_main.c: 75: PWMCON0 = 0x00;
	clrf	(21)	;volatile
	line	76
;SC8F054_main.c: 76: break;
	goto	i1l6741
	line	80
	
i1l6605:	
;SC8F054_main.c: 79: {
;SC8F054_main.c: 80: led_control.red_duty = led_control.set_red_duty;
	movf	0+(_led_control)+04h,w
	movwf	0+(_led_control)+01h
	line	81
;SC8F054_main.c: 81: led_control.green_duty = led_control.set_green_duty;
	movf	0+(_led_control)+05h,w
	movwf	0+(_led_control)+02h
	line	82
;SC8F054_main.c: 82: led_control.blue_duty = led_control.set_blue_duty;
	movf	0+(_led_control)+06h,w
	movwf	0+(_led_control)+03h
	line	84
	
i1l6607:	
;SC8F054_main.c: 84: if((led_control.blue_duty == 0) && (led_control.green_duty == 0) && (led_control.red_duty == 0))
	movf	(0+(_led_control)+03h),w
	btfss	status,2
	goto	u227_21
	goto	u227_20
u227_21:
	goto	i1l6615
u227_20:
	
i1l6609:	
	movf	(0+(_led_control)+02h),w
	btfss	status,2
	goto	u228_21
	goto	u228_20
u228_21:
	goto	i1l6615
u228_20:
	
i1l6611:	
	movf	(0+(_led_control)+01h),w
	btfss	status,2
	goto	u229_21
	goto	u229_20
u229_21:
	goto	i1l6615
u229_20:
	line	86
	
i1l6613:	
;SC8F054_main.c: 85: {
;SC8F054_main.c: 86: PWMCON0 = 0x00;
	clrf	(21)	;volatile
	line	87
;SC8F054_main.c: 87: }
	goto	i1l6741
	line	90
	
i1l6615:	
;SC8F054_main.c: 88: else
;SC8F054_main.c: 89: {
;SC8F054_main.c: 90: PWMCON0 = 0x16;
	movlw	low(016h)
	movwf	(21)	;volatile
	goto	i1l6741
	line	91
	
i1l586:	
	line	92
;SC8F054_main.c: 91: }
;SC8F054_main.c: 92: break;
	goto	i1l6741
	line	96
	
i1l6617:	
;SC8F054_main.c: 95: {
;SC8F054_main.c: 96: led_control.led_mode_count++;
	incf	0+(_led_control)+09h,f
	line	97
	
i1l6619:	
;SC8F054_main.c: 97: if(led_control.led_mode_count >= 112)
	movlw	low(070h)
	subwf	0+(_led_control)+09h,w
	skipc
	goto	u230_21
	goto	u230_20
u230_21:
	goto	i1l6623
u230_20:
	line	99
	
i1l6621:	
;SC8F054_main.c: 98: {
;SC8F054_main.c: 99: led_control.led_mode_count = 0;
	clrf	0+(_led_control)+09h
	line	102
	
i1l6623:	
;SC8F054_main.c: 100: }
;SC8F054_main.c: 102: if(led_control.led_mode_count < 56)
	movlw	low(038h)
	subwf	0+(_led_control)+09h,w
	skipnc
	goto	u231_21
	goto	u231_20
u231_21:
	goto	i1l6627
u231_20:
	line	104
	
i1l6625:	
;SC8F054_main.c: 103: {
;SC8F054_main.c: 104: led_control.red_duty = led_control.set_red_duty;
	movf	0+(_led_control)+04h,w
	movwf	0+(_led_control)+01h
	line	105
;SC8F054_main.c: 105: led_control.green_duty = led_control.set_green_duty;
	movf	0+(_led_control)+05h,w
	movwf	0+(_led_control)+02h
	line	106
;SC8F054_main.c: 106: led_control.blue_duty = led_control.set_blue_duty;
	movf	0+(_led_control)+06h,w
	movwf	0+(_led_control)+03h
	line	107
;SC8F054_main.c: 107: PWMCON0 = 0x16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	108
;SC8F054_main.c: 108: }
	goto	i1l6741
	line	111
	
i1l6627:	
;SC8F054_main.c: 109: else
;SC8F054_main.c: 110: {
;SC8F054_main.c: 111: PWMCON0 = 0x00;
	clrf	(21)	;volatile
	line	112
;SC8F054_main.c: 112: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	113
;SC8F054_main.c: 113: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	114
;SC8F054_main.c: 114: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	goto	i1l6741
	line	120
	
i1l6629:	
;SC8F054_main.c: 119: {
;SC8F054_main.c: 120: led_control.led_mode_count++;
	incf	0+(_led_control)+09h,f
	line	121
	
i1l6631:	
;SC8F054_main.c: 121: if(led_control.led_mode_count >= 32)
	movlw	low(020h)
	subwf	0+(_led_control)+09h,w
	skipc
	goto	u232_21
	goto	u232_20
u232_21:
	goto	i1l6635
u232_20:
	line	123
	
i1l6633:	
;SC8F054_main.c: 122: {
;SC8F054_main.c: 123: led_control.led_mode_count = 0;
	clrf	0+(_led_control)+09h
	line	126
	
i1l6635:	
;SC8F054_main.c: 124: }
;SC8F054_main.c: 126: if(led_control.led_mode_count < 16)
	movlw	low(010h)
	subwf	0+(_led_control)+09h,w
	skipnc
	goto	u233_21
	goto	u233_20
u233_21:
	goto	i1l6627
u233_20:
	line	128
	
i1l6637:	
;SC8F054_main.c: 127: {
;SC8F054_main.c: 128: PWMCON0 = 0x16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	129
;SC8F054_main.c: 129: led_control.red_duty = led_control.set_red_duty;
	movf	0+(_led_control)+04h,w
	movwf	0+(_led_control)+01h
	line	130
;SC8F054_main.c: 130: led_control.green_duty = led_control.set_green_duty;
	movf	0+(_led_control)+05h,w
	movwf	0+(_led_control)+02h
	line	131
;SC8F054_main.c: 131: led_control.blue_duty = led_control.set_blue_duty;
	movf	0+(_led_control)+06h,w
	movwf	0+(_led_control)+03h
	line	132
;SC8F054_main.c: 132: }
	goto	i1l6741
	line	144
	
i1l6641:	
;SC8F054_main.c: 143: {
;SC8F054_main.c: 144: PWMCON0 = 0x16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	145
	
i1l6643:	
;SC8F054_main.c: 145: led_control.led_mode_count++;
	incf	0+(_led_control)+09h,f
	line	146
	
i1l6645:	
;SC8F054_main.c: 146: if(led_control.led_mode_count >= 112)
	movlw	low(070h)
	subwf	0+(_led_control)+09h,w
	skipc
	goto	u234_21
	goto	u234_20
u234_21:
	goto	i1l6649
u234_20:
	line	148
	
i1l6647:	
;SC8F054_main.c: 147: {
;SC8F054_main.c: 148: led_control.led_mode_count = 0;
	clrf	0+(_led_control)+09h
	line	151
	
i1l6649:	
;SC8F054_main.c: 149: }
;SC8F054_main.c: 151: if(led_control.led_mode_count / 7 % 2 == 0)
	movlw	low(07h)
	movwf	(___lbdiv@divisor)
	movf	0+(_led_control)+09h,w
	fcall	___lbdiv
	andlw	01h
	btfss	status,2
	goto	u235_21
	goto	u235_20
u235_21:
	goto	i1l6627
u235_20:
	goto	i1l6625
	line	169
	
i1l6655:	
;SC8F054_main.c: 168: {
;SC8F054_main.c: 169: PWMCON0 = 0x16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	170
	
i1l6657:	
;SC8F054_main.c: 170: led_control.led_mode_count++;
	incf	0+(_led_control)+09h,f
	line	171
	
i1l6659:	
;SC8F054_main.c: 171: if(led_control.led_mode_count >= 50)
	movlw	low(032h)
	subwf	0+(_led_control)+09h,w
	skipc
	goto	u236_21
	goto	u236_20
u236_21:
	goto	i1l6741
u236_20:
	line	173
	
i1l6661:	
;SC8F054_main.c: 172: {
;SC8F054_main.c: 173: led_control.led_mode_count = 0;
	clrf	0+(_led_control)+09h
	line	174
	
i1l6663:	
;SC8F054_main.c: 174: led_control.led_color++;
	incf	0+(_led_control)+07h,f
	line	175
	
i1l6665:	
;SC8F054_main.c: 175: if(led_control.led_color > 15)
	movlw	low(010h)
	subwf	0+(_led_control)+07h,w
	skipc
	goto	u237_21
	goto	u237_20
u237_21:
	goto	i1l6741
u237_20:
	line	177
	
i1l6667:	
;SC8F054_main.c: 176: {
;SC8F054_main.c: 177: led_control.led_color = 1;
	clrf	0+(_led_control)+07h
	incf	0+(_led_control)+07h,f
	goto	i1l6741
	line	184
	
i1l6669:	
;SC8F054_main.c: 183: {
;SC8F054_main.c: 184: PWMCON0 = 0x16;
	movlw	low(016h)
	movwf	(21)	;volatile
	line	185
	
i1l6671:	
;SC8F054_main.c: 185: if(led_control.breath_flag == 1)
		decf	((_led_control)),w
	btfss	status,2
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l6705
u238_20:
	line	187
	
i1l6673:	
;SC8F054_main.c: 186: {
;SC8F054_main.c: 187: if(led_control.led_mode_count)
	movf	(0+(_led_control)+09h),w
	btfsc	status,2
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l6741
u239_20:
	line	189
	
i1l6675:	
;SC8F054_main.c: 188: {
;SC8F054_main.c: 189: led_control.breath_time++;
	incf	0+(_led_control)+0Ah,f
	line	190
	
i1l6677:	
;SC8F054_main.c: 190: if(led_control.breath_time >= led_control.breath_start_off_time)
	movf	0+(_led_control)+0Bh,w
	subwf	0+(_led_control)+0Ah,w
	skipc
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l6741
u240_20:
	line	192
	
i1l6679:	
;SC8F054_main.c: 191: {
;SC8F054_main.c: 192: led_control.breath_time = 0;
	clrf	0+(_led_control)+0Ah
	line	193
	
i1l6681:	
;SC8F054_main.c: 193: led_control.led_mode_count--;
	decf	0+(_led_control)+09h,f
	line	195
	
i1l6683:	
;SC8F054_main.c: 195: if(led_control.red_duty >= led_control.set_red_duty)
	movf	0+(_led_control)+04h,w
	subwf	0+(_led_control)+01h,w
	skipc
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l6687
u241_20:
	line	197
	
i1l6685:	
;SC8F054_main.c: 196: {
;SC8F054_main.c: 197: led_control.red_duty = led_control.set_red_duty;
	movf	0+(_led_control)+04h,w
	movwf	0+(_led_control)+01h
	line	198
;SC8F054_main.c: 198: }
	goto	i1l6689
	line	201
	
i1l6687:	
;SC8F054_main.c: 199: else
;SC8F054_main.c: 200: {
;SC8F054_main.c: 201: led_control.red_duty = led_control.red_duty + led_control.set_red_duty / led_control.breat_time_control;
	movf	0+(_led_control)+013h,w
	movwf	(___lbdiv@divisor)
	movf	0+(_led_control)+04h,w
	fcall	___lbdiv
	addwf	0+(_led_control)+01h,w
	movwf	0+(_led_control)+01h
	line	203
	
i1l6689:	
;SC8F054_main.c: 202: }
;SC8F054_main.c: 203: if(led_control.green_duty >= led_control.set_green_duty)
	movf	0+(_led_control)+05h,w
	subwf	0+(_led_control)+02h,w
	skipc
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l6693
u242_20:
	line	205
	
i1l6691:	
;SC8F054_main.c: 204: {
;SC8F054_main.c: 205: led_control.green_duty = led_control.set_green_duty;
	movf	0+(_led_control)+05h,w
	movwf	0+(_led_control)+02h
	line	206
;SC8F054_main.c: 206: }
	goto	i1l6695
	line	209
	
i1l6693:	
;SC8F054_main.c: 207: else
;SC8F054_main.c: 208: {
;SC8F054_main.c: 209: led_control.green_duty = led_control.green_duty + led_control.set_green_duty / led_control.breat_time_control;
	movf	0+(_led_control)+013h,w
	movwf	(___lbdiv@divisor)
	movf	0+(_led_control)+05h,w
	fcall	___lbdiv
	addwf	0+(_led_control)+02h,w
	movwf	0+(_led_control)+02h
	line	211
	
i1l6695:	
;SC8F054_main.c: 210: }
;SC8F054_main.c: 211: if(led_control.blue_duty >= led_control.set_blue_duty)
	movf	0+(_led_control)+06h,w
	subwf	0+(_led_control)+03h,w
	skipc
	goto	u243_21
	goto	u243_20
u243_21:
	goto	i1l6699
u243_20:
	line	213
	
i1l6697:	
;SC8F054_main.c: 212: {
;SC8F054_main.c: 213: led_control.blue_duty = led_control.set_blue_duty;
	movf	0+(_led_control)+06h,w
	movwf	0+(_led_control)+03h
	line	214
;SC8F054_main.c: 214: }
	goto	i1l6701
	line	217
	
i1l6699:	
;SC8F054_main.c: 215: else
;SC8F054_main.c: 216: {
;SC8F054_main.c: 217: led_control.blue_duty = led_control.blue_duty + led_control.set_blue_duty / led_control.breat_time_control;
	movf	0+(_led_control)+013h,w
	movwf	(___lbdiv@divisor)
	movf	0+(_led_control)+06h,w
	fcall	___lbdiv
	addwf	0+(_led_control)+03h,w
	movwf	0+(_led_control)+03h
	line	219
	
i1l6701:	
;SC8F054_main.c: 218: }
;SC8F054_main.c: 219: if(led_control.led_mode_count <= 0)
	movf	(0+(_led_control)+09h),w
	btfss	status,2
	goto	u244_21
	goto	u244_20
u244_21:
	goto	i1l586
u244_20:
	line	221
	
i1l6703:	
;SC8F054_main.c: 220: {
;SC8F054_main.c: 221: led_control.red_duty = led_control.set_red_duty;
	movf	0+(_led_control)+04h,w
	movwf	0+(_led_control)+01h
	line	222
;SC8F054_main.c: 222: led_control.green_duty = led_control.set_green_duty;
	movf	0+(_led_control)+05h,w
	movwf	0+(_led_control)+02h
	line	223
;SC8F054_main.c: 223: led_control.blue_duty = led_control.set_blue_duty;
	movf	0+(_led_control)+06h,w
	movwf	0+(_led_control)+03h
	goto	i1l6741
	line	230
	
i1l6705:	
;SC8F054_main.c: 228: else
;SC8F054_main.c: 229: {
;SC8F054_main.c: 230: if(led_control.led_mode_count)
	movf	(0+(_led_control)+09h),w
	btfsc	status,2
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l6741
u245_20:
	line	232
	
i1l6707:	
;SC8F054_main.c: 231: {
;SC8F054_main.c: 232: led_control.breath_time++;
	incf	0+(_led_control)+0Ah,f
	line	233
	
i1l6709:	
;SC8F054_main.c: 233: if(led_control.breath_time >= led_control.breath_start_off_time)
	movf	0+(_led_control)+0Bh,w
	subwf	0+(_led_control)+0Ah,w
	skipc
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l6741
u246_20:
	line	235
	
i1l6711:	
;SC8F054_main.c: 234: {
;SC8F054_main.c: 235: led_control.breath_time = 0;
	clrf	0+(_led_control)+0Ah
	line	236
	
i1l6713:	
;SC8F054_main.c: 236: led_control.led_mode_count--;
	decf	0+(_led_control)+09h,f
	line	238
	
i1l6715:	
;SC8F054_main.c: 238: if(led_control.red_duty <= 0)
	movf	(0+(_led_control)+01h),w
	btfss	status,2
	goto	u247_21
	goto	u247_20
u247_21:
	goto	i1l6719
u247_20:
	line	240
	
i1l6717:	
;SC8F054_main.c: 239: {
;SC8F054_main.c: 240: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	241
;SC8F054_main.c: 241: }
	goto	i1l6721
	line	244
	
i1l6719:	
;SC8F054_main.c: 242: else
;SC8F054_main.c: 243: {
;SC8F054_main.c: 244: led_control.red_duty = led_control.red_duty - led_control.set_red_duty / led_control.breat_time_control;
	movf	0+(_led_control)+013h,w
	movwf	(___lbdiv@divisor)
	movf	0+(_led_control)+04h,w
	fcall	___lbdiv
	subwf	0+(_led_control)+01h,w
	movwf	0+(_led_control)+01h
	line	247
	
i1l6721:	
;SC8F054_main.c: 245: }
;SC8F054_main.c: 247: if(led_control.green_duty <= 0)
	movf	(0+(_led_control)+02h),w
	btfss	status,2
	goto	u248_21
	goto	u248_20
u248_21:
	goto	i1l6725
u248_20:
	line	249
	
i1l6723:	
;SC8F054_main.c: 248: {
;SC8F054_main.c: 249: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	250
;SC8F054_main.c: 250: }
	goto	i1l6727
	line	253
	
i1l6725:	
;SC8F054_main.c: 251: else
;SC8F054_main.c: 252: {
;SC8F054_main.c: 253: led_control.green_duty = led_control.green_duty - led_control.set_green_duty / led_control.breat_time_control;
	movf	0+(_led_control)+013h,w
	movwf	(___lbdiv@divisor)
	movf	0+(_led_control)+05h,w
	fcall	___lbdiv
	subwf	0+(_led_control)+02h,w
	movwf	0+(_led_control)+02h
	line	256
	
i1l6727:	
;SC8F054_main.c: 254: }
;SC8F054_main.c: 256: if(led_control.blue_duty <= 0)
	movf	(0+(_led_control)+03h),w
	btfss	status,2
	goto	u249_21
	goto	u249_20
u249_21:
	goto	i1l6731
u249_20:
	line	258
	
i1l6729:	
;SC8F054_main.c: 257: {
;SC8F054_main.c: 258: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	line	259
;SC8F054_main.c: 259: }
	goto	i1l6733
	line	262
	
i1l6731:	
;SC8F054_main.c: 260: else
;SC8F054_main.c: 261: {
;SC8F054_main.c: 262: led_control.blue_duty = led_control.blue_duty - led_control.set_blue_duty / led_control.breat_time_control;
	movf	0+(_led_control)+013h,w
	movwf	(___lbdiv@divisor)
	movf	0+(_led_control)+06h,w
	fcall	___lbdiv
	subwf	0+(_led_control)+03h,w
	movwf	0+(_led_control)+03h
	line	265
	
i1l6733:	
;SC8F054_main.c: 263: }
;SC8F054_main.c: 265: if(led_control.led_mode_count <= 0)
	movf	(0+(_led_control)+09h),w
	btfss	status,2
	goto	u250_21
	goto	u250_20
u250_21:
	goto	i1l6741
u250_20:
	line	267
	
i1l6735:	
;SC8F054_main.c: 266: {
;SC8F054_main.c: 267: led_control.red_duty = 0;
	clrf	0+(_led_control)+01h
	line	268
;SC8F054_main.c: 268: led_control.green_duty = 0;
	clrf	0+(_led_control)+02h
	line	269
;SC8F054_main.c: 269: led_control.blue_duty = 0;
	clrf	0+(_led_control)+03h
	goto	i1l6741
	line	68
	
i1l6739:	
	movf	0+(_led_control)+08h,w
	; Switch size 1, requested type "speed"
; Number of cases is 7, Range of values is 1 to 16
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           25     9 (fixed)
; simple_byte           22    12 (average)
; jumptable            263     9 (fixed)
;	Chosen strategy is direct_byte

	addlw	-1
	skipc
goto i1l6741
	movwf fsr
	movlw	16
	subwf	fsr,w
skipnc
goto i1l6741
movlw high(i1S6817)
movwf pclath
	movlw low(i1S6817)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
i1S6817:
	ljmp	i1l6603
	ljmp	i1l6605
	ljmp	i1l6617
	ljmp	i1l6629
	ljmp	i1l6641
	ljmp	i1l6741
	ljmp	i1l6741
	ljmp	i1l6741
	ljmp	i1l6741
	ljmp	i1l6741
	ljmp	i1l6741
	ljmp	i1l6741
	ljmp	i1l6741
	ljmp	i1l6669
	ljmp	i1l6741
	ljmp	i1l6655
psect	text32

	line	280
	
i1l6741:	
;SC8F054_main.c: 280: led_control.count_100ms++;
	incf	0+(_led_control)+010h,f
	line	281
	
i1l6743:	
;SC8F054_main.c: 281: if(led_control.count_100ms >= 10)
	movlw	low(0Ah)
	subwf	0+(_led_control)+010h,w
	skipc
	goto	u251_21
	goto	u251_20
u251_21:
	goto	i1l627
u251_20:
	line	283
	
i1l6745:	
;SC8F054_main.c: 282: {
;SC8F054_main.c: 283: led_control.count_100ms = 0;
	clrf	0+(_led_control)+010h
	line	284
	
i1l6747:	
;SC8F054_main.c: 284: led_control.count_1000ms++;
	incf	0+(_led_control)+011h,f
	line	286
	
i1l6749:	
;SC8F054_main.c: 286: if(led_control.count_1000ms > 11)
	movlw	low(0Ch)
	subwf	0+(_led_control)+011h,w
	skipc
	goto	u252_21
	goto	u252_20
u252_21:
	goto	i1l6755
u252_20:
	line	288
	
i1l6751:	
;SC8F054_main.c: 287: {
;SC8F054_main.c: 288: soft_recieve_control.rand_flag = 0;
	bcf	(_soft_recieve_control),3
	line	289
	
i1l6753:	
;SC8F054_main.c: 289: led_control.count_1000ms = 0;
	clrf	0+(_led_control)+011h
	line	292
	
i1l6755:	
;SC8F054_main.c: 290: }
;SC8F054_main.c: 292: if(sleep_control.sleep_count < 20000)
	movlw	04Eh
	subwf	1+(_sleep_control)+01h,w
	movlw	020h
	skipnz
	subwf	0+(_sleep_control)+01h,w
	skipnc
	goto	u253_21
	goto	u253_20
u253_21:
	goto	i1l578
u253_20:
	line	294
	
i1l6757:	
;SC8F054_main.c: 293: {
;SC8F054_main.c: 294: sleep_control.sleep_count++;
	incf	0+(_sleep_control)+01h,f
	skipnz
	incf	1+(_sleep_control)+01h,f
	goto	i1l627
	line	298
	
i1l578:	
	line	300
	
i1l627:	
	movf	(??_INT_Isr+2),w
	movwf	pclath
	movf	(??_INT_Isr+1),w
	movwf	fsr0
	swapf	(??_INT_Isr+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_INT_Isr
	__end_of_INT_Isr:
	signat	_INT_Isr,89
	global	___lbdiv

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 4 in file "D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    1[COMMON] unsigned char 
;;  quotient        1    3[COMMON] unsigned char 
;;  counter         1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 100/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         3       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_INT_Isr
;; This function uses a non-reentrant model
;;
psect	text33,local,class=CODE,delta=2,merge=1,group=1
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\lbdiv.c"
	line	4
global __ptext33
__ptext33:	;psect for function ___lbdiv
psect	text33
	file	"D:\QW\QW-中微\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\data\sources\common\lbdiv.c"
	line	4
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
;incstack = 0
	opt	stack 2
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	movwf	(___lbdiv@dividend)
	line	9
	
i1l6545:	
	clrf	(___lbdiv@quotient)
	line	10
	
i1l6547:	
	movf	((___lbdiv@divisor)),w
	btfsc	status,2
	goto	u219_21
	goto	u219_20
u219_21:
	goto	i1l6565
u219_20:
	line	11
	
i1l6549:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	i1l6553
	
i1l4423:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
i1l6551:	
	incf	(___lbdiv@counter),f
	line	12
	
i1l6553:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u220_21
	goto	u220_20
u220_21:
	goto	i1l4423
u220_20:
	line	16
	
i1l4425:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
i1l6555:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u221_21
	goto	u221_20
u221_21:
	goto	i1l6561
u221_20:
	line	19
	
i1l6557:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
i1l6559:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
i1l6561:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
i1l6563:	
	decfsz	(___lbdiv@counter),f
	goto	u222_21
	goto	u222_20
u222_21:
	goto	i1l4425
u222_20:
	line	25
	
i1l6565:	
	movf	(___lbdiv@quotient),w
	line	26
	
i1l4428:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
	signat	___lbdiv,8313
	global	_Key_Check_Time

;; *************** function _Key_Check_Time *****************
;; Defined at:
;;		line 113 in file "D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_INT_Isr
;; This function uses a non-reentrant model
;;
psect	text34,local,class=CODE,delta=2,merge=1,group=0
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
	line	113
global __ptext34
__ptext34:	;psect for function _Key_Check_Time
psect	text34
	file	"D:\QW\QW-项目\QW-247\程序\手环-中微-程序-16通道-2.4G\QW-247_SC8F054_V1.0_16M2T_16Channel\SC8F054_key.c"
	line	113
	global	__size_of_Key_Check_Time
	__size_of_Key_Check_Time	equ	__end_of_Key_Check_Time-_Key_Check_Time
	
_Key_Check_Time:	
;incstack = 0
	opt	stack 2
; Regs used in _Key_Check_Time: [wreg+status,2+status,0]
	line	115
	
i1l6529:	
;SC8F054_key.c: 115: if(key_control.key_down_pb)
	btfss	(_key_control),1
	goto	u215_21
	goto	u215_20
u215_21:
	goto	i1l6537
u215_20:
	line	117
	
i1l6531:	
;SC8F054_key.c: 116: {
;SC8F054_key.c: 117: key_control.key_down_time_pb++;
	incf	0+(_key_control)+02h,f
	skipnz
	incf	1+(_key_control)+02h,f
	line	118
	
i1l6533:	
;SC8F054_key.c: 118: if(key_control.key_down_time_pb >= 3000)
	movlw	0Bh
	subwf	1+(_key_control)+02h,w
	movlw	0B8h
	skipnz
	subwf	0+(_key_control)+02h,w
	skipc
	goto	u216_21
	goto	u216_20
u216_21:
	goto	i1l6537
u216_20:
	line	120
	
i1l6535:	
;SC8F054_key.c: 119: {
;SC8F054_key.c: 120: key_control.key_down_time_pb = 3000;
	movlw	0B8h
	movwf	0+(_key_control)+02h
	movlw	0Bh
	movwf	(0+(_key_control)+02h)+1
	line	123
	
i1l6537:	
;SC8F054_key.c: 121: }
;SC8F054_key.c: 122: }
;SC8F054_key.c: 123: if(key_control.key_up_pb)
	btfss	(_key_control),3
	goto	u217_21
	goto	u217_20
u217_21:
	goto	i1l1198
u217_20:
	line	125
	
i1l6539:	
;SC8F054_key.c: 124: {
;SC8F054_key.c: 125: key_control.key_up_time_pb++;
	incf	0+(_key_control)+01h,f
	line	126
	
i1l6541:	
;SC8F054_key.c: 126: if(key_control.key_up_time_pb >= 255)
		incf	(0+(_key_control)+01h),w
	btfss	status,2
	goto	u218_21
	goto	u218_20
u218_21:
	goto	i1l1198
u218_20:
	line	128
	
i1l6543:	
;SC8F054_key.c: 127: {
;SC8F054_key.c: 128: key_control.key_up_time_pb = 255;
	movlw	low(0FFh)
	movwf	0+(_key_control)+01h
	line	131
	
i1l1198:	
	return
	opt stack 0
GLOBAL	__end_of_Key_Check_Time
	__end_of_Key_Check_Time:
	signat	_Key_Check_Time,89
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
