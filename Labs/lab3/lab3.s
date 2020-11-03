
.global sqrtSumF64
.global dotpF64
.global absSumF64
.global absSumF64
.global getDirection
.global getCity
.global maxF32
.global sumF32
.global prodF64
.global getAddNo

.text

@extern double sqrtSumF64(double x[], uint32_t count);
sqrtSumF64:
MOV R2,#0
VMOV D0,R2,R2

LOOP:
CMP R1,#0
BEQ END
VLDR.F64 D1,[R0]
VADD.F64 D0,D0,D1
SUB R1,R1,#1
ADD R0,R0,#8
B LOOP


END:
VSQRT.F64 D0,D0
VMOV R0,R1,D0
BX LR


@extern double dotpF64(double x[], double y[], uint32_t count)
dotpF64:
MOV R3,#0
VMOV S6,R3
VCVT.F64.U32 D0,S6

LOOP:
CMP R2,#0
BEQ END
VLDR.F64 D1,[R0]
VLDR.F64 D2,[R1]
VMUL.F64 D3,D1,D2
VADD.F64 D0,D0,D3
SUB R2,R2,#1
ADD R0,R0,#8
ADD R1,R1,#8
B LOOP


END:
VMOV R0,R1,D0
BX LR


@extern double absSumF64 (double x[], uint32_t count)
absSumF64:
MOV R2,#0
VMOV D0,R2,R2

LOOP:
CMP R1,#0
BEQ END
VLDR.F64 D1,[R0]
VADD.F64 D0,D0,D1
SUB R1,R1,#1
ADD R0,R0,#8
B LOOP


END:
VABS.F64 D0,D0
VMOV R0,R1,D0
BX LR


@extern double absSumF64 (double x[], uint32_t count)
absSumF6:

LOOP:
CMP R1,#0
BEQ END
VLDR.F32 S2,[R0]
VADD.F32 S0,S0,S2
VABS.F32 S0,S0
SUB R1,R1,#1
ADD R0,R0,#4
B LOOP

END:
VMOV R0,S0
BX LR


@extern char getDirection (BUSINESS business[], uint32_t index)
getDirection:
MOV R4,#120
MUL R3,R1,R4
ADD R0,R0,R3
ADD R0,R0,#44
LDR R0,[R0]
BX LR


@extern char * getCity(BUSINESS business[], uint32_t index);
getCity:
MOV R4,#120
MUL R3,R1,R4
ADD R0,R0,R3
ADD R0,R0,#78
BX LR



@extern float maxF32(float x[], uint32_t count)
maxF32:

VLDR.F32 S0,[R0]
@SUB R1,R1,#1                                 

LOOP:
CMP R1,#0
BEQ END
VLDR.F32 S1,[R0]
VCMP.F32 S1,S0
BGT GO_HERE
GO_BACK:
ADD R0,R0,#4
SUB R1,R1,#1
B LOOP

END:
VMOV R0,S0
BX LR

GO_HERE:
VMOV S0,S1
B GO_BACK


@extern float sumF32(float x[], uint32_t count);
sumF32:
LOOP:
CMP R1,#0
BEQ END
VLDR.F32 S2,[R0]
VADD.F32 S0,S0,S2
SUB R1,R1,#1
ADD R0,R0,#4
B LOOP

END:
VMOV R0,S0
BX LR


@extern double prodF64(double x[], uint32_t count);

prodF64:
MOV R3,#1
VMOV S5,R3
VCVT.F64.U32 D0,S5 @convert the value to double before using it

LOOP_HERE:
CMP R1,#0
BEQ END2
VLDR.F64 D1,[R0]
VMUL.F64 D0,D0,D1
SUB R1,R1,#1
ADD R0,R0,#8
B LOOP_HERE


END2:
VMOV R0,R1,D0
BX LR


@extern uint32_t getAddNo (BUSINESS business[], uint32_t index)
getAddNo:
getDirection:
MOV R4,#120
MUL R3,R1,R4
ADD R0,R0,R3
ADD R0,R0,#40
LDR R0,[R0]
BX LR

