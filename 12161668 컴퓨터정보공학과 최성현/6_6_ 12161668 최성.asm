COMMENT!
6-6 . 6-5의 연습문제에서 작성한 프로그램을 가지고 다음을 수행하는 
완전한 프로그램을 작성하라-
1. 루프를 사용하여 사용자가 성적평균과 점수를 계속하여 입력하게 하고 
평가 결과를 보게 한다. 성적 평균으로 0을 입력하면 루프를 멈춘다 
2. 사용자가 credits와 Grade average 를 입력할때 범위를 확인한다.  
Credits는 1과  30 사이어야 하고 Grade Average는 0과 4.0 시이어야 한다.
(실수 연산 사용)  어느 한 값이라도 범위를 벗어나면 적절한 오류 메세지 출력하라.
!
INCLUDE irvine32.inc
.data
str0 BYTE "에러: Credits은 반드시 1과 30 사이어야합니다. " ,0 
str1 BYTE "GradeAverage 을 입력하세요.    ",0
str2 BYTE "Credits은 다음과 같습니다.    ",0
str3 BYTE "에러: GradeAverage은 반드시 0.0과 4.0사이어야합니다.	",0
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
	 jz ExitMain	; 0이면 종료
	 call CheckRa
	 jc L2			;에러 표시
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
