#define CFG_GCR (*(volatile unsigned char*)0x7F60)
#define CFG_GCR_AL (1 << 1)
#define CFG_GCR_SWD (1 << 0)

/* GPIO */
#define PA_ODR (*(volatile unsigned char*)0x5000)
#define PA_IDR (*(volatile unsigned char*)0x5001)
#define PA_DDR (*(volatile unsigned char*)0x5002)
#define PA_CR1 (*(volatile unsigned char*)0x5003)
#define PA_CR2 (*(volatile unsigned char*)0x5004)

#define PB_ODR (*(volatile unsigned char*)0x5005)
#define PB_IDR (*(volatile unsigned char*)0x5006)
#define PB_DDR (*(volatile unsigned char*)0x5007)
#define PB_CR1 (*(volatile unsigned char*)0x5008)
#define PB_CR2 (*(volatile unsigned char*)0x5009)

#define PC_ODR (*(volatile unsigned char*)0x500A)
#define PC_IDR (*(volatile unsigned char*)0x500B)
#define PC_DDR (*(volatile unsigned char*)0x500C)
#define PC_CR1 (*(volatile unsigned char*)0x500D)
#define PC_CR2 (*(volatile unsigned char*)0x500E)

#define PD_ODR (*(volatile unsigned char*)0x500F)
#define PD_IDR (*(volatile unsigned char*)0x5010)
#define PD_DDR (*(volatile unsigned char*)0x5011)
#define PD_CR1 (*(volatile unsigned char*)0x5012)
#define PD_CR2 (*(volatile unsigned char*)0x5013)

#define PE_ODR (*(volatile unsigned char*)0x5014)
#define PE_IDR (*(volatile unsigned char*)0x5015)
#define PE_DDR (*(volatile unsigned char*)0x5016)
#define PE_CR1 (*(volatile unsigned char*)0x5017)
#define PE_CR2 (*(volatile unsigned char*)0x5018)

#define PF_ODR (*(volatile unsigned char*)0x5019)
#define PF_IDR (*(volatile unsigned char*)0x501A)
#define PF_DDR (*(volatile unsigned char*)0x501B)
#define PF_CR1 (*(volatile unsigned char*)0x501C)
#define PF_CR2 (*(volatile unsigned char*)0x501D)

/* CLOCK */
#define CLK_DIVR	(*(volatile unsigned char*)0x50C0)
#define CLK_CRTCR	(*(volatile unsigned char*)0x50C1)
#define CLK_ICKR	(*(volatile unsigned char*)0x50C2)
#define CLK_PCKENR1	(*(volatile unsigned char*)0x50C3)
#define CLK_PCKENR2	(*(volatile unsigned char*)0x50C4)
#define CLK_CCOR	(*(volatile unsigned char*)0x50C5)
#define CLK_ECKR	(*(volatile unsigned char*)0x50C6)
#define CLK_SCSR	(*(volatile unsigned char*)0x50C7)
#define CLK_SWR 	(*(volatile unsigned char*)0x50C8)
#define CLK_SWCR	(*(volatile unsigned char*)0x50C9)
#define CLK_CSSR	(*(volatile unsigned char*)0x50CA)
#define CLK_CBEEPR	(*(volatile unsigned char*)0x50CB)
#define CLK_HSICALR	(*(volatile unsigned char*)0x50CC)
#define CLK_HSITRIMR	(*(volatile unsigned char*)0x50CD)
#define CLK_HSIUNLCKR	(*(volatile unsigned char*)0x50CE)
#define CLK_REGCSR	(*(volatile unsigned char*)0x50CF)


/* ------------------- USART ------------------- */
#define USART1_SR (*(volatile unsigned char*)0x5230)
#define USART1_DR (*(volatile unsigned char*)0x5231)
#define USART1_BRR1 (*(volatile unsigned char*)0x5232)
#define USART1_BRR2 (*(volatile unsigned char*)0x5233)
#define USART1_CR1 (*(volatile unsigned char*)0x5234)
#define USART1_CR2 (*(volatile unsigned char*)0x5235)
#define USART1_CR3 (*(volatile unsigned char*)0x5236)
#define USART1_CR4 (*(volatile unsigned char*)0x5237)
#define USART1_CR5 (*(volatile unsigned char*)0x5238)
#define USART1_GTR (*(volatile unsigned char*)0x5239)
#define USART1_PSCR (*(volatile unsigned char*)0x523A)

/* USART_CR1 bits */
#define USART_CR1_R8 (1 << 7)
#define USART_CR1_T8 (1 << 6)
#define USART_CR1_UARTD (1 << 5)
#define USART_CR1_M (1 << 4)
#define USART_CR1_WAKE (1 << 3)
#define USART_CR1_PCEN (1 << 2)
#define USART_CR1_PS (1 << 1)
#define USART_CR1_PIEN (1 << 0)

/* USART_CR2 bits */
#define USART_CR2_TIEN (1 << 7)
#define USART_CR2_TCIEN (1 << 6)
#define USART_CR2_RIEN (1 << 5)
#define USART_CR2_ILIEN (1 << 4)
#define USART_CR2_TEN (1 << 3)
#define USART_CR2_REN (1 << 2)
#define USART_CR2_RWU (1 << 1)
#define USART_CR2_SBK (1 << 0)

/* USART_CR3 bits */
#define USART_CR3_LINEN (1 << 6)
#define USART_CR3_STOP2 (1 << 5)
#define USART_CR3_STOP1 (1 << 4)
#define USART_CR3_CLKEN (1 << 3)
#define USART_CR3_CPOL (1 << 2)
#define USART_CR3_CPHA (1 << 1)
#define USART_CR3_LBCL (1 << 0)

/* USART_SR bits */
#define USART_SR_TXE (1 << 7)
#define USART_SR_TC (1 << 6)
#define USART_SR_RXNE (1 << 5)
#define USART_SR_IDLE (1 << 4)
#define USART_SR_OR (1 << 3)
#define USART_SR_NF (1 << 2)
#define USART_SR_FE (1 << 1)
#define USART_SR_PE (1 << 0)


/* ------------------- TIMERS ------------------- */
#define TIM2_base 0x5250
#define TIM3_base 0x5280



#define TIMx_CR1(base) (*(volatile unsigned char*)(base + 0))
#define TIMx_CR2(base) (*(volatile unsigned char*)(base + 1))
#define TIMx_SMCR(base) (*(volatile unsigned char*)(base + 2))
#define TIMx_ETR(base) (*(volatile unsigned char*)(base + 3))
#define TIMx_DER(base) (*(volatile unsigned char*)(base + 4))
#define TIMx_IER(base) (*(volatile unsigned char*)(base + 5))
#define TIMx_SR1(base) (*(volatile unsigned char*)(base + 6))
#define TIMx_SR2(base) (*(volatile unsigned char*)(base + 7))
#define TIMx_EGR(base) (*(volatile unsigned char*)(base + 8))
#define TIMx_CCMR1(base) (*(volatile unsigned char*)(base + 9))
#define TIMx_CCMR2(base) (*(volatile unsigned char*)(base + 0xA))
#define TIMx_CCER1(base) (*(volatile unsigned char*)(base + 0xb))
#define TIMx_CNTRH(base) (*(volatile unsigned char*)(base + 0xc))
#define TIMx_CNTRL(base) (*(volatile unsigned char*)(base + 0xd))
#define TIMx_PSCR(base) (*(volatile unsigned char*)(base + 0xe))
#define TIMx_ARRH(base) (*(volatile unsigned char*)(base + 0xf))
#define TIMx_ARRL(base) (*(volatile unsigned char*)(base + 0x10))
#define TIMx_CCR1H(base) (*(volatile unsigned char*)(base + 0x11))
#define TIMx_CCR1L(base) (*(volatile unsigned char*)(base + 0x12))
#define TIMx_CCR2H(base) (*(volatile unsigned char*)(base + 0x13))
#define TIMx_CCR2L(base) (*(volatile unsigned char*)(base + 0x14))
#define TIMx_BKR(base) (*(volatile unsigned char*)(base + 0x15))
#define TIMx_OISR(base) (*(volatile unsigned char*)(base + 0x16))


#define TIM1_CR1 *(unsigned char*)0x52B0
#define TIM1_CR2 *(unsigned char*)0x52B1
#define TIM1_SMCR *(unsigned char*)0x52B2
#define TIM1_ETR *(unsigned char*)0x52B3
#define TIM1_DER *(unsigned char*)0x52B4
#define TIM1_IER *(unsigned char*)0x52B5
#define TIM1_SR1 *(unsigned char*)0x52B6
#define TIM1_SR2 *(unsigned char*)0x52B7
#define TIM1_EGR *(unsigned char*)0x52B8
#define TIM1_CCMR1 *(unsigned char*)0x52B9
#define TIM1_CCMR2 *(unsigned char*)0x52BA
#define TIM1_CCMR3 *(unsigned char*)0x52BB
#define TIM1_CCMR4 *(unsigned char*)0x52BC
#define TIM1_CCER1 *(unsigned char*)0x52BD
#define TIM1_CCER2 *(unsigned char*)0x52BE
#define TIM1_CNTRH *(unsigned char*)0x52BF
#define TIM1_CNTRL *(unsigned char*)0x52C0
#define TIM1_PSCRH *(unsigned char*)0x52C1
#define TIM1_PSCRL *(unsigned char*)0x52C2
#define TIM1_ARRH *(unsigned char*)0x52C3
#define TIM1_ARRL *(unsigned char*)0x52C4
#define TIM1_RCR *(unsigned char*)0x52C5
#define TIM1_CCR1H *(unsigned char*)0x52C6
#define TIM1_CCR1L *(unsigned char*)0x52C7
#define TIM1_CCR2H *(unsigned char*)0x52C8
#define TIM1_CCR2L *(unsigned char*)0x52C9
#define TIM1_CCR3H *(unsigned char*)0x52CA
#define TIM1_CCR3L *(unsigned char*)0x52CB
#define TIM1_CCR4H *(unsigned char*)0x52CC
#define TIM1_CCR4L *(unsigned char*)0x52CD
#define TIM1_BKR *(unsigned char*)0x52CE
#define TIM1_DTR *(unsigned char*)0x52CF
#define TIM1_OISR *(unsigned char*)0x52D0
#define TIM1_DCR1 *(unsigned char*)0x52D1
#define TIM1_DCR2 *(unsigned char*)0x52D2
#define TIM1_DMA1R *(unsigned char*)0x52D3

#define TIM2_CR1 TIMx_CR1(TIM2_base)
#define TIM2_CR2 TIMx_CR2(TIM2_base)
#define TIM2_SMCR TIMx_SMCR(TIM2_base)
#define TIM2_ETR TIMx_ETR(TIM2_base)
#define TIM2_DER TIMx_DER(TIM2_base)
#define TIM2_IER TIMx_IER(TIM2_base)
#define TIM2_SR1 TIMx_SR1(TIM2_base)
#define TIM2_SR2 TIMx_SR2(TIM2_base)
#define TIM2_EGR TIMx_EGR(TIM2_base)
#define TIM2_CCMR1 TIMx_CCMR1(TIM2_base)
#define TIM2_CCMR2 TIMx_CCMR2(TIM2_base)
#define TIM2_CCER1 TIMx_CCER1(TIM2_base)
#define TIM2_CNTRH TIMx_CNTRH(TIM2_base)
#define TIM2_CNTRL TIMx_CNTRL(TIM2_base)
#define TIM2_PSCR TIMx_PSCR(TIM2_base)
#define TIM2_ARRH TIMx_ARRH(TIM2_base)
#define TIM2_ARRL TIMx_ARRL(TIM2_base)
#define TIM2_CCR1H TIMx_CCR1H(TIM2_base)
#define TIM2_CCR1L TIMx_CCR1L(TIM2_base)
#define TIM2_CCR2H TIMx_CCR2H(TIM2_base)
#define TIM2_CCR2L TIMx_CCR2L(TIM2_base)
#define TIM2_BKR TIMx_BKR(TIM2_base)
#define TIM2_OISR TIMx_OISR(TIM2_base)

#define TIM3_CR1 TIMx_CR1(TIM3_base)
#define TIM3_CR2 TIMx_CR2(TIM3_base)
#define TIM3_SMCR TIMx_SMCR(TIM3_base)
#define TIM3_ETR TIMx_ETR(TIM3_base)
#define TIM3_DER TIMx_DER(TIM3_base)
#define TIM3_IER TIMx_IER(TIM3_base)
#define TIM3_SR1 TIMx_SR1(TIM3_base)
#define TIM3_SR2 TIMx_SR2(TIM3_base)
#define TIM3_EGR TIMx_EGR(TIM3_base)
#define TIM3_CCMR1 TIMx_CCMR1(TIM3_base)
#define TIM3_CCMR2 TIMx_CCMR2(TIM3_base)
#define TIM3_CCER1 TIMx_CCER1(TIM3_base)
#define TIM3_CNTRH TIMx_CNTRH(TIM3_base)
#define TIM3_CNTRL TIMx_CNTRL(TIM3_base)
#define TIM3_PSCR TIMx_PSCR(TIM3_base)
#define TIM3_ARRH TIMx_ARRH(TIM3_base)
#define TIM3_ARRL TIMx_ARRL(TIM3_base)
#define TIM3_CCR1H TIMx_CCR1H(TIM3_base)
#define TIM3_CCR1L TIMx_CCR1L(TIM3_base)
#define TIM3_CCR2H TIMx_CCR2H(TIM3_base)
#define TIM3_CCR2L TIMx_CCR2L(TIM3_base)
#define TIM3_BKR TIMx_BKR(TIM3_base)
#define TIM3_OISR TIMx_OISR(TIM3_base)


/* TIM_IER bits */
#define TIM_IER_BIE (1 << 7)
#define TIM_IER_TIE (1 << 6)
#define TIM_IER_COMIE (1 << 5)
#define TIM_IER_CC4IE (1 << 4)
#define TIM_IER_CC3IE (1 << 3)
#define TIM_IER_CC2IE (1 << 2)
#define TIM_IER_CC1IE (1 << 1)
#define TIM_IER_UIE (1 << 0)

/* TIM_CR1 bits */
#define TIM_CR1_APRE (1 << 7)
#define TIM_CR1_CMSH (1 << 6)
#define TIM_CR1_CMSL (1 << 5)
#define TIM_CR1_DIR (1 << 4)
#define TIM_CR1_OPM (1 << 3)
#define TIM_CR1_URS (1 << 2)
#define TIM_CR1_UDIS (1 << 1)
#define TIM_CR1_CEN (1 << 0)

/* TIM_CR2 bits */
#define TIM_CR2_MMS(x) (((x) & 7) << 4)
#define TIM_CR2_CCDS (1 << 3)

/* TIM_SMCR bits */
#define TIM_SMCR_MSM (1 << 7)
#define TIM_SMCR_TS(x) (((x) & 7) << 4)
#define TIM_SMCR_SMS(x) ((x) & 7)


/* TIM_SR1 bits */
#define TIM_SR1_BIF (1 << 7)
#define TIM_SR1_TIF (1 << 6)
#define TIM_SR1_COMIF (1 << 5)
#define TIM_SR1_CC4IF (1 << 4)
#define TIM_SR1_CC3IF (1 << 3)
#define TIM_SR1_CC2IF (1 << 2)
#define TIM_SR1_CC1IF (1 << 1)
#define TIM_SR1_UIF (1 << 0)

/* ------------------- ITC ------------------- */
#define EXTI_CR1 (*(volatile unsigned char*)0x50A0)
#define EXTI_CR2 (*(volatile unsigned char*)0x50A1)
#define EXTI_CR3 (*(volatile unsigned char*)0x50A2)
#define EXTI_SR1 (*(volatile unsigned char*)0x50A3)
#define EXTI_SR2 (*(volatile unsigned char*)0x50A4)
#define EXTI_CONF1 (*(volatile unsigned char*)0x50A5)
#define WFE_CR1 (*(volatile unsigned char*)0x50A6)
#define WFE_CR2 (*(volatile unsigned char*)0x50A7)
#define WFE_CR3 (*(volatile unsigned char*)0x50A8)

