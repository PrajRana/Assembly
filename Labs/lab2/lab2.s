.global stringCopy
.global stringCat
.global countNonNegative
.global returnMin
.global countNegative
.global returnMax
.global int32_t
.global countMatches

.text

stringCopy:
@extern void stringCopy(char* strTo, char* strFrom); // copies strFrom to strTo

loop:
LDRB R2,[R1],#1
STRB R2,[R0],#1
CMP R2,#0
BNE loop
BX LR

@extern void stringCat(char* strFrom, char* strTo); // adds strFrom to end of strTo
stringCat:
loop:
LDRB R2,[R1],#1
CMP R2,#0
BNE loop
SUB R1,R1,#1

loop2:
LDRB R3,[R0],#1
STRB R3,[R1],#1
CMP R3,#0
BNE loop2
BX LR


countNonNegative:
@extern uint32_t countNegative (int16_t x[], uint32_t count)
MOV R2,R0
MOV R0,#0

loop:
LDRSH R3,[R2],#2  @sigend so use SH
CMP R3,#0
BGE here

back:
SUBS R1,R1,#1
BNE loop
BX LR

here:
ADD R0,R0,#1
b back


returnMin:
@extern int32_t returnMin(int16_t x[], uint32_t count)
MOV R2,R0
MOV R0,#0
MOV R3,#0
MOV R4,#0
LDRSH R3,[R2],#2
MOV R5,R3

loop:
LDRSH R3,[R2],#2
CMP R5,R3
BGE go
continue:
SUBS R1,R1,#1
BNE loop
MOV R0,R5
BX LR

go:
MOV R5,R3
B continue


countNegative:
@extern uint32_t countNegative (int16_t x[], uint32_t count)
MOV R2,R0
MOV R0,#0

loop:
LDRSH R3,[R2],#2  @sigend so use SH
CMP R3,#0
BLT here

back:
SUBS R1,R1,#1
BNE loop
BX LR

here:
ADD R0,R0,#1
b back


@extern int32_t returnMax(int16_t x[], uint32_t count);
returnMax:
MOV R2,R0
MOV R0,#0
MOV R3,#0
MOV R4,#0
MOV R5,#0
LDRSH R3,[R2],#2
MOV R5,R3

loop:
LDRSH R3,[R2],#2
CMP R5,R3
BLE go
continue:
SUBS R1,R1,#1
BNE loop
MOV R0,R5
BX LR


go:
MOV R5,R3
B continue


@extern int32_t sumS32(int32_t x[], int32_t count);
int32_t:
MOV R2,R0
MOV R0,#0

loop:
LDR R2,[R2],#4
ADD R3,R3,R2
SUBS R1,R1,#1
CMP R1,R0
BNE loop
MOV R0,R3
BX LR



@extern uint32_t countMatches(char str[], char toMatch);
countMatches:
MOV R2,R0
MOV R0,#0

loop:
LDRB R3,[R2],#1
CMP R3,R1
BEQ calculate
continue:
CMP R3,#0
BEQ end
B loop

end:
BX LR

calculate:
ADD R0,R0,#1
B continue

