COMMENT!
6-9 ȭ�鿡 �ؽ�Ʈ�� ����ϱ� ���ؼ� ������ �ٸ� ���� �߿� ���Ƿ� ���� �����ϴ� ���α׷��� �ۼ��϶�.
������ ����Ͽ� 20���� �ؽ�Ʈ�� ����϶�. �� ���� ���� ���� Ȯ����  ������ ����.
white=30%, blue=10%, green=60% 
��Ʈ : 0�� 9������ ���� ������ ����. 
������ ������ 0-2 ���̸� white�� ����, 3�̸� blue�� ����...
!


INCLUDE irvine32.inc
.data
msg BYTE "���� ���������� ��µ˴ϴ�.",0
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
