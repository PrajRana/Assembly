
//Prajwal Rana
//1001531196

.global add32
.global sub64
.global minU16
.global minS32
.global isLessThanU16
.global isLessThanS16
.global shiftLeftU16
.global shiftU32
.global shiftS8
.global isEqualU32
.global isEqualS8

.text

//question 1
add32:
ADDS R0,R0,R1
MOVS R1,#0
ADC R1,#0
BX LR

//question 2
sub64:
SUBS R0,R0,R2
SBC R1,R1,R3
BX LR

//question 3 and 4
minU16:
minS32:
CMP R0,R1
MOV R0,R0
BMI end1
MOV R0,R1

end1:
BX LR

//question 5 and 6
isLessThanU16:
isLessThanS16:
CMP R0,R1
MOV R0,#1
BMI end2
MOV R0,#0

end2:
BX LR
 
//question 7
shiftLeftU16:
MOV R0,R0,LSL R1
BX LR


//question 8
shiftU32:
CMP R0,R1
BEQ level
BLT level2
BGT level3

end3:
BX LR

level:
B end3

level2:
MOV R0,R0,LSL R1
B end3

level3:
MOV R2,#-1
MUL R1,R2
MOV R0,R0,LSR R1
B end3


//question 9
shiftS8:
CMP R1,#0
BLT check2
BGT check

end4:
BX LR

check:
MOV R0,R0,LSL R1
B end4

check2:
MOV R2,#-1
MUL R1,R2
MOV R0,R0,LSR R1
B end4


//question 10 and 11
isEqualU32:
isEqualS8:
CMP R0,R1
MOV R0,#1
BEQ end5
MOV R0,#0
BGT end5
BLT end5

end5:
BX LR

	
