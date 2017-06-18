COMMENT!
6-9 화면에 텍스트를 출력하기 위해서 세개의 다른 색상 중에 임의로 색을 선택하는 프로그램을 작성하라.
루프를 사용하여 20줄의 텍스트를 출력하라. 각 색에 대한 선택 확률은  다음과 같다.
white=30%, blue=10%, green=60% 
힌트 : 0과 9사이의 난수 정수를 생성. 
생성된 정수가 0-2 사이면 white를 선택, 3이면 blue를 선택...
!


INCLUDE irvine32.inc
.data
msg BYTE "줄의 랜덤색깔이 출력됩니다.",0
.code
main PROC
	call ClrScr
	call Randomize	

	mov edx, OFFSET msg	
	mov ecx, 20	

L1:	call ChooseColor
	call SetTextColor
	call WriteString	
	call Crlf
	loop L1

	exit

main ENDP
ChooseColor PROC

	mov eax, 10	
	call RandomRange	
	.IF eax >= 4	
	  mov eax, green	
	.ELSEIF eax == 3	
	  mov eax, blue	
	.ELSE	
	  mov eax, white	
	.ENDIF

	ret

ChooseColor ENDP
end main
