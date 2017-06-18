COMMENT!
6-11. 6-3-4절의  암호화 프로그램을 다음과 같은 방식으로 수정하라. 
사용자가 여러 문자로 구성된 암호화 키를 입력하게 한다. 
이 키를 사용하여 메세지의 대응되는  바이트에 대하여 키의 각 문자와 XOR 함으로써 
평문을 암호화하고 복호화 한다. 
모든 평문이 변환될 때까지 필요한 만큼 키를 여러번 반복하여 사용한다.
예를 들어서 키가 "ABXmv#7" 라면  다음과 같이 적용된다.
 Plain Text  :  This is a Plain...

key            :  ABXmv#7 ABXmv#7....
!

INCLUDE irvine32.inc
.data
.code

main PROC




exit
main ENDP
end main
