COMMENT!
6-6 . 6-5�� ������������ �ۼ��� ���α׷��� ������ ������ �����ϴ� 
������ ���α׷��� �ۼ��϶�-
1. ������ ����Ͽ� ����ڰ� ������հ� ������ ����Ͽ� �Է��ϰ� �ϰ� 
�� ����� ���� �Ѵ�. ���� ������� 0�� �Է��ϸ� ������ ����� 
2. ����ڰ� credits�� Grade average �� �Է��Ҷ� ������ Ȯ���Ѵ�.  
Credits�� 1��  30 ���̾�� �ϰ� Grade Average�� 0�� 4.0 ���̾�� �Ѵ�.
(�Ǽ� ���� ���)  ��� �� ���̶� ������ ����� ������ ���� �޼��� ����϶�.
!
INCLUDE irvine32.inc
.data
str0 BYTE "����: Credits�� �ݵ�� 1�� 30 ���̾���մϴ�. " ,0 
str1 BYTE "GradeAverage �� �Է��ϼ���.    ",0
str2 BYTE "Credits�� ������ �����ϴ�.    ",0
str3 BYTE "����: GradeAverage�� �ݵ�� 0.0�� 4.0���̾���մϴ�.	",0
Credits DWORD ?
GradeAverage real4 ?
A real4 4.0
B real4 0.0
.code
main PROC
	fld A
	fld B

	call clrscr
	
L1:	 call Input 
	 jz ExitMain	; 0�̸� ����
	 call CheckRa
	 jc L2			;���� ǥ��
L2: call crlf
	jmp L1
	
	
ExitMain:
	call clrscr
	exit


main ENDP
;------------------------------------------
Input PROC
	pushad

	mov edx, OFFSET str1
	call WriteString
	call Readfloat
	FCOMI ST(0),ST(1)
	je Exit_proc
	Fld Gradeaverage
	call crlf

	mov edx,OFFSEt str3
	call writeString
	call Readint
	cmp eax,0
	je Exit_proc
	mov credits,eax
	call crlf

Exit_proc:
	popad
	ret
input ENDP



CheckRa PROC
	push edx

	cmp credits,1
	jl CreditsErr
	cmp credits,30
	jg CreditsErr

	FCOMi ST(0),ST(1)
	jl GradeErr
	FCOMi ST(0),ST(2)
	jg GradeErr
	clc
	jmp quit

CreditsErr:	
	mov edx,OFFSET str1
	call WriteString
	stc	
	jmp  quit

GradeErr:
	mov edx,OFFSET str3
	call WriteString
	stc		
	jmp  quit

quit:
	pop edx
	ret
CheckRa ENDP
;--------------------------------------------
end main
