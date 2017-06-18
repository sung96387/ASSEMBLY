COMMENT!
6-8 부울 계산기 32비트 정수에 대한 간단한 부울 계산기로 동작하는 프로그램을 작성하라. 
이 프로그램은 사용자에게 다음 리스트에서 선택하도록 요청하는 메뉴 표시해야 한다.
1. x AND y 2. x OR y 3. NOT x 4. x XOR y 5. EXIT 
program사용자가 선택하면 수행할 연산의 이름을 표시하는 
다음과 같은 프로시저를 호출한다.
-AND_op : 사용자에게 두 16진수 입력 안내문을 출력한다. 두 입력을 AND 하고 결과를 16진수로 표시
-OR-op :사용자에게 두 16진수 입력 안내문을 출력한다. 두 입력을OR 하고 결과를 16진수로 표시
-NOT op: 사용자에게 두 16진수 입력 안내문을 출력한다. 두 입력을 NOT  하고 결과를 16진수로 표시
-XOR op : 사용자에게 두 16진수 입력 안내문을 출력한다. 두 입력을XOR 하고 결과를 16진수로 표시


!

INCLUDE Irvine32.inc

.data
msgMenu BYTE "------- 부울 계산기 ---------",0dh,0ah
	BYTE 0dh,0ah
	BYTE "1. x AND y"     ,0dh,0ah
	BYTE "2. x OR y"      ,0dh,0ah
	BYTE "3. NOT x"       ,0dh,0ah
	BYTE "4. x XOR y"     ,0dh,0ah
	BYTE "5. Exit program",0

msgAND BYTE "Boolean AND",0
msgOR  BYTE "Boolean OR",0
msgNOT BYTE "Boolean NOT",0
msgXOR BYTE "Boolean XOR",0

msgOperand1 BYTE "첫번째 수를 입력하세요:  ",0
msgOperand2 BYTE "두번째 수를 입력하세요: ",0
msgResult   BYTE "결과는 다음과같습니다:            ",0

caseTable BYTE '1'	
	DWORD AND_op	
EntrySize = ($ - caseTable )
	BYTE '2'
	DWORD OR_op
	BYTE '3'
	DWORD NOT_op
	BYTE '4'
	DWORD XOR_op
	BYTE '5'
	DWORD ExitProgram
NumberOfEntries = ($ - caseTable) / EntrySize

.code
main PROC
	call Clrscr

Menu:
	mov edx, OFFSET msgMenu	
	call WriteString
	call Crlf

L1:	call ReadChar
	cmp al, '5'	
	ja L1	
	cmp al, '1'
	jb L1

	call Crlf
	call Choose
	jc quit	

	call Crlf
	jmp Menu	

quit: exit
main ENDP

;------------------------------------------------
Choose PROC

	push ebx
	push ecx

	mov ebx, OFFSET caseTable
	mov ecx, NumberOfEntries	

L1:	cmp al, [ebx]
	jne L2	
	call NEAR PTR [ebx + 1]	
	jmp L3

L2:	add ebx, EntrySize	
	loop L1	

L3:	pop ecx
	pop ebx

	ret
Choose ENDP

;------------------------------------------------
AND_op PROC
;
	pushad	

	mov edx, OFFSET msgAND	
	call WriteString	
	call Crlf
	call Crlf

	mov edx, OFFSET msgOperand1	
	call WriteString
	call ReadHex	
	mov ebx, eax	

	mov edx, OFFSET msgOperand2	
	call WriteString
	call ReadHex	

	and eax, ebx

	mov edx, OFFSET msgResult	
	call WriteString
	call WriteHex	
	call Crlf

	popad	
	ret
AND_op ENDP


OR_op PROC

	pushad	

	mov edx, OFFSET msgOR	
	call WriteString	
	call Crlf
	call Crlf

	mov edx, OFFSET msgOperand1	
	call WriteString
	call ReadHex	
	mov ebx, eax	

	mov edx, OFFSET msgOperand2	
	call WriteString
	call ReadHex	

	or eax, ebx	

	mov edx, OFFSET msgResult	
	call WriteString
	call WriteHex
	call Crlf

	popad	
	ret
OR_op ENDP

;------------------------------------------------
NOT_op PROC

;------------------------------------------------
	pushad	

	mov edx, OFFSET msgNOT	
	call WriteString	
	call Crlf
	call Crlf

	mov edx, OFFSET msgOperand1	
	call WriteString
	call ReadHex	

	not eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex	
	call Crlf

	popad	
	ret
NOT_op ENDP

XOR_op PROC

	pushad

	mov edx, OFFSET msgXOR	
	call WriteString	
	call Crlf
	call Crlf

	mov edx, OFFSET msgOperand1	
	call WriteString
	call ReadHex	
	mov ebx, eax	

	mov edx, OFFSET msgOperand2	
	call WriteString
	call ReadHex	

	xor eax, ebx	

	mov edx, OFFSET msgResult	
	call WriteString
	call WriteHex	
	call Crlf

	popad	
	ret
XOR_op ENDP

;------------------------------------------------
ExitProgram PROC
	stc	
	ret
ExitProgram ENDP

END main