highlight MACRO x, y ;; in this macro you just enter
local horizornight
local verticaldown
local vertical2
local horizonr2
mov CX,x
mov DX,y
mov AH,0CH
mov BH , 0
mov AL,0fh ;;Pixel color (1 or 0 for black and white)
add x, 21
horizornight: int 10h
inc cx
cmp cx,(x)
jnz horizornight

add y, 21d
verticaldown:int 10h
inc dx
cmp dx, y
jnz verticaldown

sub y,21d
sub x,21d
mov dx, y
mov cx,x
add x, 21
add y, 21d
vertical2:int 10h
inc dx
cmp dx, y
jnz vertical2
horizonr2: int 10h
inc cx
cmp cx,(x);; 
jnz horizonr2
sub y,21d
sub x,21d


endm
dehighlight MACRO x, y ;; in this macro you just enter
local horizornight
local verticaldown
local vertical2
local horizonr2
mov CX,x
mov DX,y
mov AH,0CH
mov BH , 1
mov AL,01h ;;Pixel color (1 or 0 for black and white)
add x, 21
horizornight: int 10h
inc cx
cmp cx,(x)
jnz horizornight

add y, 21d
verticaldown:int 10h
inc dx
cmp dx, y
jnz verticaldown

sub y,21d
sub x,21d
mov dx, y
mov cx,x
add x, 21
add y, 21d
vertical2:int 10h
inc dx
cmp dx, y
jnz vertical2
horizonr2: int 10h
inc cx
cmp cx,(x);; 
jnz horizonr2
sub y,21d
sub x,21d


endm



scanchar MACRO x,y

local here
local again
local addpixelv
local down
local up
local right
local right2 
local left

again:
    mov ah, 0h
    int 16h
    
   cmp ah,1Eh;;a
   je leftshift
   cmp ah,20h;;d
   je rightshift
   cmp ah,11h;;w
   je upshift
   cmp ah,1Fh;;s
   je downshift
  here:
   cmp x,144
 je right2
  highlight x,y
  
  
  
jmp again

   
 
   

 leftshift:;; shiffting left 
 
  cmp x,15
  jz here
  cmp x,14
  jz here
  cmp x,16
  jz here
 dehighlight x,y
  sub x, 21d
  cmp x,35;to adjust movement
  je left
   cmp x,34
  je left
  cmp x,33
  je left
  cmp x,37
  je left
   
  
  
jmp here
upshift:
  cmp y,15
  jz here
   cmp y,16
  jz here
  
dehighlight x,y
  sub y, 21d

  cmp y,58
  je subpixelv
 up:
  
jmp here
rightshift:

  cmp x,162d
  jz here
 cmp x,163d
  jz here
 cmp x,164d
  jz here
 
  dehighlight x,y
  add x, 21d
  cmp x, 120d
  je addpixelh

 right:  
  
jmp here
downshift:

  cmp y,163
  jz here
  
dehighlight x,y
  add y, 21d
  cmp y,99d
  je addpixelv
  down:
jmp here

addpixelv :
  add y,1d
  jmp down

  subpixelv :
  sub y,1d
  jmp up

  addpixelh:
  add x,1d 
  jmp right   
  right2:
  highlight x+1,y
  jmp again
  left :
  sub x,1
  jmp here
  
ENDM