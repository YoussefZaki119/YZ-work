.Model large
.Stack 64
.Data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;main menu varables;;;;;;;;;;;;;;;;;;;;;;;;;;\
            ;mov AH,2Ch
            ; int 21h
    pawnwhiteFilename      DB  'pawnW.bin',0
    kingwhiteFilename      DB  'kingW.bin',0
    knightwhiteFilename    DB  'knightW.bin',0
    queenwhiteFilename     DB  'queenW.bin', 0
    rockwhiteFilename      DB  'rookW.bin', 0
    bishopwhiteFilename    DB  'bishop2.bin', 0
    pawnblackFilename      DB  'pawnB.bin',0
    kingblackFilename      DB  'kingB.bin',0
    knightblackFilename    DB  'knightB.bin',0
    queenblackFilename     DB  'queenB.bin', 0
    rockblackFilename      DB  'rookB.bin', 0
    bishopblackFilename    DB  'bishopB.bin',0 
    PowerFilename    DB  'power.bin',0

    checkQP  DB ?

FirstLine db 'Please Enter Your Name:',10,13,'$'    
ErrorInName db 10,13,'Sorry Sir, Please Enter Your Name Correctly:',10,13,'$'
    message1 db 'To Start Chatting press F1','$'
    message2 db 'To Start the game press F2','$'
    message3 db 'To end the program press ESC','$'
    message4 db '--------------------------------------------------------------------------------','$'
  
  blackchecmateMess db 'Black check mate','$'
  WhitechecmateMess db 'White check mate','$'
  nocheckMess       db '                ','$'
;first Line in defining usernames
 
 
MyBufferName LABEL BYTE
BufferSize db 17
ActualSize db ?
BufferData db 17 dup('$') 
; Buffer where the usernames are stored


  message5 db 'To Start Chatting press F1','$'
    message6 db 'To Start the game press F2','$'
    message7 db 'To end the program press ESC','$'
  P1msg db 'S:','$'
P2msg db 'R:','$'

   user1 DB "Adam:","$"
user2 DB "Gaser:","$" 
LineToStatusBar  DB "----------",'$'
MyBuffer label  Byte
BufferSize1 DB 90
ActualSize1 DB ?
BufferData1 DB 90 dup('$')

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;game variables;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BoardWidth      EQU 200
    BoardHeight     EQU 200
    BarWidth      EQU 100
    BarHeight     EQU 50
    KnightWidth EQU 20
    KnightHeight EQU 20
    PieceWidth EQU 20
    PieceHeight EQU 20

      arr Dw 64 dup(0)
    arrTime Dw 64 dup(0)
    offsetboardFilename dw ?
    existingOffset dw ?
    existingX dw 0
    existingY dw 0
    knockedoffset dw 0
    knockedX dw ?
    knockedY dw ?
    numberofknocked dw 0
    timeroffset dw ?

   highlightx1 dw 0    ;0
    highlighty1 dw 0    ;2
    highlightx2 dw 0    ;4
    highlighty2 dw 0
    highlightx3 dw 0
    highlighty3 dw 0
    highlightx4 dw 0
    highlighty4 dw 0
    highlightx5 dw 0
    highlighty5 dw 0
    highlightx6 dw 0
    highlighty6 dw 0
    highlightx7 dw 0
    highlighty7 dw 0
    highlightx8 dw 0
    highlighty8 dw 0
    highlightx9 dw 0
    highlighty9 dw 0
    highlightx10 dw 0
    highlighty10 dw 0
    highlightx11 dw 0
    highlighty11 dw 0
    highlightx12 dw 0
    highlighty12 dw 0
    highlightx13 dw 0
    highlighty13 dw 0
    highlightx14 dw 0
    highlighty14 dw 0
    highlightx15 dw 0
    highlighty15 dw 0
    highlightx16 dw 0
    highlighty16 dw 0
    highlightx17 dw 0
    highlighty17 dw 0
    highlightx18 dw 0
    highlighty18 dw 0
    highlightx19 dw 0
    highlighty19 dw 0
    highlightx20 dw 0
    highlighty20 dw 0
    highlightx21 dw 0
    highlighty21 dw 0
    highlightx22 dw 0
    highlighty22 dw 0
    highlightx23 dw 0
    highlighty23 dw 0
    highlightx24 dw 0
    highlighty24 dw 0
    highlightx25 dw 0
    highlighty25 dw 0
    highlightx26 dw 0
    highlighty26 dw 0
    highlightx27 dw 0
    highlighty27 dw 0

    row DB ?
    col DB ?
    indexOver2 DB ?
    index DW ?
    ;[r*8 + c ] *2 = index

   endgamemsgP1 db 'P1 is ','$'
   endgamemsgP2 db 'P2 is  ','$'
   Winner db 'Winner','$'
   TimerONmsg1 db 'Timer on  ','$'
   TimerONmsg2 db 'this','$'
   TimerONmsg3 db 'piece','$'
   TimerMsg db 'Timer','$'
    
    BoardFilename          DB  'Board.bin', 0    
    whiteBoxFilename    DB  'W.bin', 0
    blackBoxFilename    DB  'B.bin',0  
    timerFilename       DB  'timer.bin',0
    sbarFilename       DB  'sbar.bin',0

    BoardFilehandle DW  ?
    PieceFilehandle DW  ?
    

    BoardData       DB  BoardWidth*BoardHeight dup(0)
    
    PieceData       DB  PieceWidth*PieceHeight dup(0)
    sbarData       DB  BarWidth*BarHeight dup(0)


    
    wantedX            DW 100d
    wantedY            DW 100d
    tempx         dw 16d
    tempy         dw 16d

      x           dw 16d
      y           dw 16d
      x2           dw 163d
      y2           dw 163d
      xc          dw 0d
      yc          dw 0d
      xd          dw 0d
      yd          dw 0d
      xd2          dw 0d
      yd2          dw 0d
      indexSI     dw 0d
      timervar    db 0d
      WhoWins db 0d
      zikoknockedoffset DB 0
    LINE  DB 80 DUP('-'),'$'
    value db ?
    yposS db 1
    xposS db 0
    xposR db 0
    yposR db 0Eh
    timervar2 Dw 5d
    timervar3 dw 5d
    inlinexposp1 DB 1Eh
    inlinexposp2 DB 1Eh
    inlineyposp1 DB 14h
    inlineyposp2 DB 16h
.Code
entername macro;;;;; for entring name
   local WARRNING
    local FIRST
    local ContinueBeforeChecK
    ;;;;;;;;;;;;;;;; Text Mode
    
    MOV AH,0H
    MOV AL,3H
    INT 10H
    
    ;;;;;;;;;;;;;;;;
    JMP FIRST
    ;;;;;;;;;;;;;;;; WARRNING MESSAGE DUE TO WRONG NAME
    
    WARRNING:
    
            MOV BufferData,'$'
            MOV BufferData+1,'$'
            MOV BufferData+2,'$'
            MOV BufferData+3,'$'
            MOV BufferData+4,'$'
            MOV BufferData+5,'$'
            MOV BufferData+6,'$'
            MOV BufferData+7,'$'
            MOV BufferData+8,'$'
            MOV BufferData+9,'$'
            MOV BufferData+10,'$'
            MOV BufferData+11,'$'
            MOV BufferData+12,'$'
            MOV BufferData+13,'$'
            MOV BufferData+14,'$'
            MOV BufferData+15,'$'
            MOV BufferData+16,'$'
            MOV BufferData+17,'$'
            MOV AH,9        ;TO PRINT THE FIRST MESSAGE
            MOV DX,OFFSET ErrorInName
            INT 21H
    
    JMP ContinueBeforeCheck
    ;;;;;;;;;;;;;;;;;;
 
    FIRST:
         MOV AH,9        ;TO PRINT THE FIRST MESSAGE
         MOV DX,OFFSET FirstLine
         INT 21H
    ;;;;;;;;;;;;;;
    ContinueBeforeChecK:                    
                    
                                     
    ;;;;;;;;;;;;;; TO GET THE NAME FROM USER
    MOV AH,0AH
    MOV DX,OFFSET MyBufferName
    INT 21H    
    ;;;;;;;;;;;;;; 
    
    
    ;;;;;;;;;;;;;;TO CHECK THE FIRST CHARACTER IS LETTER
    
    CMP BufferData,41H
    JL WARRNING
    
    CMP BufferData,5AH
    JG WARRNING
    
    ;//////////TO GO TO SECOND LINE
    mov ah,2 
    MOV DL,13
    int 21h
        
    mov ah,2 
    MOV DL,10
    int 21h 
    ;
    
    ;;;;;;;;;;;;;;;; display the name to test
                    
                    
    mov dx, offset BufferData
    
    ;Display the input data in a new location
    
    mov ah, 9
    int 21h                
                    
endm               


clearStatusBar macro ;;;; to clear status bar
            mov ax,offset blackBoxFilename      ; delete timer icon
            mov timeroffset,ax
            DrawOne 220,170, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 220,160, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 230,170, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 230,160, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 240,170, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 240,160, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 260,170, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 280,170, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 280,160, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            DrawOne 260,160, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
endm 
chatmode macro;;;;;;to initialize chat mode in the main screen 
local exit
local check
local scrollS
local scrollR2
local scrollR1
local afterscroll
local progloop
local jumpreceive
local send
local newline
local cont
local recieve
local print
local newlineR
local contR
local AGAIN
local jumpsend
local afterscrollR
local printR
local fexit
local afterscrollS
TextMode1
 mov ax,3
  int 10h

 setCursor 0,0Ch
            
 mov ah, 9
 mov dx, offset LINE
 int 21h 
 
 setCursor 0,23
            
 mov ah, 9
 mov dx, offset LINE
 int 21h

setCursor   0,0  
ShowString user1 

setCursor   0,0Dh  
ShowString user2 

setCursor   0,1
jmp afterscroll 

scrollS:
mov ax,0600h
mov bh,07h
mov ch,1
mov cl,0
mov dh,0Bh
mov dl,4fh
int 10h
mov xposS,0
mov yposS,1
jmp far ptr afterscrollS

scrollR2:
mov ax,0600h
mov bh,07h
mov ch,0Eh
mov cl,0
mov dh,22
mov dl,4fh
int 10h
mov xposR,0
mov yposR,0Eh
jmp far ptr afterscrollR 

exit:
jmp far ptr fexit 

afterscroll:

progloop:   
 mov  ah,1                 ;check if a key is pressed
  int   16h
 jz  jumpreceive
 jnz   send
 send:       
 mov ah,0                 ;clear the keyboard buffer
int 16h
 mov value,al
 cmp al,1Bh
 je exit
 CMP al,0Dh               ; check if the key is enter
 jnz cont
jz  newline
jumpreceive:jmp recieve
 newline:    
 inc  yposS
mov xposS,0
cont: 
cmp yposS,0Bh
jae scrollS
afterscrollS:      
setCursor   xposS,yposS
print: 
mov ah,2
mov dl,value
int 21h
  
mov dx,3FDH
AGAIN:  
In  al , dx
test al , 00100000b
jz  recieve
mov dx , 3F8H
mov al,value
out dx , al
saveCursorS
jmp progloop
jumpsend: jmp send
recieve:     
mov         ah,1
int         16h
jnz         jumpsend

mov         dx , 3FDH
in          al , dx
test        al , 1
JZ          recieve

mov         dx , 03F8H
in          al , dx
mov         value,al

CMP         value,0Dh
JNZ         contR
JZ          newlineR
newlineR:   
inc         yposR
mov         xposR,0
contR:
cmp yposR,22
jae scrollR1
afterscrollR:       
setCursor   xposR,yposR
printR:    
mov         ah,2
 mov         dl,value
int         21h
saveCursorR
 jmp         progloop
 
scrollR1: jmp far ptr scrollR2            

fexit:

jmp ExitChat      

endm
saveCursorS MACRO
mov ah,3h
mov bh,0h
int 10h
mov xposS,dl
mov yposS,dh
ENDM saveCursorS  

saveCursorR MACRO
mov ah,3h
mov bh,0h
int 10h
mov xposR,dl
mov yposR,dh
ENDM saveCursorR 

setCursor MACRO x,y
mov ah,2
mov bh,0
mov dl,x
mov dh,y
int 10h
ENDM setCursor 

;;;;;;;;;;;;;;;;;;;;;;;; end of chatmode
;;;;;;;;;;;;;;;;;;;;;;;; beginning of main screen

TextMode1 macro ;;;;;; for text mode

    mov ah,0h
    mov al,03h
    int 10h 
endm


SetCourse macro ;;;;;; set cursor

mov ah,2 ;Move Cursor
int 10h

endm


ShowString macro msg;;;; To show string 
    mov ah, 9
    mov dx, offset msg;Display string
    int 21h
   
endm


Check MACRO;;; scan char enetered by keyboard in the main menu
   local here
   local chat
   local there
        MOV AH,0 ;INT 16,0 reads one key input
        INT 16h
        cmp ah,59d;f1
        jz chat
        jmp here
        chat: chatmode
        here: 
        cmp ah, 60d; f2
        jz startgame
        jmp there
        ;
        there: cmp ah, 1d; escape
        jz exprog


endm


DrawLineH MACRO y,x1,x2;;;;;;; drawing line as in the chatmode
    local DRAW2

    mov   cx,x1     ;Column
    mov   dx,y      ;Row
    mov   al,5      ;Pixel color 5
    mov   ah,0ch    ;Draw Pixel Command
    DRAW2:     int   10h
    inc   cx
    cmp   cx,x2
    jnz   DRAW2

ENDM
mainscreen macro;;;;; main screen before starting the game 
        mov ax,@data
        mov ds,ax
        entername
        setCourse
        TextMode1
        mov dx ,0A1Dh ;row col
        SetCourse
        ShowString message5
        mov dx ,0C1Dh ;row col
        SetCourse
        ShowString message6
        mov dx ,0E1Dh ;row col
        SetCourse
        ShowString message7
        mov dx,1500h
        setCourse
        ShowString message4
        Check
      endm

      mainscreen2 macro;;;;; main screen after finshing the game  whoever the winner
        
        
        TextMode1
        mov dx ,0A1Dh ;row col
        SetCourse
        ShowString message5
        mov dx ,0C1Dh ;row col
        SetCourse
        ShowString message6
        mov dx ,0E1Dh ;row col
        SetCourse
        ShowString message7
        mov dx,1500h
        setCourse
        ShowString message4
        Check
      endm


highlight MACRO x, y ;; in this macro you just enter coordinate of x, y to highlight it ((first player ))
local horizornight
local verticaldown
local vertical2
local horizonr2
mov CX,x
mov DX,y
mov AH,0CH
mov BH , 0
mov AL,0fh ;;Pixel color (1 or 0 for black and white)
add x, 20
horizornight: int 10h;;;; shift right
inc cx
cmp cx,(x)
jnz horizornight

add y, 20d
verticaldown:int 10h;;;; shift down
inc dx
cmp dx, y
jnz verticaldown

sub y,20d
sub x,20d
mov dx, y
mov cx,x
add x, 21
add y, 20d
vertical2:int 10h;;;;; shift up
inc dx
cmp dx, y
jnz vertical2
horizonr2: int 10h;;;; shift left
inc cx
cmp cx,(x);; 
jnz horizonr2
sub y,20d
sub x,21d
endm

highlight2 MACRO x, y ;; in this macro you just enter coordinate of x, y to highlight it ((second player))
local horizornight
local verticaldown
local vertical2
local horizonr2
mov CX,x
mov DX,y
mov AH,0CH
mov BH , 0
mov AL,4d ;;Pixel color green
add x, 20
horizornight: int 10h;;;; shift right
inc cx
cmp cx,(x)
jnz horizornight

add y, 20d
verticaldown:int 10h;;;; shift down
inc dx
cmp dx, y
jnz verticaldown

sub y,20d
sub x,20d
mov dx, y
mov cx,x
add x, 21
add y, 20d
vertical2:int 10h;;;;; shift up
inc dx
cmp dx, y
jnz vertical2
horizonr2: int 10h;;;;;;shift left
inc cx
cmp cx,(x);; 
jnz horizonr2
sub y,20d
sub x,21d
endm

highlightgreen MACRO xx, yy ;; this for highlighting the available movement for selected piece
local horizornightt
local verticaldownn
local vertical22
local horizonr22
local endhighlight
 cmp xx,00
 jz endhighlight
mov CX,xx
mov DX,yy
mov AH,0CH
mov BH , 0
mov AL,02h ;;grey color
add xx, 20
horizornightt: int 10h;;shift right
inc cx
cmp cx,(xx)
jnz horizornightt

add yy, 20d
verticaldownn:int 10h;;;; shift down
inc dx
cmp dx, yy
jnz verticaldownn

sub yy,20d
sub xx,20d
mov dx, yy
mov cx,xx
add xx, 21
add yy, 20d
vertical22:int 10h;;; shift up;;
inc dx
cmp dx, yy
jnz vertical22
horizonr22: int 10h;;;; shift left
inc cx
cmp cx,(xx);; 
jnz horizonr22
sub yy,20d
sub xx,21d
endhighlight:
endm

dehighlight MACRO x, y ;; this for deleting the frame around the piece
local horizornight
local verticaldown
local vertical2
local horizonr2
local EndDehighLight
cmp x,0
jz EndDehighLight
mov CX,x
mov DX,y
mov AH,0CH
mov BH , 1
mov AL,01h ;;Pixel color (1 or 0 for black and white)
add x, 20
horizornight: int 10h;;shift right
inc cx
cmp cx,(x)
jnz horizornight

add y, 20d
verticaldown:int 10h;;;; shift down
inc dx
cmp dx, y
jnz verticaldown

sub y,20d
sub x,20d
mov dx, y
mov cx,x
add x, 21
add y, 20d
vertical2:int 10h;;;; shift up
inc dx
cmp dx, y
jnz vertical2
horizonr2: int 10h;;;; shift  left
inc cx
cmp cx,(x);; 
jnz horizonr2
sub y,20d
sub x,21d
EndDehighLight:

endm
scanchar MACRO x1,y1;;;;;; this is for scanning movement of the player during the game
local befend
local PQ
local PP
local here
local here2
local again
local addpixelv
local addpixelh
local down
local up
local right
local right2 
local left
local leftshift
local rightshift
local upshift
local downshift
local leftshiftarrow
local rightshiftarrow
local upshiftarrow
local downshiftarrow
local subpixelv
local deletepiece
local exitmode
local sendkey
local KeyRev
local AGAIN1
local RecieveZ
local sendz 
local aftersend
local Chattinginline
local jumpreceive
local send
local recieve
local print
local AGAINchat
local fINLINEexit
local printR
local jumpsend
local contchat
LOCAL progloop
local afterchat
mov ax,x
mov tempx,ax
mov ax,y
mov tempy,ax
mov ax,0
again:
                                 RecieveZ:
                                    mov dx , 3FDH		; Line Status Register
                                   	in al , dx 
  		                              AND al , 1
  		                              JZ sendz
                                    mov dx , 03F8H
  		                              in al , dx 
  		                              mov ah , al
                                    jmp aftersend

 sendz: 
  mov dx , 3FDH		; Line Status Register
	In al , dx 			;Read Line Status
  AND al , 00100000b
  JZ RecieveZ                                  
  mov ah,1
  int 16h
  JZ RecieveZ
  mov ah,0
  int 16h
  mov dx , 3F8H		; Transmit data register
  mov  al,ah
  out dx , al 
  aftersend:
 
 cmp ah,01;;; if you press the ESC the game will stop and there will no available movement as program ended
 jz exprog


 ;;;;;;;;;;;;;;;;;;;
 cmp ah,4bh;;left
   je leftshiftarrow
   cmp ah,4dh;;right
   je rightshiftarrow
   cmp ah,48h;;up
   je upshiftarrow
   cmp ah,50h;;down
   je downshiftarrow
   cmp ah,19h;;p
   je PP
  
 ;;;
   cmp ah,1Eh;;a
   je leftshift
   cmp ah,20h;;d
   je rightshift
   cmp ah,11h;;w
   je upshift
   cmp ah,1Fh;;s
   je downshift
   cmp ah,16d;;q
   je PQ
   cmp ah,3fh;;f5
   je Chattinginline
  here:
  highlight x,y
jmp again
 here2:
  highlight2 x2,y2
jmp again
 ;;;;;;;;;;;;;;;;; shifting left ;;;;;;;;;;;;;;;;;
 leftshift:
  cmp x,16
  jz here
 dehighlight x,y
  sub x, 21d
jmp here;;;
leftshiftarrow:
cmp x2,16
  jz here
 dehighlight x2,y2
  sub x2, 21d
jmp here2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end of shifting left;;;;;;;;;;;;;;;;;;

 ;;;;;;;;;;;;;;;;; shifting up ;;;;;;;;;;;;;;;;;
upshift:
   cmp y,16
  jz here
dehighlight x,y
  sub y, 21d
jmp here;;
upshiftarrow:
   cmp y2,16
  jz here
dehighlight x2,y2
  sub y2, 21d
jmp here2;;;;
 ;;;;;;;;;;;;;;;;; end of shifting up ;;;;;;;;;;;;;;;;;


  ;;;;;;;;;;;;;;;;; shifting right ;;;;;;;;;;;;;;;;;
rightshift:
 cmp x,163d
  jz here
  dehighlight x,y
  add x, 21d  
jmp here;;;;;;;
rightshiftarrow:
cmp x2,163d
  jz here
  dehighlight x2,y2
  add x2, 21d  
jmp here2;;;;;;;
 ;;;;;;;;;;;;;;;;; end of shifting right ;;;;;;;;;;;;;;;;;

 ;;;;;;;;;;;;;;;;; shiffting down ;;;;;;;;;;;;;;;;;
downshift:
  cmp y,163
  jz here
dehighlight x,y
  add y, 21d
jmp here;;;;;
downshiftarrow:
  cmp y2,163
  jz here
dehighlight x2,y2
  add y2, 21d
jmp here2;;;;;;
 ;;;;;;;;;;;;;;;;; end of shifting down ;;;;;;;;;;;;;;;;;
  PQ:;;;; after pressing Q
  mov cx, x;
  mov xd,cx;
  mov dx,y;
  mov yd,dx;
   mov tempx,cx
   mov tempy,dx
   mov checkQP,1
  scandelete
jmp befend
  PP:;;;;; after pressing P
  mov cx, x2;
  mov xd2,cx;
  mov dx,y2;
  mov yd2,dx;
  mov ax,x2
  mov x,ax
  mov ax,y2
  mov y,ax
  mov checkQP,2

  
  scandelete2
  JMP afterchat
  
  Chattinginline:
            mov inlinexposp1,1Eh
            mov inlineyposp1,14h 
            mov inlinexposp2,1Eh
            mov inlineyposp2,16h 
            mov al,0
            mov ah,2
            mov dx,141Ch  
            int 10h
            mov dx, offset P1msg
            mov ah, 9
            int 21h
             
            
             mov al,0
            mov ah,2
            mov dx,161Ch  
            int 10h
            mov dx, offset P2msg
             mov ah, 9
            int 21h

progloop:
 mov  ah,1                 ;check if a key is pressed
 int   16h
 jz  jumpreceive
  send:
 mov ah,0                 ;clear the keyboard buffer
 int 16h
 mov value,al
 cmp al,31h
 je fINLINEexit
 jnz contchat
jumpreceive:jmp recieve
contchat: 
setCursor   inlinexposp1,inlineyposp1
print: 
mov ah,2
mov dl,value
int 21h
inc inlinexposp1
  
mov dx,3FDH
In  al , dx
test al , 00100000b
jz  recieve
mov dx , 3F8H
mov al,value
out dx , al
saveCursorS
jmp progloop
jumpsend: jmp send
recieve:     
mov         ah,1
int         16h
jnz         jumpsend

mov         dx , 3FDH
in          al , dx
test        al , 1
JZ          recieve


mov         dx , 03F8H
in          al , dx
mov         value,al
    
setCursor   inlinexposp2,inlineyposp2
printR:    
mov         ah,2
 mov         dl,value
int         21h
inc inlinexposp2
saveCursorR
 jmp         progloop
  

fINLINEexit:
clearStatusBar
jmp again

afterchat: 

befend:



           
  
  
ENDM


 


scandelete macro ;;;;;;; to delete the piece old position

cmp ah,16d;;q
deletep xd, yd
endm
scandelete2 macro ;;;;;;; to delete the piece old position
cmp ah,19h;;p
deletep xd2, yd2
endm

deletep  MACRO x, y ;; in this macro you just enter x,y of the piece youh to delete
local colcount

add x,1;; to adjust the color of drawing 
add y,2;; to adjust the color of drawing 

   ; set it!
   mov ah,0Dh
mov cx,x
mov dx,y
int 10H ; AL = COLOR
;;;;;;; now we have got the color of the pixel(blue or black);;;;;;;;;;
sub x,1;;;;;;to return of the original position of the piece
sub y,2;;;;;;to return of the original position of the piece
mov cx, x  ;col
mov xc, cx;;;;; storing temporary position of cx in xc as there will be loop in the following lines
mov dx, y  ;row
mov yc, dx;;;;;; storing temporary postion of the dx in yc as  there will be operation in the followning lines  
mov dx, y
mov ah, 0ch ; put pixel
mov BH , 0

add x,21;;;;; to draw the square 
add y,21;l;;;; to draw square
colcount:int 10h
inc cx
cmp cx, x
JNE colcount

mov cx, xc ; reset to start of col
inc dx      ;next row
cmp dx, y
JNE colcount
sub x, 21;
sub y,21



endm
DrawOne MACRO x,y,filehandle,offsetfilename,DataName,Width,height;;;; this macro that is responsible for drawing
;;;; it takes coordinates (x,y), file handle, name, offset in array , width and height
            local drawLoop
            local jumplol
            local tp
            
                ;pusha 4elnahom 34an 3adad el qeta3
               
	
              MOV  AH, 3Dh
              MOV  AL, 0     
              mov DX,offsetfilename                       ; read only
              
              INT  21h
    
    ; you should check carry flag to make sure it worked correctly
    ; carry = 0 -> successful , file handle -> AX
    ; carry = 1 -> failed , AX -> error code
     
              MOV  [filehandle], AX

              MOV  AH,3Fh
              MOV  BX, [filehandle]
              MOV  CX,Width*height    ; number of bytes to read
              LEA  DX, DataName
              INT  21h
	
              LEA  BX , DataName                 ; BL contains index at the current drawn pixel
	
              MOV  CX,x
              MOV  DX,y
              MOV  AH,0ch
	
    ; Drawing loop
    drawLoop : 
              MOV  AL,[BX]
              cmp al,47
              jz tp
              cmp al,46
              jz tp
              cmp al,2
              jz tp
              cmp al,3
              jz tp
              cmp al,22
              jz tp
              cmp al,118
              jz tp
              cmp al,119
              jz tp
              cmp al,120
              jz tp
              cmp al,155
              jz tp
              cmp al,150
              jz tp
              cmp al,151
              jz tp
              cmp al,114
              jz tp
              cmp al,121
              jz tp
              cmp al,77
              jz tp
              INT  10h
              tp:
             
              INC  CX
              INC  BX
              CMP  CX,Width+x
              JNE  drawLoop
	
              MOV  CX , 0+x
              INC  DX
              CMP  DX , height+y
              JNE  drawLoop
MOV  AH, 3Eh
              MOV  BX, [filehandle]

              INT  21h
	
             ; popa  4elnahom 34an 3adad el qeta3
ENDM
MAIN PROC FAR;;;;; the start of the main program 
              MOV  AX , @DATA
              MOV  DS , AX      
                    mov dx,3FbH         
                    mov al,10000000b
                    out dx,al

                    mov dx,3f8h
                    mov al,0ch
                    out dx,al

                    mov dx,3f9h
                    mov al,00h
                    out dx,al

                    ;configuration
                    mov dx,3fbh
                    mov al,00011011b
                    out dx,al
                   
              mainscreen
               startgame:

              MOV  AH, 0;;;; initalizing program for graphics mode
              
              MOV  AL, 13h
              INT  10h
               ;;;;;;;;; the beginning of array that contain all pieces of the game
              mov bx, offset boardFilename
             mov offsetBoardFilename,bx

             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;black pieces;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             mov bx, offset rockblackFilename
             mov arr,bx
             mov bx, offset knightblackFilename
             mov arr[2],bx
             mov bx, offset bishopblackFilename
             mov arr[4],bx
             mov bx, offset queenblackFilename
             mov arr[6],bx
             mov bx, offset kingblackFilename
             mov arr[8],bx
             mov bx, offset bishopblackFilename
             mov arr[10],bx
             mov bx, offset knightblackFilename
             mov arr[12],bx
              mov bx, offset rockblackFilename
             mov arr[14],bx

             mov bx, offset pawnblackFilename
             mov arr[16],bx
             mov bx, offset pawnblackFilename
             mov arr[18],bx
             mov bx, offset pawnblackFilename
             mov arr[20],bx
             mov bx, offset pawnblackFilename
             mov arr[22],bx
             mov bx, offset pawnblackFilename
             mov arr[24],bx
             mov bx, offset pawnblackFilename
             mov arr[26],bx
             mov bx, offset pawnblackFilename
             mov arr[28],bx
             mov bx, offset pawnblackFilename
             mov arr[30],bx
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;white pieces;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
             mov bx, offset pawnwhiteFilename
             mov arr[96],bx
             mov bx, offset pawnwhiteFilename
             mov arr[98],bx
             mov bx, offset pawnwhiteFilename
             mov arr[100],bx
             mov bx, offset pawnwhiteFilename
             mov arr[102],bx
             mov bx, offset pawnwhiteFilename
             mov arr[104],bx
             mov bx, offset pawnwhiteFilename
             mov arr[106],bx
             mov bx, offset pawnwhiteFilename
             mov arr[108],bx
             mov bx, offset pawnwhiteFilename
             mov arr[110],bx

             mov bx, offset rockwhiteFilename
             mov arr[112],bx
             mov bx, offset knightwhiteFilename
             mov arr[114],bx
             mov bx, offset bishopwhiteFilename
             mov arr[116],bx
             mov bx, offset queenwhiteFilename
             mov arr[118],bx
             mov bx, offset kingwhiteFilename
             mov arr[120],bx
             mov bx, offset bishopwhiteFilename
             mov arr[122],bx
             mov bx, offset knightwhiteFilename
             mov arr[124],bx
             mov bx, offset rockwhiteFilename
             mov arr[126],bx


             mov bx, offset PowerFilename  ;power
             mov arr[64],bx

               
              jmp first;;;;;; this jmp is responsible for drawing the pieces and board on the screen

              downleftblackcheckmate:
               cmp di,112
              jz afterblackcheckdownleft

              add di,14
              cmp arr[di],offset bishopwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz downleftblackcheckmate
              jmp afterblackcheckdownleft


              downrightblackcheckmate:
               cmp di,126
              jz afterblackcheckdownright

              add di,18
              cmp arr[di],offset bishopwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz downrightblackcheckmate
              jmp afterblackcheckdownright

               upleftblackcheckmate:
              cmp di,0
              jz afterblackcheckupleft

              sub di,18
              cmp arr[di],offset bishopwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz upleftblackcheckmate
              jmp afterblackcheckupleft

              uprightblackcheckmate:
              cmp di,14
              jz afterblackcheckupright

              sub di,14
              cmp arr[di],offset bishopwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz uprightblackcheckmate
              jmp afterblackcheckupright

              downblackcheckmate:
              cmp di,112
              jz afterblackcheckdown
              cmp di,114
              jz afterblackcheckdown
              cmp di,116
              jz afterblackcheckdown
              cmp di,118
              jz afterblackcheckdown
              cmp di,120
              jz afterblackcheckdown
              cmp di,122
              jz afterblackcheckdown
              cmp di,124
              jz afterblackcheckdown
              cmp di,126
              jz afterblackcheckdown

              add di,16
              cmp arr[di],offset queenwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],offset rockwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz downblackcheckmate
              jmp afterblackcheckdown

              upblackcheckmate:
                cmp di,0
              jz afterblackcheckup
              cmp di,2
              jz afterblackcheckup
              cmp di,4
              jz afterblackcheckup
              cmp di,6
              jz afterblackcheckup
              cmp di,8
              jz afterblackcheckup
              cmp di,10
              jz afterblackcheckup
              cmp di,12
              jz afterblackcheckup
              cmp di,14
              jz afterblackcheckup

              sub di,16
              cmp arr[di],offset queenwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],offset rockwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz upblackcheckmate
              jmp afterblackcheckup

              leftblackcheckmate:
              cmp di,0
              jz afterblackcheckleft
              cmp di,16
              jz afterblackcheckleft
              cmp di,32
              jz afterblackcheckleft
              cmp di,48
              jz afterblackcheckleft
              cmp di,64
              jz afterblackcheckleft
              cmp di,80
              jz afterblackcheckleft
              cmp di,96
              jz afterblackcheckleft
              cmp di,112
              jz afterblackcheckleft

              sub di,2
              cmp arr[di],offset queenwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],offset rockwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz leftblackcheckmate
              jmp afterblackcheckleft


              rightblackcheckmate:
              cmp di,14
              jz afterblackcheckright
              cmp di,30
              jz afterblackcheckright
              cmp di,46
              jz afterblackcheckright
              cmp di,62
              jz afterblackcheckright
              cmp di,78
              jz afterblackcheckright
              cmp di,94
              jz afterblackcheckright
              cmp di,110
              jz afterblackcheckright
              cmp di,126
              jz afterblackcheckright

              add di,2
              cmp arr[di],offset queenwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],offset rockwhiteFilename
              jz displayblackcheckmate
              cmp arr[di],0
              jz rightblackcheckmate
              jmp afterblackcheckright


            blackindexinDI:
            cmp arr[di+14],offset pawnwhiteFilename
            jz displayblackcheckmate
            cmp arr[di+18],offset pawnwhiteFilename
            jz displayblackcheckmate
            cmp arr[di+16],offset kingwhiteFilename
            jz displayblackcheckmate
            cmp arr[di-16],offset kingwhiteFilename
            jz displayblackcheckmate
            cmp arr[di+2],offset kingwhiteFilename
            jz displayblackcheckmate
            cmp arr[di-2],offset kingwhiteFilename
            jz displayblackcheckmate

             cmp arr[di-30],offset knightwhiteFilename
            jz displayblackcheckmate
            cmp arr[di-12],offset knightwhiteFilename
            jz displayblackcheckmate
            cmp arr[di+20],offset knightwhiteFilename
            jz displayblackcheckmate
            cmp arr[di+34],offset knightwhiteFilename
            jz displayblackcheckmate
            cmp arr[di-34],offset knightwhiteFilename
            jz displayblackcheckmate
            cmp arr[di-20],offset knightwhiteFilename
            jz displayblackcheckmate
            cmp arr[di+12],offset knightwhiteFilename
            jz displayblackcheckmate
            cmp arr[di+30],offset knightwhiteFilename
            jz displayblackcheckmate


            mov dx,di
            jmp rightblackcheckmate
            afterblackcheckright:
            mov di,dx
            jmp leftblackcheckmate
            afterblackcheckleft:
            mov di,dx
            jmp upblackcheckmate
            afterblackcheckup:
            mov di,dx
            jmp downblackcheckmate
            afterblackcheckdown:
            mov di,dx
             jmp uprightblackcheckmate
            afterblackcheckupright:
            mov di,dx
            jmp upleftblackcheckmate
            afterblackcheckupleft:
            mov di,dx
            jmp downrightblackcheckmate
            afterblackcheckdownright:
            mov di,dx
            jmp downleftblackcheckmate
            afterblackcheckdownleft:
            mov di,dx

            jmp aftercheckforblackcheckmate

            checkforblackcheckmate:
            ;get si index of the king in array
            mov cx,63
            mov di,0
            getindexoftheblackking:
            cmp arr[di],offset kingblackFilename
            jz blackindexinDI
            add di,2
            dec cx
            jnz getindexoftheblackking


            
            displayblackcheckmate:
            mov ah,2
            mov dx,0000
            int 10h;; cursor at 0,0
            mov ah, 9
            mov dx, offset blackchecmateMess
            int 21h
            jmp aftercheckforblackcheckmate

            
              downleftwhitecheckmate:
               cmp di,112
              jz afterwhitecheckdownleft

              add di,14
              cmp arr[di],offset bishopblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz downleftwhitecheckmate
              jmp afterwhitecheckdownleft


              downrightwhitecheckmate:
               cmp di,126
              jz afterwhitecheckdownright

              add di,18
              cmp arr[di],offset bishopblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz downrightwhitecheckmate
              jmp afterwhitecheckdownright

               upleftwhitecheckmate:
              cmp di,0
              jz afterwhitecheckupleft

              sub di,18
              cmp arr[di],offset bishopblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz upleftwhitecheckmate
              jmp afterwhitecheckupleft

              uprightwhitecheckmate:
              cmp di,14
              jz afterwhitecheckupright

              sub di,14
              cmp arr[di],offset bishopblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz uprightwhitecheckmate
              jmp afterwhitecheckupright

              downwhitecheckmate:
              cmp di,112
              jz afterwhitecheckdown
              cmp di,114
              jz afterwhitecheckdown
              cmp di,116
              jz afterwhitecheckdown
              cmp di,118
              jz afterwhitecheckdown
              cmp di,120
              jz afterwhitecheckdown
              cmp di,122
              jz afterwhitecheckdown
              cmp di,124
              jz afterwhitecheckdown
              cmp di,126
              jz afterwhitecheckdown

              add di,16
              cmp arr[di],offset queenblackFilename
              jz displaywhitecheckmate
              cmp arr[di],offset rockblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz downwhitecheckmate
              jmp afterwhitecheckdown

              upwhitecheckmate:
                cmp di,0
              jz afterwhitecheckup
              cmp di,2
              jz afterwhitecheckup
              cmp di,4
              jz afterwhitecheckup
              cmp di,6
              jz afterwhitecheckup
              cmp di,8
              jz afterwhitecheckup
              cmp di,10
              jz afterwhitecheckup
              cmp di,12
              jz afterwhitecheckup
              cmp di,14
              jz afterwhitecheckup

              sub di,16
              cmp arr[di],offset queenblackFilename
              jz displaywhitecheckmate
              cmp arr[di],offset rockblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz upwhitecheckmate
              jmp afterwhitecheckup

              leftwhitecheckmate:
              cmp di,0
              jz afterwhitecheckleft
              cmp di,16
              jz afterwhitecheckleft
              cmp di,32
              jz afterwhitecheckleft
              cmp di,48
              jz afterwhitecheckleft
              cmp di,64
              jz afterwhitecheckleft
              cmp di,80
              jz afterwhitecheckleft
              cmp di,96
              jz afterwhitecheckleft
              cmp di,112
              jz afterwhitecheckleft

              sub di,2
              cmp arr[di],offset queenblackFilename
              jz displaywhitecheckmate
              cmp arr[di],offset rockblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz leftwhitecheckmate
              jmp afterwhitecheckleft


              rightwhitecheckmate:
              cmp di,14
              jz afterwhitecheckright
              cmp di,30
              jz afterwhitecheckright
              cmp di,46
              jz afterwhitecheckright
              cmp di,62
              jz afterwhitecheckright
              cmp di,78
              jz afterwhitecheckright
              cmp di,94
              jz afterwhitecheckright
              cmp di,110
              jz afterwhitecheckright
              cmp di,126
              jz afterwhitecheckright

              add di,2
              cmp arr[di],offset queenblackFilename
              jz displaywhitecheckmate
              cmp arr[di],offset rockblackFilename
              jz displaywhitecheckmate
              cmp arr[di],0
              jz rightwhitecheckmate
              jmp afterwhitecheckright


            whiteindexinDI:
            cmp arr[di-14],offset pawnblackFilename
            jz displaywhitecheckmate
            cmp arr[di-18],offset pawnblackFilename
            jz displaywhitecheckmate
            cmp arr[di+16],offset kingblackFilename
            jz displaywhitecheckmate
            cmp arr[di-16],offset kingblackFilename
            jz displaywhitecheckmate
            cmp arr[di+2],offset kingblackFilename
            jz displaywhitecheckmate
            cmp arr[di-2],offset kingblackFilename
            jz displaywhitecheckmate

             cmp arr[di-30],offset knightblackFilename
            jz displaywhitecheckmate
            cmp arr[di-12],offset knightblackFilename
            jz displaywhitecheckmate
            cmp arr[di+20],offset knightblackFilename
            jz displaywhitecheckmate
            cmp arr[di+34],offset knightblackFilename
            jz displaywhitecheckmate
            cmp arr[di-34],offset knightblackFilename
            jz displaywhitecheckmate
            cmp arr[di-20],offset knightblackFilename
            jz displaywhitecheckmate
            cmp arr[di+12],offset knightblackFilename
            jz displaywhitecheckmate
            cmp arr[di+30],offset knightblackFilename
            jz displaywhitecheckmate


            mov dx,di
            jmp rightwhitecheckmate
            afterwhitecheckright:
            mov di,dx
            jmp leftwhitecheckmate
            afterwhitecheckleft:
            mov di,dx
            jmp upwhitecheckmate
            afterwhitecheckup:
            mov di,dx
            jmp downwhitecheckmate
            afterwhitecheckdown:
            mov di,dx
             jmp uprightwhitecheckmate
            afterwhitecheckupright:
            mov di,dx
            jmp upleftwhitecheckmate
            afterwhitecheckupleft:
            mov di,dx
            jmp downrightwhitecheckmate
            afterwhitecheckdownright:
            mov di,dx
            jmp downleftwhitecheckmate
            afterwhitecheckdownleft:
            mov di,dx

            jmp aftercheckforwhitecheckmate

            checkforwhitecheckmate:
            ;get si index of the king in array
            mov cx,63
            mov di,0
            getindexofthewhiteking:
            cmp arr[di],offset kingwhiteFilename
            jz whiteindexinDI
            add di,2
            dec cx
            jnz getindexofthewhiteking


            
            displaywhitecheckmate:
            mov ah,2
            mov dx,0000
            int 10h;; cursor at 0,0
            mov ah, 9
            mov dx, offset WhitechecmateMess
            int 21h
            jmp aftercheckforwhitecheckmate

            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Tarek
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;begin of rook logic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;this are the validation of the movement of the rock black
            editrookdown:;; down shifting of the rook
            mov ax,existingX
            mov cx,existingY
            loadRkD: 
            ;;;;;;;;;; checking if the pieces are black in order not hightlight them
            cmp arr[di],offset pawnblackFilename
            jz aftereditrookdown
            cmp arr[di],offset kingblackFilename
            jz aftereditrookdown
            cmp arr[di],offset knightblackFilename
            jz aftereditrookdown
            cmp arr[di],offset queenblackFilename
            jz aftereditrookdown
            cmp arr[di],offset rockblackFilename
            jz aftereditrookdown
             cmp arr[di],offset bishopblackFilename
            jz aftereditrookdown
            
            cmp cx,163;;; at the down corner of the screen so there must be no highlight
            jGE aftereditrookdown
            
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI;;checking for the white pieces  in order to highlight  the first piece in its wat of 
            ;;; highlighting
            cmp arr[di],offset pawnwhiteFilename
            jz   aftereditrookdown
            cmp arr[di],offset kingwhiteFilename
            jz  aftereditrookdown
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookdown
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookdown
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookdown
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookdown
            mov di,indexSI
            add di,16
            mov indexSI,di

            jmp loadRKD
            ;;;;;;;;;;;;;;;;;;;;;

            editrookleft:;;;;; left shift of the rook
            mov ax,existingX
            mov cx,existingY
            loadRKL:;;; checking the black pieces     
            cmp arr[di],offset pawnblackFilename
            jz aftereditrookleft
            cmp arr[di],offset kingblackFilename
            jz aftereditrookleft
            cmp arr[di],offset knightblackFilename
            jz aftereditrookleft
            cmp arr[di],offset queenblackFilename
            jz aftereditrookleft
            cmp arr[di],offset rockblackFilename
            jz aftereditrookleft
             cmp arr[di],offset bishopblackFilename
            jz aftereditrookleft
            cmp ax,16;;; at the left corner of the screen 
            jBE aftereditrookleft
          
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            
            mov highlightx1[bx],cx
            inc bx 
            inc bx
            mov di,indexSI
            ;;;;; checking the white pieces
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditrookleft
            cmp arr[di],offset kingwhiteFilename
            jz aftereditrookleft
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookleft
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookleft
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookleft
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookleft
            mov di,indexSI
            sub di,2
            js loadRKL
             mov indexSI,di
            jmp loadRKL   

            ;;;;;;;;;;;;;;;;;;;;;;
            editrookright:;;;;; right shift of the rook
            mov ax,existingX
            mov cx,existingY
            loadSQR:;;;;; checking the black pieces
             cmp arr[di],offset pawnblackFilename
            jz aftereditrookright
            cmp arr[di],offset kingblackFilename
            jz aftereditrookright
            cmp arr[di],offset knightblackFilename
            jz aftereditrookright
            cmp arr[di],offset queenblackFilename
            jz aftereditrookright
            cmp arr[di],offset rockblackFilename
            jz aftereditrookright
            cmp arr[di],offset bishopblackFilename
            jz aftereditrookright
            cmp ax,163;;;at right corner of the screen
            jGE aftereditrookright
          
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI;;;checking white pieces
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditrookright
            cmp arr[di],offset kingwhiteFilename
            jz aftereditrookright
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookright
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookright
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookright
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookright
            mov di,indexSI
            add di,2
            
            mov indexSI,di
            jmp loadSQR
         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            editrookup:;;;; up shift rook
            mov ax,existingX
            mov cx,existingY
            loadRKU:;;;;; checking black pieces
            cmp arr[di],offset pawnblackFilename
            jz aftereditrookup
            cmp arr[di],offset kingblackFilename
            jz aftereditrookup
            cmp arr[di],offset knightblackFilename
            jz aftereditrookup
            cmp arr[di],offset queenblackFilename
            jz aftereditrookup
            cmp arr[di],offset rockblackFilename
            jz aftereditrookup
             cmp arr[di],offset bishopblackFilename
            jz aftereditrookup
            
            cmp cx,16;;;; at the upper corner in  the screen 
            jBE aftereditrookup
            
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
               mov di,indexSI;;;; checking the white pieces
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditrookup
            cmp arr[di],offset kingwhiteFilename
            jz aftereditrookup
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookup
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookup
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookup
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookup
            mov di,indexSI
            sub di,16
            mov indexSI,di
            jmp loadRKU

            greenarearookblack: ;;; label that i scalle d to begin the validation of movement of the black rook
         
          push di
            mov bx,0
            mov indexSI,si
            mov di,indexSI
            add di,16
            mov indexSI,di
            ;;;;checking  if there is white or free space in the following lines a
            ;;;; down validation
            cmp arr[si+16],0
            jz editrookdown
            cmp arr[si+16], offset kingwhiteFilename
            jz editrookdown
            cmp arr[si+16], offset pawnwhiteFilename
            jz editrookdown
            cmp arr[si+16], offset queenwhiteFilename
            jz editrookdown
            cmp arr[si+16], offset knightwhiteFilename
            jz editrookdown
            cmp arr[si+16], offset rockwhiteFilename
            jz editrookdown
           cmp arr[si+16], offset bishopwhiteFilename
            jz editrookdown
            aftereditrookdown:
             mov indexSI,si
            mov di,indexSI
            sub di,2
            mov indexSI,di
            ;;;;;;;;;;;;;left validation
            cmp arr[si-2],0
             jz editrookleft
             cmp arr[si-2],offset kingwhiteFilename
             jz editrookleft
               cmp arr[si-2],offset bishopwhiteFilename
             jz editrookleft
              cmp arr[si-2],offset queenwhiteFilename
             jz editrookleft
              cmp arr[si-2],offset pawnwhiteFilename
             jz editrookleft
              cmp arr[si-2],offset knightwhiteFilename
             jz editrookleft
              cmp arr[si-2],offset rockwhiteFilename
             jz editrookleft
             aftereditrookleft:
            mov indexSI,si
            mov di,indexSI
            add di,2
            mov indexSI,di
;;;;;;;;;;;;;;;;;;;;;right validation
            cmp arr[si+2],0
            jz editrookright
              cmp arr[si+2],offset kingwhiteFilename
             jz editrookright
               cmp arr[si+2],offset bishopwhiteFilename
             jz editrookright
              cmp arr[si+2],offset queenwhiteFilename
             jz editrookright
              cmp arr[si+2],offset pawnwhiteFilename
             jz editrookright
              cmp arr[si+2],offset knightwhiteFilename
             jz editrookright
              cmp arr[si+2],offset rockwhiteFilename
             jz editrookright
             aftereditrookright:
             mov indexSI,si
            mov di,indexSI
            sub di,16
            mov indexSI,di
;;;;;;;;;;;;;;;;;up validation
            cmp arr[si-16],0
             jz editrookup
             cmp arr[si-16],offset kingwhiteFilename
             jz editrookup
              cmp arr[si-16],offset bishopwhiteFilename
             jz editrookup
              cmp arr[si-16],offset queenwhiteFilename
             jz editrookup
              cmp arr[si-16],offset pawnwhiteFilename
             jz editrookup
              cmp arr[si-16],offset knightwhiteFilename
             jz editrookup
              cmp arr[si-16],offset rockwhiteFilename
             jz editrookup
             
             aftereditrookup:
             ;;;;;;;;;;;drawing frames
            aftereditingrookblack:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            highlightgreen highlightx9, highlighty9
            highlightgreen highlightx10, highlighty10
            highlightgreen highlightx11, highlighty11
            highlightgreen highlightx12, highlighty12
            highlightgreen highlightx13, highlighty13
            highlightgreen highlightx14, highlighty14
            jmp line1242

              editrookdownw:;; down shifting of the rook same as above comments of black rock
            mov ax,existingX
            mov cx,existingY
            loadRkDw:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditrookdownw
            cmp arr[di],offset kingwhiteFilename
            jz aftereditrookdownw
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookdownw
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookdownw
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookdownw
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookdownw 
            
            cmp cx,163
            jGE aftereditrookdownw
            
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
             mov di,indexSI
             cmp arr[di], offset kingblackFilename
            jz aftereditrookdownw
            cmp arr[di], offset pawnblackFilename
            jz aftereditrookdownw
            cmp arr[di], offset queenblackFilename
            jz aftereditrookdownw
            cmp arr[di], offset knightblackFilename
            jz aftereditrookdownw
            cmp arr[di], offset rockblackFilename
            jz aftereditrookdownw
           cmp arr[di], offset bishopblackFilename
            jz aftereditrookdownw
             mov di,indexSI
            add di,16
            mov indexSI,di
            jmp loadRKDw
            ;;;;;;;;;;;;;;;;;;;;;

            editrookleftw:;;;;; left shift of the rook
            mov ax,existingX
            mov cx,existingY
            loadRKLw:
                cmp arr[di],offset pawnwhiteFilename
            jz aftereditrookleftw
            cmp arr[di],offset kingwhiteFilename
            jz aftereditrookleftw
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookleftw
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookleftw
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookleftw
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookleftw
            cmp ax,16
            jBE aftereditrookleftw
          
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset kingblackFilename
             jz aftereditrookleftw
               cmp arr[di],offset bishopblackFilename
             jz aftereditrookleftw
              cmp arr[di],offset queenblackFilename
             jz aftereditrookleftw
              cmp arr[di],offset pawnblackFilename
             jz aftereditrookleftw
              cmp arr[di],offset knightblackFilename
             jz aftereditrookleftw
              cmp arr[di],offset rockblackFilename
             jz aftereditrookleftw
            mov di,indexSI
            sub di,2
            js loadRKLw
             mov indexSI,di
            jmp loadRKLw   
            

            ;;;;;;;;;;;;;;;;;;;;;;
            editrookrightw:;;;;; right shift of the rook
            mov ax,existingX
            mov cx,existingY
            loadSQRw:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditrookrightw
            cmp arr[di],offset kingwhiteFilename
            jz aftereditrookrightw
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookrightw
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookrightw
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookrightw
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookrightw
            cmp ax,163
            jGE aftereditrookrightw
          
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            mov highlightx1[bx],cx
            inc bx
            inc bx
             mov di,indexSI
             cmp arr[di],offset kingblackFilename
             jz aftereditrookrightw
               cmp arr[di],offset bishopblackFilename
             jz aftereditrookrightw
              cmp arr[di],offset queenblackFilename
             jz aftereditrookrightw
              cmp arr[di],offset pawnblackFilename
             jz aftereditrookrightw
              cmp arr[di],offset knightblackFilename
             jz aftereditrookrightw
              cmp arr[di],offset rockblackFilename
             jz aftereditrookrightw
             mov di,indexSI
            add di,2
            
            mov indexSI,di
            jmp loadSQRw
         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            editrookupw:;;;; up shift rook
            mov ax,existingX
            mov cx,existingY
            loadRKUw:
             cmp arr[di],offset pawnwhiteFilename
            jz aftereditrookupw
            cmp arr[di],offset kingwhiteFilename
            jz aftereditrookupw
            cmp arr[di],offset knightwhiteFilename
            jz aftereditrookupw
            cmp arr[di],offset queenwhiteFilename
            jz aftereditrookupw
            cmp arr[di],offset rockwhiteFilename
            jz aftereditrookupw
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditrookupw
           
            cmp cx,16
            jBE aftereditrookupw
           
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
           
             mov di,indexSI

             cmp arr[di],offset kingblackFilename
             jz aftereditrookupw
              cmp arr[di],offset bishopblackFilename
             jz aftereditrookupw
              cmp arr[di],offset queenblackFilename
             jz aftereditrookupw
              cmp arr[di],offset pawnblackFilename
             jz aftereditrookupw
              cmp arr[di],offset knightblackFilename
             jz aftereditrookupw
              cmp arr[di],offset rockblackFilename
             jz aftereditrookupw
              mov di,indexSI
            sub di,16
            mov indexSI,di
            jmp loadRKUw

                greenarearookwhite:
          push di
            mov bx,0
            mov indexSI,si
            mov di,indexSI
            add di,16
            mov indexSI,di
          
            cmp arr[si+16],0
            jz editrookdownw
            
            
            cmp arr[si+16], offset kingblackFilename
            jz editrookdownw
            cmp arr[si+16], offset pawnblackFilename
            jz editrookdownw
            cmp arr[si+16], offset queenblackFilename
            jz editrookdownw
            cmp arr[si+16], offset knightblackFilename
            jz editrookdownw
            cmp arr[si+16], offset rockblackFilename
            jz editrookdownw
           cmp arr[si+16], offset bishopblackFilename
            jz editrookdownw
            
            aftereditrookdownw:
            mov indexSI,si
            mov di,indexSI
            sub di,2
            mov indexSI,di
            
            cmp arr[si-2],0
             jz editrookleftw
             cmp arr[si-2],offset kingblackFilename
             jz editrookleftw
               cmp arr[si-2],offset bishopblackFilename
             jz editrookleftw
              cmp arr[si-2],offset queenblackFilename
             jz editrookleftw
              cmp arr[si-2],offset pawnblackFilename
             jz editrookleftw
              cmp arr[si-2],offset knightblackFilename
             jz editrookleftw
              cmp arr[si-2],offset rockblackFilename
             jz editrookleftw
            
             aftereditrookleftw:
             mov indexSI,si
            mov di,indexSI
            add di,2
            mov indexSI,di

            cmp arr[si+2],0
            jz editrookrightw
              cmp arr[si+2],offset kingblackFilename
             jz editrookrightw
               cmp arr[si+2],offset bishopblackFilename
             jz editrookrightw
              cmp arr[si+2],offset queenblackFilename
             jz editrookrightw
              cmp arr[si+2],offset pawnblackFilename
             jz editrookrightw
              cmp arr[si+2],offset knightblackFilename
             jz editrookrightw
              cmp arr[si+2],offset rockblackFilename
             jz editrookrightw
          
             aftereditrookrightw:
              mov indexSI,si
            mov di,indexSI
            sub di,16
            mov indexSI,di

            cmp arr[si-16],0
             jz editrookupw
            
            


             cmp arr[si-16],offset kingblackFilename
             jz editrookupw
              cmp arr[si-16],offset bishopblackFilename
             jz editrookupw
              cmp arr[si-16],offset queenblackFilename
             jz editrookupw
              cmp arr[si-16],offset pawnblackFilename
             jz editrookupw
              cmp arr[si-16],offset knightblackFilename
             jz editrookupw
              cmp arr[si-16],offset rockblackFilename
             jz editrookupw

             
              
             aftereditrookupw:
            aftereditingrookblackw:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            highlightgreen highlightx9, highlighty9
            highlightgreen highlightx10, highlighty10
            highlightgreen highlightx11, highlighty11
            highlightgreen highlightx12, highlighty12
            highlightgreen highlightx13, highlighty13
            highlightgreen highlightx14, highlighty14
            jmp line1242
             ;;;;;;;;;;;;;;;;;;;;;;;;end of rock validation 
              ;;;;;;;;;;;;;;;;; begin of the bishop validation
            ;;;;;by Ahmed Yasser;;;;;;;;
            editbishoprightdown:;;; same validation that is used above by rock but changeing it to move on x and y axis
            mov ax,existingX
            mov cx,existingY
            
            loadSQRD:
            cmp arr[di],offset pawnblackFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset kingblackFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset knightblackFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset queenblackFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset rockblackFilename
            jz aftereditbishoprightdown
             cmp arr[di],offset bishopblackFilename
            jz aftereditbishoprightdown
            cmp ax,163
            jGE aftereditbishoprightdown
            cmp cx,163
            jGE aftereditbishoprightdown
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishoprightdown
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishoprightdown
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishoprightdown
            mov di,indexSI
            add di,18
            mov indexSI,di
            jmp loadSQRD
            
            editbishoprightdownwhite:
            mov ax,existingX
            mov cx,existingY
            loadSQRDw:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishoprightdownwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishoprightdownwhite
            cmp ax,163
            jGE aftereditbishoprightdownwhite
            cmp cx,163
            jGE aftereditbishoprightdownwhite
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditbishoprightdownwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditbishoprightdownwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditbishoprightdownwhite
            mov di,indexSI
            add di,18
            mov indexSI,di
            jmp loadSQRDw

            editbishopleftdown:
            mov ax,existingX
            mov cx,existingY
            loadSQLD:
             cmp arr[di],offset pawnblackFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset kingblackFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset knightblackFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset queenblackFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset rockblackFilename
            jz aftereditbishopleftdown
             cmp arr[di],offset bishopblackFilename
            jz aftereditbishopleftdown
            cmp ax,16
            jBE aftereditbishopleftdown
            cmp cx,163
            jGE aftereditbishopleftdown
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishopleftdown
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishopleftdown
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishopleftdown
            mov di,indexSI
            add di,14
             mov indexSI,di
            jmp loadSQLD   

            editbishopleftdownwhite:
            mov ax,existingX
            mov cx,existingY
            loadSQLDw:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishopleftdownwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishopleftdownwhite
            cmp ax,16
            jBE aftereditbishopleftdownwhite
            cmp cx,163
            jGE aftereditbishopleftdownwhite
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            cmp arr[di],offset pawnblackFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditbishopleftdownwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditbishopleftdownwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditbishopleftdownwhite
             mov di,indexSI
            add di,14
             mov indexSI,di
            jmp loadSQLDw 
            
            editbishoprightup:
            mov ax,existingX
            mov cx,existingY
            loadSQRU:
             cmp arr[di],offset pawnblackFilename
            jz aftereditbishoprightup
            cmp arr[di],offset kingblackFilename
            jz aftereditbishoprightup
            cmp arr[di],offset knightblackFilename
            jz aftereditbishoprightup
            cmp arr[di],offset queenblackFilename
            jz aftereditbishoprightup
            cmp arr[di],offset rockblackFilename
            jz aftereditbishoprightup
            cmp arr[di],offset bishopblackFilename
            jz aftereditbishoprightup
            cmp ax,163
            jGE aftereditbishoprightup
            cmp cx,16
            jBE aftereditbishoprightup
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishoprightup
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishoprightup
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishoprightup
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishoprightup
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishoprightup
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishoprightup
            mov di,indexSI
            sub di,14
            js loadSQRU
            mov indexSI,di
            jmp loadSQRU

            editbishoprightupwhite:
            mov ax,existingX
            mov cx,existingY
            loadSQRUw:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishoprightupwhite
            cmp ax,163
            jGE aftereditbishoprightupwhite
            cmp cx,16
            jBE aftereditbishoprightupwhite
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            cmp arr[di],offset pawnblackFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditbishoprightupwhite
            cmp arr[di],offset bishopblackFilename
            jz aftereditbishoprightupwhite
            mov di,indexSI
            sub di,14
            js loadSQRU
            mov indexSI,di
            jmp loadSQRUw

            editbishopleftup:
            mov ax,existingX
            mov cx,existingY
            loadSQLU:
            cmp arr[di],offset pawnblackFilename
            jz aftereditbishopleftup
            cmp arr[di],offset kingblackFilename
            jz aftereditbishopleftup
            cmp arr[di],offset knightblackFilename
            jz aftereditbishopleftup
            cmp arr[di],offset queenblackFilename
            jz aftereditbishopleftup
            cmp arr[di],offset rockblackFilename
            jz aftereditbishopleftup
             cmp arr[di],offset bishopblackFilename
            jz aftereditbishopleftup
            cmp ax,16
            jBE aftereditbishopleftup
            cmp cx,16
            jBE aftereditbishopleftup
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishopleftup
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishopleftup
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishopleftup
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishopleftup
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishopleftup
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishopleftup
            mov di,indexSI
            sub di,18
            mov indexSI,di
            jmp loadSQLU

            editbishopleftupwhite:
            mov ax,existingX
            mov cx,existingY
            loadSQLUw:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditbishopleftupwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditbishopleftupwhite
            cmp ax,16
            jBE aftereditbishopleftupwhite
            cmp cx,16
            jBE aftereditbishopleftupwhite
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditbishopleftupwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditbishopleftupwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditbishopleftupwhite
            mov di,indexSI
            sub di,18
            mov indexSI,di
            jmp loadSQLUw

            greenareabishipblack:
            push di
            mov bx,0
            mov indexSI,si
            mov di,indexSI
            add di,18
            mov indexSI,di
            cmp arr[si+18],0
            jz editbishoprightdown
            cmp arr[si+18],offset pawnwhiteFilename
            jz editbishoprightdown
            cmp arr[si+18],offset kingwhiteFilename
            jz editbishoprightdown
            cmp arr[si+18],offset knightwhiteFilename
            jz editbishoprightdown
            cmp arr[si+18],offset queenwhiteFilename
            jz editbishoprightdown
            cmp arr[si+18],offset rockwhiteFilename
            jz editbishoprightdown
            cmp arr[si+18],offset bishopwhiteFilename
            jz editbishoprightdown
            aftereditbishoprightdown:
            mov indexSI,si
            mov di,indexSI
            add di,14
            mov indexSI,di
            cmp arr[si+14],0
            jz editbishopleftdown
            cmp arr[si+14],offset pawnwhiteFilename
            jz editbishopleftdown
            cmp arr[si+14],offset kingwhiteFilename
            jz editbishopleftdown
            cmp arr[si+14],offset knightwhiteFilename
            jz editbishopleftdown
            cmp arr[si+14],offset queenwhiteFilename
            jz editbishopleftdown
            cmp arr[si+14],offset rockwhiteFilename
            jz editbishopleftdown
            cmp arr[si+14],offset bishopwhiteFilename
            jz editbishopleftdown
            aftereditbishopleftdown:
            mov indexSI,si
            mov di,indexSI
            sub di,14
            mov indexSI,di
            cmp arr[si-14],0
            jz editbishoprightup
            cmp arr[si-14],offset pawnwhiteFilename
            jz editbishoprightup
            cmp arr[si-14],offset kingwhiteFilename
            jz editbishoprightup
            cmp arr[si-14],offset knightwhiteFilename
            jz editbishoprightup
            cmp arr[si-14],offset queenwhiteFilename
            jz editbishoprightup
            cmp arr[si-14],offset rockwhiteFilename
            jz editbishoprightup
            cmp arr[si-14],offset bishopwhiteFilename
            jz editbishoprightup
            aftereditbishoprightup:
            mov indexSI,si
            mov di,indexSI
            sub di,18
            mov indexSI,di
            cmp arr[si-18],0
             jz editbishopleftup
             cmp arr[si-18],offset pawnwhiteFilename
             jz editbishopleftup
             cmp arr[si-18],offset kingwhiteFilename
             jz editbishopleftup
             cmp arr[si-18],offset knightwhiteFilename
             jz editbishopleftup
             cmp arr[si-18],offset queenwhiteFilename
             jz editbishopleftup
             cmp arr[si-18],offset rockwhiteFilename
             jz editbishopleftup
             cmp arr[si-18],offset bishopwhiteFilename
             jz editbishopleftup
             aftereditbishopleftup:
            aftereditingBishopblack:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            highlightgreen highlightx9, highlighty9
            highlightgreen highlightx10, highlighty10
            highlightgreen highlightx11, highlighty11
            highlightgreen highlightx12, highlighty12
            highlightgreen highlightx13, highlighty13
            highlightgreen highlightx14, highlighty14
            pop di
            jmp line1242

            greenareabishipWhite:
            push di
            mov bx,0
            mov indexSI,si
            mov di,indexSI
            add di,18
            mov indexSI,di
            cmp arr[si+18],0
            jz editbishoprightdownwhite
            cmp arr[si+18],offset pawnblackFilename
            jz editbishoprightdownwhite
            cmp arr[si+18],offset kingblackFilename
            jz editbishoprightdownwhite
            cmp arr[si+18],offset knightblackFilename
            jz editbishoprightdownwhite
            cmp arr[si+18],offset queenblackFilename
            jz editbishoprightdownwhite
            cmp arr[si+18],offset rockblackFilename
            jz editbishoprightdownwhite
            cmp arr[si+18],offset bishopblackFilename
            jz editbishoprightdownwhite
            aftereditbishoprightdownwhite:
            mov indexSI,si
            mov di,indexSI
            add di,14
            mov indexSI,di
            cmp arr[si+14],0
             jz editbishopleftdownwhite
             cmp arr[si+14],offset pawnblackFilename
            jz editbishopleftdownwhite
            cmp arr[si+14],offset kingblackFilename
            jz editbishopleftdownwhite
            cmp arr[si+14],offset knightblackFilename
            jz editbishopleftdownwhite
            cmp arr[si+14],offset queenblackFilename
            jz editbishopleftdownwhite
            cmp arr[si+14],offset rockblackFilename
            jz editbishopleftdownwhite
            cmp arr[si+14],offset bishopblackFilename
            jz editbishopleftdownwhite
             aftereditbishopleftdownwhite:
             mov indexSI,si
            mov di,indexSI
            sub di,14
            mov indexSI,di
            cmp arr[si-14],0
            jz editbishoprightupwhite
            cmp arr[si-14],offset pawnblackFilename
            jz editbishoprightupwhite
            cmp arr[si-14],offset kingblackFilename
            jz editbishoprightupwhite
            cmp arr[si-14],offset knightblackFilename
            jz editbishoprightupwhite
            cmp arr[si-14],offset queenblackFilename
            jz editbishoprightupwhite
            cmp arr[si-14],offset rockblackFilename
            jz editbishoprightupwhite
            cmp arr[si-14],offset bishopblackFilename
            jz editbishoprightupwhite
             aftereditbishoprightupwhite:
             mov indexSI,si
            mov di,indexSI
            sub di,18
            mov indexSI,di
            cmp arr[si-18],0
             jz editbishopleftupwhite
             cmp arr[si-18],offset pawnblackFilename
             jz editbishopleftupwhite
             cmp arr[si-18],offset kingblackFilename
             jz editbishopleftupwhite
             cmp arr[si-18],offset knightblackFilename
             jz editbishopleftupwhite
             cmp arr[si-18],offset queenblackFilename
             jz editbishopleftupwhite
             cmp arr[si-18],offset rockblackFilename
             jz editbishopleftupwhite
             cmp arr[si-18],offset bishopblackFilename
             jz editbishopleftupwhite
             aftereditbishopleftupwhite:
            aftereditingBishopwhite:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            highlightgreen highlightx9, highlighty9
            highlightgreen highlightx10, highlighty10
            highlightgreen highlightx11, highlighty11
            highlightgreen highlightx12, highlighty12
            highlightgreen highlightx13, highlighty13
            highlightgreen highlightx14, highlighty14

            jmp line1242
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; end of all bishop pieces validations

;;;;;;;;;;;;;;;;;;;;sayed
            editpawnblackdown:;;;;;;; beginning of  black pawn validation
            cmp existingY,163
            jz afterpawnblackdown
            mov ax,existingY
            add ax,21
            mov highlighty1,ax
            mov bx,existingX
            mov highlightx1,bx
            cmp existingY,37
            jnz afterpawnblackdown
            cmp arr[si+32],0;;; in order to move 2 steps in first movement
            jnz afterpawnblackedit
            add ax,21
            mov highlighty4,ax     
            mov highlightx4,bx
            jmp afterpawnblackdown

            editpawnblackdownright:;;; in order to kill white pieces   on right
            cmp existingX,163
            jz afterpawnblackdownright
            mov ax,existingY
            add ax,21
            mov highlighty2,ax
            mov bx,existingX
            add bx,21
            mov highlightx2,bx
            jmp afterpawnblackdownright

            editpawnblackdownleft:;;; in order to kill white pieces   on left
            cmp existingX,16
            jz afterpawnblackdownleft
            mov ax,existingY
            add ax,21
            mov highlighty3,ax
            mov bx,existingX
            sub bx,21
            mov highlightx3,bx
            jmp afterpawnblackdownleft

            greenareapawnblack:;;; label that is called when ypu select black pawn same technique as rock
            cmp arr[si+16],0
            jz editpawnblackdown
            afterpawnblackdown:
            cmp arr[si+18],offset pawnwhiteFilename
            jz editpawnblackdownright           
             cmp arr[si+18],offset rockwhiteFilename
             jz editpawnblackdownright
             cmp arr[si+18],offset knightwhiteFilename
             jz editpawnblackdownright
             cmp arr[si+18],offset bishopwhiteFilename
             jz editpawnblackdownright
             cmp arr[si+18],offset kingwhiteFilename
             jz editpawnblackdownright
             cmp arr[si+18],offset queenwhiteFilename
             jz editpawnblackdownright
             cmp arr[si+18],offset PowerFilename
             jz editpawnblackdownright
             afterpawnblackdownright:
              cmp arr[si+14],offset pawnwhiteFilename
            jz editpawnblackdownleft           
             cmp arr[si+14],offset rockwhiteFilename
             jz editpawnblackdownleft
             cmp arr[si+14],offset knightwhiteFilename
             jz editpawnblackdownleft
             cmp arr[si+14],offset bishopwhiteFilename
             jz editpawnblackdownleft
             cmp arr[si+14],offset kingwhiteFilename
             jz editpawnblackdownleft
             cmp arr[si+14],offset queenwhiteFilename
             jz editpawnblackdownleft
             cmp arr[si+14],offset PowerFilename
             jz editpawnblackdownleft
             afterpawnblackdownleft:
              jmp afterpawnblackedit




            drawonthesamepawn:
            mov ax,existingX
            mov wantedX,ax
            mov ax,existingY
            mov wantedY,ax
            jmp line1370         ;;;; 34an law fi piece 2odamo yersem fi nafs el makan


            drawonthesamepawn2:
            mov ax,existingX
            mov wantedX,ax
            mov ax,existingY
            mov wantedY,ax
            mov zikoknockedoffset,1
            jmp line1370

            
            
            
            afterpawnblackedit:
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            jmp line1242

            editpawnwhite:;;;;;;; beginning of white pawn validation
            cmp existingY,16
            jz afterpawnwhiteupp
            mov ax,existingY
            sub ax,21
            mov highlighty1,ax
            mov bx,existingX
            mov highlightx1,bx
             cmp existingY,142
            jnz afterpawnwhiteupp
            cmp arr[si-32],0;; move 2 step up
            jnz afterpawnblackedit
            sub ax,21
            mov highlighty4,ax     
            mov highlightx4,bx
            jmp afterpawnwhiteupp

            editpawnwhiteupleft:;;;
            cmp existingX,16
            jz afterpawnwhiteupleft ;;;;;; in order to kill white pieces   on left
            mov ax,existingY
            sub ax,21
            mov highlighty2,ax
            mov bx,existingX
            sub bx,21
            mov highlightx2,bx
            jmp afterpawnwhiteupleft

             editpawnwhiteupright:;;;;;; in order to kill white pieces   on right
             cmp existingX,163
             jz afterpawnwhiteupright
            mov ax,existingY
            sub ax,21
            mov highlighty3,ax
            mov bx,existingX
            add bx,21
            mov highlightx3,bx
            jmp afterpawnwhiteupright
            greenareapawnwhite: ;;; label that is called when ypu select black pawn same technique as rock
            cmp arr[si-16],0
            jz editpawnwhite
             afterpawnwhiteupp:
               cmp arr[si-18],offset pawnblackFilename
            jz editpawnwhiteupleft           
             cmp arr[si-18],offset rockblackFilename
             jz editpawnwhiteupleft
             cmp arr[si-18],offset knightblackFilename
             jz editpawnwhiteupleft
             cmp arr[si-18],offset bishopblackFilename
             jz editpawnwhiteupleft
             cmp arr[si-18],offset kingblackFilename
             jz editpawnwhiteupleft
             cmp arr[si-18],offset queenblackFilename
             jz editpawnwhiteupleft
               cmp arr[si-18],offset PowerFilename
             jz editpawnwhiteupleft
             afterpawnwhiteupleft:
              cmp arr[si-14],offset pawnblackFilename
            jz editpawnwhiteupright           
             cmp arr[si-14],offset rockblackFilename
             jz editpawnwhiteupright
             cmp arr[si-14],offset knightblackFilename
             jz editpawnwhiteupright
             cmp arr[si-14],offset bishopblackFilename
             jz editpawnwhiteupright
             cmp arr[si-14],offset kingblackFilename
             jz editpawnwhiteupright
             cmp arr[si-14],offset queenblackFilename
             jz editpawnwhiteupright
             cmp arr[si-14],offset PowerFilename
             jz editpawnwhiteupright
             afterpawnwhiteupright:
              jmp afterpawnwhiteedit
            mov ax,existingX
            mov wantedX,ax
            mov ax,existingY
            mov wantedY,ax
            jmp line1370         ;;;; 34an law fi piece 2odamo yersem fi nafs el makan
             afterpawnwhiteedit:
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            jmp line1242
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;;;;;;;;;;;;;;;;;;;michael;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;;;;;;;;;;;;;;;;;;beginning of validations of the queen it is combination of the rock and bishop
            editqueenrightdown:
            mov ax,existingX
            mov cx,existingY
            
            loadBQRD:
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenrightdown
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenrightdown
            cmp ax,163
            jGE aftereditqueenrightdown
            cmp cx,163
            jGE aftereditqueenrightdown
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenrightdown
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenrightdown
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenrightdown
            mov di,indexSI
            add di,18
            mov indexSI,di
            jmp loadBQRD

            editqueenrightdownwhite:
            mov ax,existingX
            mov cx,existingY
            
            loadWQRD:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenrightdownwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenrightdownwhite
            cmp ax,163
            jGE aftereditqueenrightdownwhite
            cmp cx,163
            jGE aftereditqueenrightdownwhite
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenrightdownwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenrightdownwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenrightdownwhite
            mov di,indexSI
            add di,18
            mov indexSI,di
            jmp loadWQRD

            editqueenleftdown:
            mov ax,existingX
            mov cx,existingY

            loadBQLD:
             cmp arr[di],offset pawnblackFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenleftdown
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenleftdown
            cmp ax,16
            jBE aftereditqueenleftdown
            cmp cx,163
            jGE aftereditqueenleftdown
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenleftdown
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenleftdown
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenleftdown
            mov di,indexSI
            add di,14
             mov indexSI,di
            jmp loadBQLD 

            editqueenleftdownwhite:
            mov ax,existingX
            mov cx,existingY

            loadWQLD:
             cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenleftdownwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenleftdownwhite
            cmp ax,16
            jBE aftereditqueenleftdownwhite
            cmp cx,163
            jGE aftereditqueenleftdownwhite
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenleftdownwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenleftdownwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenleftdownwhite
            mov di,indexSI
            add di,14
             mov indexSI,di
            jmp loadWQLD 

            editqueenrightup:
            mov ax,existingX
            mov cx,existingY
            loadBQRU:
             cmp arr[di],offset pawnblackFilename
            jz aftereditqueenrightup
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenrightup
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenrightup
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenrightup
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenrightup
            cmp arr[di],offset bishopblackFilename
            jz aftereditqueenrightup
            cmp ax,163
            jGE aftereditqueenrightup
            cmp cx,16
            jBE aftereditqueenrightup
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenrightup
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenrightup
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenrightup
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenrightup
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenrightup
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenrightup
            mov di,indexSI
            sub di,14
            js loadBQRU
            mov indexSI,di
            jmp loadBQRU

            editqueenrightupwhite:
            mov ax,existingX
            mov cx,existingY
            loadWQRU:
             cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenrightupwhite
            cmp ax,163
            jGE aftereditqueenrightupwhite
            cmp cx,16
            jBE aftereditqueenrightupwhite
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenrightupwhite
            cmp arr[di],offset bishopblackFilename
            jz aftereditqueenrightupwhite
            mov di,indexSI
            sub di,14
            js loadBQRU
            mov indexSI,di
            jmp loadWQRU

            editqueenleftup:
            mov ax,existingX
            mov cx,existingY

            loadBQLU:
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenleftup
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenleftup
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenleftup
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenleftup
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenleftup
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenleftup
            cmp ax,16
            jBE aftereditqueenleftup
            cmp cx,16
            jBE aftereditqueenleftup
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenleftup
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenleftup
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenleftup
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenleftup
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenleftup
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenleftup
            mov di,indexSI
            sub di,18
            mov indexSI,di
            jmp loadBQLU

            editqueenleftupwhite:
            mov ax,existingX
            mov cx,existingY

            loadWQLU:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenleftupwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenleftupwhite
            cmp ax,16
            jBE aftereditqueenleftupwhite
            cmp cx,16
            jBE aftereditqueenleftupwhite
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenleftupwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenleftupwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenleftupwhite
            mov di,indexSI
            sub di,18
            mov indexSI,di
            jmp loadWQLU


            editqueendown:
            mov ax,existingX
            mov cx,existingY

            loadBQD: 
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueendown
            cmp arr[di],offset kingblackFilename
            jz aftereditqueendown
            cmp arr[di],offset knightblackFilename
            jz aftereditqueendown
            cmp arr[di],offset queenblackFilename
            jz aftereditqueendown
            cmp arr[di],offset rockblackFilename
            jz aftereditqueendown
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueendown
            
            cmp cx,163
            jGE aftereditqueendown
            
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz   aftereditqueendown
            cmp arr[di],offset kingwhiteFilename
            jz  aftereditqueendown
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueendown
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueendown
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueendown
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueendown
            mov di,indexSI
            add di,16
            mov indexSI,di

            jmp loadBQD
            ;;;;;;;;;;;;;;;;;;;;;
            editqueendownwhite:
            mov ax,existingX
            mov cx,existingY

            loadWQD: 
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueendownwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueendownwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueendownwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueendownwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueendownwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueendownwhite
            
            cmp cx,163
            jGE aftereditqueendownwhite
            
            mov highlightx1[bx],ax
            inc bx
            inc bx
            add cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz   aftereditqueendownwhite
            cmp arr[di],offset kingblackFilename
            jz  aftereditqueendownwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditqueendownwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueendownwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueendownwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueendownwhite
            mov di,indexSI
            add di,16
            mov indexSI,di

            jmp loadWQD
            ;;;;;;;;;;;;;;;;;;;;;

            editqueenleft:
            mov ax,existingX
            mov cx,existingY

            loadBQL:
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenleft
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenleft
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenleft
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenleft
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenleft
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenleft
            cmp ax,16
            jBE aftereditqueenleft
          
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            
            mov highlightx1[bx],cx
            inc bx 
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenleft
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenleft
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenleft
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenleft
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenleft
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenleft
            mov di,indexSI
            sub di,2
            js loadBQL
             mov indexSI,di
            jmp loadBQL   
            ;;;;;;;;;;;;;;;;;;;;;;

            editqueenleftwhite:
            mov ax,existingX
            mov cx,existingY

            loadWQL:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenleftwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenleftwhite
            cmp ax,16
            jBE aftereditqueenleftwhite
          
            sub ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            
            mov highlightx1[bx],cx
            inc bx 
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenleftwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenleftwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenleftwhite
            mov di,indexSI
            sub di,2
            js loadWQL
             mov indexSI,di
            jmp loadWQL   

            ;;;;;;;;;;;;;;;;;;;;;;
            editqueenright:
            mov ax,existingX
            mov cx,existingY

            loadBQR:
             cmp arr[di],offset pawnblackFilename
            jz aftereditqueenright
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenright
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenright
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenright
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenright
            cmp arr[di],offset bishopblackFilename
            jz aftereditqueenright
            cmp ax,163
            jGE aftereditqueenright
          
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenright
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenright
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenright
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenright
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenright
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenright
            mov di,indexSI
            add di,2
            
            mov indexSI,di
            jmp loadBQR
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;
             editqueenrightwhite:
            mov ax,existingX
            mov cx,existingY

            loadWQR:
             cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenrightwhite
            cmp ax,163
            jGE aftereditqueenrightwhite
          
            add ax,21
            mov highlightx1[bx],ax
            inc bx
            inc bx
            
            mov highlightx1[bx],cx
            inc bx
            inc bx
            mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenrightwhite
            cmp arr[di],offset bishopblackFilename
            jz aftereditqueenrightwhite
            mov di,indexSI
            add di,2
            
            mov indexSI,di
            jmp loadWQR
         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            editqueenup:
            mov ax,existingX
            mov cx,existingY

            loadBQU:
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenup
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenup
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenup
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenup
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenup
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenup
            
            cmp cx,16
            jBE aftereditqueenup
            
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
               mov di,indexSI
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenup
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenup
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenup
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenup
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenup
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenup
            mov di,indexSI
            sub di,16
            mov indexSI,di
            jmp loadBQU
            ;;;;;;;;;;;;;;;;;;;
            editqueenupwhite:
            mov ax,existingX
            mov cx,existingY

            loadWQU:
            cmp arr[di],offset pawnwhiteFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset kingwhiteFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset knightwhiteFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset queenwhiteFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset rockwhiteFilename
            jz aftereditqueenupwhite
             cmp arr[di],offset bishopwhiteFilename
            jz aftereditqueenupwhite
            
            cmp cx,16
            jBE aftereditqueenupwhite
            
            mov highlightx1[bx],ax
            inc bx
            inc bx
            sub cx,21
            mov highlightx1[bx],cx
            inc bx
            inc bx
               mov di,indexSI
            cmp arr[di],offset pawnblackFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset kingblackFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset knightblackFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset queenblackFilename
            jz aftereditqueenupwhite
            cmp arr[di],offset rockblackFilename
            jz aftereditqueenupwhite
             cmp arr[di],offset bishopblackFilename
            jz aftereditqueenupwhite
            mov di,indexSI
            sub di,16
            mov indexSI,di
            jmp loadWQU

;;;;;;;;;;;;;;;;;;;;QUEEN BLACK;;;;;;;;;;;;;;;;;;;;;
            greenareaqueenblack:;;;; using validation of rock and bishop 
            push di
            mov bx,0
            mov indexSI,si
            mov di,indexSI
            add di,18
            mov indexSI,di
            cmp arr[si+18],0
            jz editqueenrightdown
            cmp arr[si+18],offset pawnwhiteFilename
            jz editqueenrightdown
            cmp arr[si+18],offset kingwhiteFilename
            jz editqueenrightdown
            cmp arr[si+18],offset knightwhiteFilename
            jz editqueenrightdown
            cmp arr[si+18],offset queenwhiteFilename
            jz editqueenrightdown
            cmp arr[si+18],offset rockwhiteFilename
            jz editqueenrightdown
            cmp arr[si+18],offset bishopwhiteFilename
            jz editqueenrightdown

            aftereditqueenrightdown:
            mov indexSI,si
            mov di,indexSI
            add di,14
            mov indexSI,di

            cmp arr[si+14],0
            jz editqueenleftdown
            cmp arr[si+14],offset pawnwhiteFilename
            jz editqueenleftdown
            cmp arr[si+14],offset kingwhiteFilename
            jz editqueenleftdown
            cmp arr[si+14],offset knightwhiteFilename
            jz editqueenleftdown
            cmp arr[si+14],offset queenwhiteFilename
            jz editqueenleftdown
            cmp arr[si+14],offset rockwhiteFilename
            jz editqueenleftdown
            cmp arr[si+14],offset bishopwhiteFilename
            jz editqueenleftdown

            aftereditqueenleftdown:
            mov indexSI,si
            mov di,indexSI
            sub di,14
            mov indexSI,di

            cmp arr[si-14],0
            jz editqueenrightup
            cmp arr[si-14],offset pawnwhiteFilename
            jz editqueenrightup
            cmp arr[si-14],offset kingwhiteFilename
            jz editqueenrightup
            cmp arr[si-14],offset knightwhiteFilename
            jz editqueenrightup
            cmp arr[si-14],offset queenwhiteFilename
            jz editqueenrightup
            cmp arr[si-14],offset rockwhiteFilename
            jz editqueenrightup
            cmp arr[si-14],offset bishopwhiteFilename
            jz editqueenrightup

            aftereditqueenrightup:
            mov indexSI,si
            mov di,indexSI
            sub di,18
            mov indexSI,di

            cmp arr[si-18],0
             jz editqueenleftup
             cmp arr[si-18],offset pawnwhiteFilename
             jz editqueenleftup
             cmp arr[si-18],offset kingwhiteFilename
             jz editqueenleftup
             cmp arr[si-18],offset knightwhiteFilename
             jz editqueenleftup
             cmp arr[si-18],offset queenwhiteFilename
             jz editqueenleftup
             cmp arr[si-18],offset rockwhiteFilename
             jz editqueenleftup
             cmp arr[si-18],offset bishopwhiteFilename
             jz editqueenleftup

             aftereditqueenleftup:

            mov indexSI,si
            mov di,indexSI
            add di,16
            mov indexSI,di
            cmp arr[si+16],0
            jz editqueendown
            cmp arr[si+16], offset kingwhiteFilename
            jz editqueendown
            cmp arr[si+16], offset pawnwhiteFilename
            jz editqueendown
            cmp arr[si+16], offset queenwhiteFilename
            jz editqueendown
            cmp arr[si+16], offset knightwhiteFilename
            jz editqueendown
            cmp arr[si+16], offset rockwhiteFilename
            jz editqueendown
           cmp arr[si+16], offset bishopwhiteFilename
            jz editqueendown

            aftereditqueendown:
             mov indexSI,si
            mov di,indexSI
            sub di,2
            mov indexSI,di
            
            cmp arr[si-2],0
             jz editqueenleft
             cmp arr[si-2],offset kingwhiteFilename
             jz editqueenleft
               cmp arr[si-2],offset bishopwhiteFilename
             jz editqueenleft
              cmp arr[si-2],offset queenwhiteFilename
             jz editqueenleft
              cmp arr[si-2],offset pawnwhiteFilename
             jz editqueenleft
              cmp arr[si-2],offset knightwhiteFilename
             jz editqueenleft
              cmp arr[si-2],offset rockwhiteFilename
             jz editqueenleft

             aftereditqueenleft:
            mov indexSI,si
            mov di,indexSI
            add di,2
            mov indexSI,di

            cmp arr[si+2],0
            jz editqueenright
              cmp arr[si+2],offset kingwhiteFilename
             jz editqueenright
               cmp arr[si+2],offset bishopwhiteFilename
             jz editqueenright
              cmp arr[si+2],offset queenwhiteFilename
             jz editqueenright
              cmp arr[si+2],offset pawnwhiteFilename
             jz editqueenright
              cmp arr[si+2],offset knightwhiteFilename
             jz editqueenright
              cmp arr[si+2],offset rockwhiteFilename
             jz editqueenright
            
             aftereditqueenright:
             mov indexSI,si
            mov di,indexSI
            sub di,16
            mov indexSI,di

            cmp arr[si-16],0
             jz editqueenup
             cmp arr[si-16],offset kingwhiteFilename
             jz editqueenup
              cmp arr[si-16],offset bishopwhiteFilename
             jz editqueenup
              cmp arr[si-16],offset queenwhiteFilename
             jz editqueenup
              cmp arr[si-16],offset pawnwhiteFilename
             jz editqueenup
              cmp arr[si-16],offset knightwhiteFilename
             jz editqueenup
              cmp arr[si-16],offset rockwhiteFilename
             jz editqueenup
             
             aftereditqueenup:

            aftereditingqueenblack:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            highlightgreen highlightx9, highlighty9
            highlightgreen highlightx10, highlighty10
            highlightgreen highlightx11, highlighty11
            highlightgreen highlightx12, highlighty12
            highlightgreen highlightx13, highlighty13
            highlightgreen highlightx14, highlighty14
            highlightgreen highlightx15, highlighty15
            highlightgreen highlightx16, highlighty16
            highlightgreen highlightx17, highlighty17
            highlightgreen highlightx18, highlighty18
            highlightgreen highlightx19, highlighty19
            highlightgreen highlightx20, highlighty20
            highlightgreen highlightx21, highlighty21
            highlightgreen highlightx22, highlighty22
            highlightgreen highlightx23, highlighty23
            highlightgreen highlightx24, highlighty24
            highlightgreen highlightx25, highlighty25
            highlightgreen highlightx26, highlighty26
            highlightgreen highlightx27, highlighty27
            pop di
            jmp line1242

;;;;;;;;;;;;;;;QUEEN WHITE;;;;;;;;;;;;;;;;;;
            greenareaqueenwhite:;;;; using validation of rock and bishop 
            push di
            mov bx,0
            mov indexSI,si
            mov di,indexSI
            add di,18
            mov indexSI,di
            cmp arr[si+18],0
            jz editqueenrightdownwhite
            cmp arr[si+18],offset pawnblackFilename
            jz editqueenrightdownwhite
            cmp arr[si+18],offset kingblackFilename
            jz editqueenrightdownwhite
            cmp arr[si+18],offset knightblackFilename
            jz editqueenrightdownwhite
            cmp arr[si+18],offset queenblackFilename
            jz editqueenrightdownwhite
            cmp arr[si+18],offset rockblackFilename
            jz editqueenrightdownwhite
            cmp arr[si+18],offset bishopblackFilename
            jz editqueenrightdownwhite

            aftereditqueenrightdownwhite:
            mov indexSI,si
            mov di,indexSI
            add di,14
            mov indexSI,di

            cmp arr[si+14],0
            jz editqueenleftdownwhite
            cmp arr[si+14],offset pawnblackFilename
            jz editqueenleftdownwhite
            cmp arr[si+14],offset kingblackFilename
            jz editqueenleftdownwhite
            cmp arr[si+14],offset knightblackFilename
            jz editqueenleftdownwhite
            cmp arr[si+14],offset queenblackFilename
            jz editqueenleftdownwhite
            cmp arr[si+14],offset rockblackFilename
            jz editqueenleftdownwhite
            cmp arr[si+14],offset bishopblackFilename
            jz editqueenleftdownwhite

            aftereditqueenleftdownwhite:
            mov indexSI,si
            mov di,indexSI
            sub di,14
            mov indexSI,di

            cmp arr[si-14],0
            jz editqueenrightupwhite
            cmp arr[si-14],offset pawnblackFilename
            jz editqueenrightupwhite
            cmp arr[si-14],offset kingblackFilename
            jz editqueenrightupwhite
            cmp arr[si-14],offset knightblackFilename
            jz editqueenrightupwhite
            cmp arr[si-14],offset queenblackFilename
            jz editqueenrightupwhite
            cmp arr[si-14],offset rockblackFilename
            jz editqueenrightupwhite
            cmp arr[si-14],offset bishopblackFilename
            jz editqueenrightupwhite

            aftereditqueenrightupwhite:
            mov indexSI,si
            mov di,indexSI
            sub di,18
            mov indexSI,di

            cmp arr[si-18],0
             jz editqueenleftupwhite
             cmp arr[si-18],offset pawnblackFilename
             jz editqueenleftupwhite
             cmp arr[si-18],offset kingblackFilename
             jz editqueenleftupwhite
             cmp arr[si-18],offset knightblackFilename
             jz editqueenleftupwhite
             cmp arr[si-18],offset queenblackFilename
             jz editqueenleftupwhite
             cmp arr[si-18],offset rockblackFilename
             jz editqueenleftupwhite
             cmp arr[si-18],offset bishopblackFilename
             jz editqueenleftupwhite

             aftereditqueenleftupwhite:

            mov indexSI,si
            mov di,indexSI
            add di,16
            mov indexSI,di
            cmp arr[si+16],0
            jz editqueendownwhite
            cmp arr[si+16], offset kingblackFilename
            jz editqueendownwhite
            cmp arr[si+16], offset pawnblackFilename
            jz editqueendownwhite
            cmp arr[si+16], offset queenblackFilename
            jz editqueendownwhite
            cmp arr[si+16], offset knightblackFilename
            jz editqueendownwhite
            cmp arr[si+16], offset rockblackFilename
            jz editqueendownwhite
           cmp arr[si+16], offset bishopblackFilename
            jz editqueendownwhite

            aftereditqueendownwhite:
             mov indexSI,si
            mov di,indexSI
            sub di,2
            mov indexSI,di
            
            cmp arr[si-2],0
             jz editqueenleftwhite
             cmp arr[si-2],offset kingblackFilename
             jz editqueenleftwhite
               cmp arr[si-2],offset bishopblackFilename
             jz editqueenleftwhite
              cmp arr[si-2],offset queenblackFilename
             jz editqueenleftwhite
              cmp arr[si-2],offset pawnblackFilename
             jz editqueenleftwhite
              cmp arr[si-2],offset knightblackFilename
             jz editqueenleftwhite
              cmp arr[si-2],offset rockblackFilename
             jz editqueenleftwhite

             aftereditqueenleftwhite:
            mov indexSI,si
            mov di,indexSI
            add di,2
            mov indexSI,di

            cmp arr[si+2],0
            jz editqueenrightwhite
              cmp arr[si+2],offset kingblackFilename
             jz editqueenrightwhite
               cmp arr[si+2],offset bishopblackFilename
             jz editqueenrightwhite
              cmp arr[si+2],offset queenblackFilename
             jz editqueenrightwhite
              cmp arr[si+2],offset pawnblackFilename
             jz editqueenrightwhite
              cmp arr[si+2],offset knightblackFilename
             jz editqueenrightwhite
              cmp arr[si+2],offset rockblackFilename
             jz editqueenrightwhite
            
             aftereditqueenrightwhite:
             mov indexSI,si
            mov di,indexSI
            sub di,16
            mov indexSI,di

            cmp arr[si-16],0
             jz editqueenupwhite
             cmp arr[si-16],offset kingblackFilename
             jz editqueenupwhite
              cmp arr[si-16],offset bishopblackFilename
             jz editqueenupwhite
              cmp arr[si-16],offset queenblackFilename
             jz editqueenupwhite
              cmp arr[si-16],offset pawnblackFilename
             jz editqueenupwhite
              cmp arr[si-16],offset knightblackFilename
             jz editqueenupwhite
              cmp arr[si-16],offset rockblackFilename
             jz editqueenupwhite
             
             aftereditqueenupwhite:

            aftereditingqueenwhite:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            highlightgreen highlightx9, highlighty9
            highlightgreen highlightx10, highlighty10
            highlightgreen highlightx11, highlighty11
            highlightgreen highlightx12, highlighty12
            highlightgreen highlightx13, highlighty13
            highlightgreen highlightx14, highlighty14
            highlightgreen highlightx15, highlighty15
            highlightgreen highlightx16, highlighty16
            highlightgreen highlightx17, highlighty17
            highlightgreen highlightx18, highlighty18
            highlightgreen highlightx19, highlighty19
            highlightgreen highlightx20, highlighty20
            highlightgreen highlightx21, highlighty21
            highlightgreen highlightx22, highlighty22
            highlightgreen highlightx23, highlighty23
            highlightgreen highlightx24, highlighty24
            highlightgreen highlightx25, highlighty25
            highlightgreen highlightx26, highlighty26
            highlightgreen highlightx27, highlighty27
            pop di
            jmp line1242
            

          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Sayed 
          ;;;; begin of validation of king black
             editkingblackdown:;;; down valids
             cmp existingY,163
            jz aftereditingkingblackdown
            mov ax,existingY
            add ax,21
            mov highlighty1,ax
            mov bx,existingX
            mov highlightx1,bx
            jmp aftereditingkingblackdown

            editkingblackright:;; right valids
            cmp existingX,163
            jz aftereditingkingblackright
            mov ax,existingx
            add ax,21
            mov highlightx2,ax
            mov bx,existingY
            mov highlighty2,bx
            jmp aftereditingkingblackright

            editkingblackleft:;; left valids
            cmp existingX,16
            jz aftereditingkingblackleft
            mov ax,existingx
            sub ax,21
            mov highlightx3,ax
            mov bx,existingY
            mov highlighty3,bx
            jmp aftereditingkingblackleft

            editkingblackupp:;;; up valids
            cmp existingY,16
            jz aftereditingkingblackupp
            mov ax,existingY
            sub ax,21
            mov highlighty4,ax
            mov bx,existingX
            mov highlightx4,bx
            jmp aftereditingkingblackupp

            editkingblackupright:;; up right valids
             cmp existingY,16
            jz aftereditingkingblackupright
             cmp existingX,163
            jz aftereditingkingblackupright
            mov ax,existingY
            sub ax,21
            mov highlighty5,ax
            mov bx,existingX
            add bx,21
            mov highlightx5,bx
            jmp aftereditingkingblackupright

            editkingblackupleft:;;; up left valids
             cmp existingY,16
            jz aftereditingkingblackupleft
             cmp existingX,16
            jz aftereditingkingblackupleft
            mov ax,existingY
            sub ax,21
            mov highlighty6,ax
            mov bx,existingX
            sub bx,21
            mov highlightx6,bx
            jmp aftereditingkingblackupleft

            editkingblackdownright:;;; down rights valids
             cmp existingY,163
            jz aftereditingkingblackdownright
             cmp existingX,163
            jz aftereditingkingblackdownright
            mov ax,existingY
            add ax,21
            mov highlighty7,ax
            mov bx,existingX
            add bx,21
            mov highlightx7,bx
            jmp aftereditingkingblackdownright

            editkingblackdownleft:;;;;;down left valids
             cmp existingY,163
            jz aftereditingkingblackdownleft
             cmp existingX,16
            jz aftereditingkingblackdownleft
            mov ax,existingY
            add ax,21
            mov highlighty8,ax
            mov bx,existingX
            sub bx,21
            mov highlightx8,bx
            jmp aftereditingkingblackdownleft


            greenareakingblack:;;; label that is called when the king black is selected. use same valids as rock
            cmp arr[si+14],0
            jz editkingblackdownleft
             cmp arr[si+14],offset pawnwhiteFilename
            jz editkingblackdownleft
             cmp arr[si+14],offset rockwhiteFilename
            jz editkingblackdownleft
             cmp arr[si+14],offset knightwhiteFilename
            jz editkingblackdownleft
             cmp arr[si+14],offset bishopwhiteFilename
            jz editkingblackdownleft
             cmp arr[si+14],offset kingwhiteFilename
            jz editkingblackdownleft
             cmp arr[si+14],offset queenwhiteFilename
            jz editkingblackdownleft
            aftereditingkingblackdownleft:
            cmp arr[si+18],0
            jz editkingblackdownright
             cmp arr[si+18],offset pawnwhiteFilename
            jz editkingblackdownright
             cmp arr[si+18],offset rockwhiteFilename
            jz editkingblackdownright
             cmp arr[si+18],offset knightwhiteFilename
            jz editkingblackdownright
             cmp arr[si+18],offset bishopwhiteFilename
            jz editkingblackdownright
             cmp arr[si+18],offset kingwhiteFilename
            jz editkingblackdownright
             cmp arr[si+18],offset queenwhiteFilename
            jz editkingblackdownright
            aftereditingkingblackdownright:
            cmp arr[si-14],0
            jz editkingblackupright
             cmp arr[si-14],offset pawnwhiteFilename
            jz editkingblackupright
             cmp arr[si-14],offset rockwhiteFilename
            jz editkingblackupright
             cmp arr[si-14],offset knightwhiteFilename
            jz editkingblackupright
             cmp arr[si-14],offset bishopwhiteFilename
            jz editkingblackupright
             cmp arr[si-14],offset kingwhiteFilename
            jz editkingblackupright
             cmp arr[si-14],offset queenwhiteFilename
            jz editkingblackupright
            aftereditingkingblackupright:
            cmp arr[si-18],0
            jz editkingblackupleft
             cmp arr[si-18],offset pawnwhiteFilename
            jz editkingblackupleft
             cmp arr[si-18],offset rockwhiteFilename
            jz editkingblackupleft
             cmp arr[si-18],offset knightwhiteFilename
            jz editkingblackupleft
             cmp arr[si-18],offset bishopwhiteFilename
            jz editkingblackupleft
             cmp arr[si-18],offset kingwhiteFilename
            jz editkingblackupleft
             cmp arr[si-18],offset queenwhiteFilename
            jz editkingblackupleft
            aftereditingkingblackupleft:
             cmp arr[si+16],0
             jz editkingblackdown
             cmp arr[si+16],offset pawnwhiteFilename
             jz editkingblackdown
             cmp arr[si+16],offset rockwhiteFilename
             jz editkingblackdown
             cmp arr[si+16],offset knightwhiteFilename
             jz editkingblackdown
             cmp arr[si+16],offset bishopwhiteFilename
             jz editkingblackdown
             cmp arr[si+16],offset kingwhiteFilename
             jz editkingblackdown
             cmp arr[si+16],offset queenwhiteFilename
             jz editkingblackdown
             aftereditingkingblackdown:
             cmp arr[si+2],0
             jz editkingblackright
             cmp arr[si+2],offset pawnwhiteFilename
             jz editkingblackright
             cmp arr[si+2],offset rockwhiteFilename
             jz editkingblackright
             cmp arr[si+2],offset knightwhiteFilename
             jz editkingblackright
             cmp arr[si+2],offset bishopwhiteFilename
             jz editkingblackright
             cmp arr[si+2],offset kingwhiteFilename
             jz editkingblackright
             cmp arr[si+2],offset queenwhiteFilename
             jz editkingblackright
             aftereditingkingblackright:
             cmp arr[si-2],0
             jz editkingblackleft
             cmp arr[si-2],offset pawnwhiteFilename
             jz editkingblackleft
             cmp arr[si-2],offset rockwhiteFilename
             jz editkingblackleft
             cmp arr[si-2],offset knightwhiteFilename
             jz editkingblackleft
             cmp arr[si-2],offset bishopwhiteFilename
             jz editkingblackleft
             cmp arr[si-2],offset kingwhiteFilename
             jz editkingblackleft
             cmp arr[si-2],offset queenwhiteFilename
             jz editkingblackleft
             aftereditingkingblackleft:
              cmp arr[si-16],0
             jz editkingblackupp
              cmp arr[si-16],offset pawnwhiteFilename
             jz editkingblackupp
              cmp arr[si-16],offset rockwhiteFilename
             jz editkingblackupp
              cmp arr[si-16],offset knightwhiteFilename
             jz editkingblackupp
              cmp arr[si-16],offset bishopwhiteFilename
             jz editkingblackupp
              cmp arr[si-16],offset kingwhiteFilename
             jz editkingblackupp
              cmp arr[si-16],offset queenwhiteFilename
             jz editkingblackupp
             jnz aftereditingkingblackupp
            ; mov ax,existingX
            ; mov wantedX,ax
            ; mov ax,existingY
            ; mov wantedY,ax
            ; jmp line1370         ;;;; 34an law fi piece 2odamo yersem fi nafs el makan
             aftereditingkingblackupp:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            jmp line1242

            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Sayed 
             editkingwhitedown:;;;; same as king black with swaping of white to black
             cmp existingY,163
            jz aftereditingkingwhitedown
            mov ax,existingY
            add ax,21
            mov highlighty1,ax
            mov bx,existingX
            mov highlightx1,bx
            jmp aftereditingkingwhitedown

            editkingwhiteright:
            cmp existingX,163
            jz aftereditingkingwhiteright
            mov ax,existingx
            add ax,21
            mov highlightx2,ax
            mov bx,existingY
            mov highlighty2,bx
            jmp aftereditingkingwhiteright

            editkingwhiteleft:
            cmp existingX,16
            jz aftereditingkingwhiteleft
            mov ax,existingx
            sub ax,21
            mov highlightx3,ax
            mov bx,existingY
            mov highlighty3,bx
            jmp aftereditingkingwhiteleft

            editkingwhiteupp:
            cmp existingY,16
            jz aftereditingkingwhiteupp
            mov ax,existingY
            sub ax,21
            mov highlighty4,ax
            mov bx,existingX
            mov highlightx4,bx
            jmp aftereditingkingwhiteupp

            editkingwhiteupright:
             cmp existingY,16
            jz aftereditingkingwhiteupright
             cmp existingX,163
            jz aftereditingkingwhiteupright
            mov ax,existingY
            sub ax,21
            mov highlighty5,ax
            mov bx,existingX
            add bx,21
            mov highlightx5,bx
            jmp aftereditingkingwhiteupright

            editkingwhiteupleft:
             cmp existingY,16
            jz aftereditingkingwhiteupleft
             cmp existingX,16
            jz aftereditingkingwhiteupleft
            mov ax,existingY
            sub ax,21
            mov highlighty6,ax
            mov bx,existingX
            sub bx,21
            mov highlightx6,bx
            jmp aftereditingkingwhiteupleft

            editkingwhitedownright:
             cmp existingY,163
            jz aftereditingkingwhitedownright
             cmp existingX,163
            jz aftereditingkingwhitedownright
            mov ax,existingY
            add ax,21
            mov highlighty7,ax
            mov bx,existingX
            add bx,21
            mov highlightx7,bx
            jmp aftereditingkingwhitedownright

            editkingwhitedownleft:
             cmp existingY,163
            jz aftereditingkingwhitedownleft
             cmp existingX,16
            jz aftereditingkingwhitedownleft
            mov ax,existingY
            add ax,21
            mov highlighty8,ax
            mov bx,existingX
            sub bx,21
            mov highlightx8,bx
            jmp aftereditingkingwhitedownleft

            greenareakingwhite:
            cmp arr[si+14],0
             jz editkingwhitedownleft
             cmp arr[si+14],offset pawnblackFilename
             jz editkingwhitedownleft
             cmp arr[si+14],offset rockblackFilename
             jz editkingwhitedownleft
             cmp arr[si+14],offset knightblackFilename
             jz editkingwhitedownleft
             cmp arr[si+14],offset bishopblackFilename
             jz editkingwhitedownleft
             cmp arr[si+14],offset kingblackFilename
             jz editkingwhitedownleft
             cmp arr[si+14],offset queenblackFilename
             jz editkingwhitedownleft
             aftereditingkingwhitedownleft:
            cmp arr[si-18],0
             jz editkingwhiteupleft
             cmp arr[si-18],offset pawnblackFilename
             jz editkingwhiteupleft
             cmp arr[si-18],offset rockblackFilename
             jz editkingwhiteupleft
             cmp arr[si-18],offset knightblackFilename
             jz editkingwhiteupleft
             cmp arr[si-18],offset bishopblackFilename
             jz editkingwhiteupleft
             cmp arr[si-18],offset kingblackFilename
             jz editkingwhiteupleft
             cmp arr[si-18],offset queenblackFilename
             jz editkingwhiteupleft
             aftereditingkingwhiteupleft:
            cmp arr[si-14],0
             jz editkingwhiteupright
             cmp arr[si-14],offset pawnblackFilename
             jz editkingwhiteupright
             cmp arr[si-14],offset rockblackFilename
             jz editkingwhiteupright
             cmp arr[si-14],offset knightblackFilename
             jz editkingwhiteupright
             cmp arr[si-14],offset bishopblackFilename
             jz editkingwhiteupright
             cmp arr[si-14],offset kingblackFilename
             jz editkingwhiteupright
             cmp arr[si-14],offset queenblackFilename
             jz editkingwhiteupright
             aftereditingkingwhiteupright:
            cmp arr[si+18],0
             jz editkingwhitedownright
             cmp arr[si+18],offset pawnblackFilename
             jz editkingwhitedownright
             cmp arr[si+18],offset rockblackFilename
             jz editkingwhitedownright
             cmp arr[si+18],offset knightblackFilename
             jz editkingwhitedownright
             cmp arr[si+18],offset bishopblackFilename
             jz editkingwhitedownright
             cmp arr[si+18],offset kingblackFilename
             jz editkingwhitedownright
             cmp arr[si+18],offset queenblackFilename
             jz editkingwhitedownright
             aftereditingkingwhitedownright:
             cmp arr[si+16],0
             jz editkingwhitedown
             cmp arr[si+16],offset pawnblackFilename
             jz editkingwhitedown
             cmp arr[si+16],offset rockblackFilename
             jz editkingwhitedown
             cmp arr[si+16],offset knightblackFilename
             jz editkingwhitedown
             cmp arr[si+16],offset bishopblackFilename
             jz editkingwhitedown
             cmp arr[si+16],offset kingblackFilename
             jz editkingwhitedown
             cmp arr[si+16],offset queenblackFilename
             jz editkingwhitedown
             aftereditingkingwhitedown:
             cmp arr[si+2],0
             jz editkingwhiteright
             cmp arr[si+2],offset pawnblackFilename
             jz editkingwhiteright
             cmp arr[si+2],offset rockblackFilename
             jz editkingwhiteright
             cmp arr[si+2],offset knightblackFilename
             jz editkingwhiteright
             cmp arr[si+2],offset bishopblackFilename
             jz editkingwhiteright
             cmp arr[si+2],offset kingblackFilename
             jz editkingwhiteright
             cmp arr[si+2],offset queenblackFilename
             jz editkingwhiteright
             aftereditingkingwhiteright:
             cmp arr[si-2],0
             jz editkingwhiteleft
             cmp arr[si-2],offset pawnblackFilename
             jz editkingwhiteleft
             cmp arr[si-2],offset rockblackFilename
             jz editkingwhiteleft
             cmp arr[si-2],offset knightblackFilename
             jz editkingwhiteleft
             cmp arr[si-2],offset bishopblackFilename
             jz editkingwhiteleft
             cmp arr[si-2],offset kingblackFilename
             jz editkingwhiteleft
             cmp arr[si-2],offset queenblackFilename
             jz editkingwhiteleft
             aftereditingkingwhiteleft:
              cmp arr[si-16],0
             jz editkingwhiteupp
              cmp arr[si-16],offset pawnblackFilename
             jz editkingwhiteupp
              cmp arr[si-16],offset rockblackFilename
             jz editkingwhiteupp
              cmp arr[si-16],offset knightblackFilename
             jz editkingwhiteupp
              cmp arr[si-16],offset bishopblackFilename
             jz editkingwhiteupp
              cmp arr[si-16],offset kingblackFilename
             jz editkingwhiteupp
              cmp arr[si-16],offset queenblackFilename
             jz editkingwhiteupp
             jnz aftereditingkingwhiteupp  
            ; mov ax,existingX
            ; mov wantedX,ax
            ; mov ax,existingY
            ; mov wantedY,ax
            ; jmp line1370         ;;;; 34an law fi piece 2odamo yersem fi nafs el makan
             aftereditingkingwhiteupp:    
            highlightgreen highlightx1, highlighty1
            highlightgreen highlightx2, highlighty2
            highlightgreen highlightx3, highlighty3
            highlightgreen highlightx4, highlighty4
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6
            highlightgreen highlightx7, highlighty7
            highlightgreen highlightx8, highlighty8
            jmp line1242
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; end of king validations
;;;;;;;;;;;;;;;;;;zaki;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
           
            ;;;;;;;;;;;;;;;;;;;;;;types of check:check if it is at border -check if there another piece of the same type there 
            greenareaknightblack:;check all availabile and possible positions for knight and assign them for highlight
            cmp existingX,163    ;check position no1 
            je afterx1y1
            cmp existingY,163 
            je afterx1y1
            cmp existingY,142 
            je afterx1y1
             cmp arr[si+34],offset knightblackFilename
            je afterx1y1
            cmp arr[si+34],offset pawnblackFilename
            je afterx1y1 
            cmp arr[si+34],offset kingblackFilename
            je afterx1y1
            cmp arr[si+34],offset bishopblackFilename 
            je afterx1y1       
            cmp arr[si+34],offset queenblackFilename 
            je afterx1y1                             
            mov ax,existingX
            add ax,21
            mov highlightx1,ax
            mov bx,existingY
            add bx,42
            mov highlighty1,bx
            afterx1y1:
             cmp existingX,163 ;check position no2
            je afterx2y2
            cmp existingY,16 
            je afterx2y2
            cmp existingY,37 
            je afterx2y2
             cmp arr[si-30],offset knightblackFilename
            je afterx2y2
            cmp arr[si-30],offset pawnblackFilename
            je afterx2y2 
            cmp arr[si-30],offset kingblackFilename
            je afterx2y2
            cmp arr[si-30],offset bishopblackFilename 
            je afterx2y2       
            cmp arr[si-30],offset queenblackFilename 
            je afterx2y2
             mov ax,existingX
            add ax,21
            mov highlightx2,ax
            mov bx,existingY
            sub bx,42
            mov highlighty2,bx
            afterx2y2:
            cmp existingX,163  ;check position no3
            je afterx3y3
            cmp existingX,142
            je afterx3y3
             cmp existingY,163 
            je afterx3y3
            cmp arr[si+20],offset knightblackFilename
            je  afterx3y3
            cmp arr[si+20],offset pawnblackFilename
            je  afterx3y3 
            cmp arr[si+20],offset kingblackFilename
            je  afterx3y3
            cmp arr[si+20],offset bishopblackFilename 
            je  afterx3y3       
            cmp arr[si+20],offset queenblackFilename 
            je  afterx3y3       
            mov ax,existingX
            add ax,42
            mov highlightx3,ax
            mov bx,existingY
            add bx,21
             mov highlighty3,bx
            afterx3y3:
            cmp existingX,16 ;check position no4
            je afterx4y4
            cmp existingX,37
            je afterx4y4
             cmp existingY,163 
             je afterx4y4
            cmp arr[si+12],offset knightblackFilename
            je  afterx4y4
            cmp arr[si+12],offset pawnblackFilename
            je  afterx4y4 
            cmp arr[si+12],offset kingblackFilename
            je  afterx4y4
            cmp arr[si+12],offset bishopblackFilename 
            je  afterx4y4       
            cmp arr[si+12],offset queenblackFilename 
            je  afterx4y4
             mov ax,existingX
            sub ax,42
            mov highlightx4,ax
            mov bx,existingY
            add bx,21
             mov highlighty4,bx
             afterx4y4:     
           cmp existingX,16 ;check position no5
            je afterx5y5
            cmp existingY,16 
            je afterx5y5
            cmp existingY,37 
            je afterx5y5
             cmp arr[si-34],offset knightblackFilename
            je afterx5y5
            cmp arr[si-34],offset pawnblackFilename
            je afterx5y5 
            cmp arr[si-34],offset kingblackFilename
            je afterx5y5
            cmp arr[si-34],offset bishopblackFilename 
            je afterx5y5       
            cmp arr[si-34],offset queenblackFilename 
            je afterx5y5 
             mov ax,existingX
            sub ax,21
            mov highlightx5,ax
            mov bx,existingY
            sub bx,42
            mov highlighty5,bx 
            afterx5y5:                  
            cmp existingX,16  ;;check position no6
            je afterx6xy6
            cmp existingY,163 
            je afterx6xy6
            cmp existingY,142 
            je afterx6xy6
             cmp arr[si+30],offset knightblackFilename
            je afterx6xy6
            cmp arr[si+30],offset pawnblackFilename
            je afterx6xy6 
            cmp arr[si+30],offset kingblackFilename
            je afterx6xy6
            cmp arr[si+30],offset bishopblackFilename 
            je afterx6xy6       
            cmp arr[si+30],offset queenblackFilename 
            je afterx6xy6                             
            mov ax,existingX
            sub ax,21
            mov highlightx6,ax
            mov bx,existingY
            add bx,42
            mov highlighty6,bx
           afterx6xy6:                        
             cmp existingX,163  ;check position no7
            je afterx7y7
            cmp existingX,142
            je afterx7y7
             cmp existingY,16 
            je afterx7y7
            cmp arr[si-12],offset knightblackFilename
            je  afterx7y7
            cmp arr[si-12],offset pawnblackFilename
            je  afterx7y7 
            cmp arr[si-12],offset kingblackFilename
            je  afterx7y7
            cmp arr[si-12],offset bishopblackFilename 
            je  afterx7y7       
            cmp arr[si-12],offset queenblackFilename 
            je  afterx7y7       
            mov ax,existingX
            add ax,42
            mov highlightx7,ax
            mov bx,existingY
            sub bx,21
             mov highlighty7,bx
            afterx7y7:
             cmp existingX,16  ;check position no8
            je afterx8y8
            cmp existingX,37
            je afterx8y8
             cmp existingY,16 
             je afterx8y8
            cmp arr[si-20],offset knightblackFilename
            je  afterx8y8
            cmp arr[si-20],offset pawnblackFilename
            je  afterx8y8 
            cmp arr[si-20],offset kingblackFilename
            je  afterx8y8
            cmp arr[si-20],offset bishopblackFilename 
            je  afterx8y8       
            cmp arr[si-20],offset queenblackFilename 
            je  afterx8y8
             mov ax,existingX
            sub ax,42
            mov highlightx8,ax
            mov bx,existingY
            sub bx,21
             mov highlighty8,bx    
            afterx8y8:                          
            highlightgreen highlightx1, highlighty1                  
            highlightgreen highlightx2, highlighty2                   
            highlightgreen highlightx3, highlighty3 
            highlightgreen highlightx4, highlighty4   
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6   
            highlightgreen highlightx7, highlighty7      
            highlightgreen highlightx8, highlighty8
            
            jmp line1242




             ;;;;;;;;;;;;;;;;;;;;;;types of check:check if it is at border -check if there another piece of the same type there 
            greenareaknightwhite:;check all availabile and possible positions for knight and assign them for highlight
            cmp existingX,163    ;check position no1 
            je wafterx1y1
            cmp existingY,163 
            je wafterx1y1
            cmp existingY,142 
            je wafterx1y1
             cmp arr[si+34],offset knightwhiteFilename
            je wafterx1y1
            cmp arr[si+34],offset pawnwhiteFilename
            je wafterx1y1 
            cmp arr[si+34],offset kingwhiteFilename
            je wafterx1y1
            cmp arr[si+34],offset bishopwhiteFilename 
            je wafterx1y1       
            cmp arr[si+34],offset queenwhiteFilename 
            je wafterx1y1                            
             cmp arr[si+34],offset rockwhiteFilename 
            je wafterx1y1                              
            mov ax,existingX
            add ax,21
            mov highlightx1,ax
            mov bx,existingY
            add bx,42
            mov highlighty1,bx
            wafterx1y1:
             cmp existingX,163 ;check position no2
            je wafterx2y2
            cmp existingY,16 
            je wafterx2y2
            cmp existingY,37 
            je wafterx2y2
             cmp arr[si-30],offset knightwhiteFilename
            je wafterx2y2
            cmp arr[si-30],offset pawnwhiteFilename
            je wafterx2y2 
            cmp arr[si-30],offset kingwhiteFilename
            je wafterx2y2
            cmp arr[si-30],offset bishopwhiteFilename 
            je wafterx2y2       
            cmp arr[si-30],offset queenwhiteFilename 
            je wafterx2y2
            cmp arr[si-30],offset rockwhiteFilename 
            je wafterx2y2
             mov ax,existingX
            add ax,21
            mov highlightx2,ax
            mov bx,existingY
            sub bx,42
            mov highlighty2,bx
            wafterx2y2:
            cmp existingX,163  ;check position no3
            je wafterx3y3
            cmp existingX,142
            je wafterx3y3
             cmp existingY,163 
            je wafterx3y3
            cmp arr[si+20],offset knightwhiteFilename
            je  wafterx3y3
            cmp arr[si+20],offset pawnwhiteFilename
            je  wafterx3y3 
            cmp arr[si+20],offset kingwhiteFilename
            je  wafterx3y3
            cmp arr[si+20],offset bishopwhiteFilename 
            je  wafterx3y3       
            cmp arr[si+20],offset queenwhiteFilename 
            je  wafterx3y3   
            cmp arr[si+20],offset rockwhiteFilename 
            je  wafterx3y3           
            mov ax,existingX
            add ax,42
            mov highlightx3,ax
            mov bx,existingY
            add bx,21
             mov highlighty3,bx
            wafterx3y3:
            cmp existingX,16 ;check position no4
            je wafterx4y4
            cmp existingX,37
            je wafterx4y4
             cmp existingY,163 
             je wafterx4y4
            cmp arr[si+12],offset knightwhiteFilename
            je  wafterx4y4
            cmp arr[si+12],offset pawnwhiteFilename
            je  wafterx4y4 
            cmp arr[si+12],offset kingwhiteFilename
            je  wafterx4y4
            cmp arr[si+12],offset bishopwhiteFilename 
            je  wafterx4y4       
            cmp arr[si+12],offset queenwhiteFilename 
            je  wafterx4y4
            cmp arr[si+12],offset rockwhiteFilename 
            je  wafterx4y4
             mov ax,existingX
            sub ax,42
            mov highlightx4,ax
            mov bx,existingY
            add bx,21
             mov highlighty4,bx
             wafterx4y4:     
           cmp existingX,16 ;check position no5
            je wafterx5y5
            cmp existingY,16 
            je wafterx5y5
            cmp existingY,37 
            je wafterx5y5
             cmp arr[si-34],offset knightwhiteFilename
            je wafterx5y5
            cmp arr[si-34],offset pawnwhiteFilename
            je wafterx5y5 
            cmp arr[si-34],offset kingwhiteFilename
            je wafterx5y5
            cmp arr[si-34],offset bishopwhiteFilename 
            je wafterx5y5       
            cmp arr[si-34],offset queenwhiteFilename 
            je wafterx5y5 
            cmp arr[si-34],offset rockwhiteFilename 
            je wafterx5y5 
             mov ax,existingX
            sub ax,21
            mov highlightx5,ax
            mov bx,existingY
            sub bx,42
            mov highlighty5,bx 
            wafterx5y5:                  
            cmp existingX,16  ;;check position no6
            je wafterx6xy6
            cmp existingY,163 
            je wafterx6xy6
            cmp existingY,142 
            je wafterx6xy6
             cmp arr[si+30],offset knightwhiteFilename
            je wafterx6xy6
            cmp arr[si+30],offset pawnwhiteFilename
            je wafterx6xy6 
            cmp arr[si+30],offset kingwhiteFilename
            je wafterx6xy6
            cmp arr[si+30],offset bishopwhiteFilename 
            je wafterx6xy6       
            cmp arr[si+30],offset queenwhiteFilename 
            je wafterx6xy6                             
             cmp arr[si+30],offset rockwhiteFilename 
            je wafterx6xy6                             
            mov ax,existingX
            sub ax,21
            mov highlightx6,ax
            mov bx,existingY
            add bx,42
            mov highlighty6,bx
           wafterx6xy6:                        
             cmp existingX,163  ;check position no7
            je wafterx7y7
            cmp existingX,142
            je wafterx7y7
             cmp existingY,16 
            je wafterx7y7
            cmp arr[si-12],offset knightwhiteFilename
            je  wafterx7y7
            cmp arr[si-12],offset pawnwhiteFilename
            je  wafterx7y7 
            cmp arr[si-12],offset kingwhiteFilename
            je  wafterx7y7
            cmp arr[si-12],offset bishopwhiteFilename 
            je  wafterx7y7       
            cmp arr[si-12],offset queenwhiteFilename 
            je  wafterx7y7       
            cmp arr[si-12],offset rockwhiteFilename 
            je  wafterx7y7       
            mov ax,existingX
            add ax,42
            mov highlightx7,ax
            mov bx,existingY
            sub bx,21
             mov highlighty7,bx
            wafterx7y7:
             cmp existingX,16  ;check position no8
            je wafterx8y8
            cmp existingX,37
            je wafterx8y8
             cmp existingY,16 
             je wafterx8y8
            cmp arr[si-20],offset knightwhiteFilename
            je  wafterx8y8
            cmp arr[si-20],offset pawnwhiteFilename
            je  wafterx8y8 
            cmp arr[si-20],offset kingwhiteFilename
            je  wafterx8y8
            cmp arr[si-20],offset bishopwhiteFilename 
            je  wafterx8y8       
            cmp arr[si-20],offset queenwhiteFilename 
            je  wafterx8y8
             cmp arr[si-20],offset rockwhiteFilename 
            je  wafterx8y8
             mov ax,existingX
            sub ax,42
            mov highlightx8,ax
            mov bx,existingY
            sub bx,21
             mov highlighty8,bx     
            wafterx8y8:                          
            highlightgreen highlightx1, highlighty1                  
            highlightgreen highlightx2, highlighty2                   
            highlightgreen highlightx3, highlighty3 
            highlightgreen highlightx4, highlighty4   
            highlightgreen highlightx5, highlighty5
            highlightgreen highlightx6, highlighty6   
            highlightgreen highlightx7, highlighty7      
            highlightgreen highlightx8, highlighty8
            ;;;;;;;;;;;;;;;; end of knight validation
            jmp line1242  
            ;;;;; this section is for drawing pieces after movement valdiaton
              DrawOnX16:
             cmp wantedY,16
             jz DrawOnY16and16
             cmp wantedY,37
             jz DrawOnY16and37
             cmp wantedY,58
             jz DrawOnY16and58
             cmp wantedY,79
             jz DrawOnY16and79
             cmp wantedY,100
             jz DrawOnY16and100
             cmp wantedY,121
             jz DrawOnY16and121
             cmp wantedY,142
             jz DrawOnY16and142
             cmp wantedY,163
             jz DrawOnY16and163

             DrawOnX37:
             cmp wantedY,16
             jz DrawOnY37and16
             cmp wantedY,37
             jz DrawOnY37and37
             cmp wantedY,58
             jz DrawOnY37and58
             cmp wantedY,79
             jz DrawOnY37and79
             cmp wantedY,100
             jz DrawOnY37and100
             cmp wantedY,121
             jz DrawOnY37and121
             cmp wantedY,142
             jz DrawOnY37and142
             cmp wantedY,163
             jz DrawOnY37and163

             DrawOnX58:
             cmp wantedY,16
             jz DrawOnY58and16
             cmp wantedY,37
             jz DrawOnY58and37
             cmp wantedY,58
             jz DrawOnY58and58
             cmp wantedY,79
             jz DrawOnY58and79
             cmp wantedY,100
             jz DrawOnY58and100
             cmp wantedY,121
             jz DrawOnY58and121
             cmp wantedY,142
             jz DrawOnY58and142
             cmp wantedY,163
             jz DrawOnY58and163
             
             DrawOnX79:
             cmp wantedY,16
             jz DrawOnY79and16
             cmp wantedY,37
             jz DrawOnY79and37
             cmp wantedY,58
             jz DrawOnY79and58
             cmp wantedY,79
             jz DrawOnY79and79
             cmp wantedY,100
             jz DrawOnY79and100
             cmp wantedY,121
             jz DrawOnY79and121
             cmp wantedY,142
             jz DrawOnY79and142
             cmp wantedY,163
             jz DrawOnY79and163
             
             DrawOnX100:
             cmp wantedY,16
             jz DrawOnY100and16
             cmp wantedY,37
             jz DrawOnY100and37
             cmp wantedY,58
             jz DrawOnY100and58
             cmp wantedY,79
             jz DrawOnY100and79
             cmp wantedY,100
             jz DrawOnY100and100
             cmp wantedY,121
             jz DrawOnY100and121
             cmp wantedY,142
             jz DrawOnY100and142
             cmp wantedY,163
             jz DrawOnY100and163

              DrawOnX121:
             cmp wantedY,16
             jz DrawOnY121and16
             cmp wantedY,37
             jz DrawOnY121and37
             cmp wantedY,58
             jz DrawOnY121and58
             cmp wantedY,79
             jz DrawOnY121and79
             cmp wantedY,100
             jz DrawOnY121and100
             cmp wantedY,121
             jz DrawOnY121and121
             cmp wantedY,142
             jz DrawOnY121and142
             cmp wantedY,163
             jz DrawOnY121and163

              DrawOnX142:
             cmp wantedY,16
             jz DrawOnY142and16
             cmp wantedY,37
             jz DrawOnY142and37
             cmp wantedY,58
             jz DrawOnY142and58
             cmp wantedY,79
             jz DrawOnY142and79
             cmp wantedY,100
             jz DrawOnY142and100
             cmp wantedY,121
             jz DrawOnY142and121
             cmp wantedY,142
             jz DrawOnY142and142
             cmp wantedY,163
             jz DrawOnY142and163

             DrawOnX163:
             cmp wantedY,16
             jz DrawOnY163and16
             cmp wantedY,37
             jz DrawOnY163and37
             cmp wantedY,58
             jz DrawOnY163and58
             cmp wantedY,79
             jz DrawOnY163and79
             cmp wantedY,100
             jz DrawOnY163and100
             cmp wantedY,121
             jz DrawOnY163and121
             cmp wantedY,142
             jz DrawOnY163and142
             cmp wantedY,163
             jz DrawOnY163and163
                  
;;;;;;; this section to draw the piece on the selected offeset and store it in array
              DrawOnY16and16:
                              cmp existingOffset,0000
                               jz continue
                            DrawOne 16,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY16and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 16,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY16and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 16,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY16and79:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 16,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY16and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 16,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY16and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 16,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY16and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 16,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY16and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 16,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue

              DrawOnY37and16:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY37and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY37and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY37and79:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY37and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY37and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY37and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY37and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 37,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue

              DrawOnY58and16:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY58and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY58and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY58and79:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY58and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY58and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY58and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY58and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 58,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue

              DrawOnY79and16:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY79and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY79and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY79and79:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY79and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY79and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY79and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY79and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 79,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue

              DrawOnY100and16:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY100and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY100and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY100and79:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY100and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY100and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY100and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY100and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 100,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue

              DrawOnY121and16:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 121,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY121and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 121,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY121and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 121,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY121and79:
                            DrawOne 121,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY121and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 121,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY121and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 121,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY121and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 121,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY121and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 121,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue

              DrawOnY142and16:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY142and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY142and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY142and79:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY142and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY142and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY142and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY142and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 142,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue

              DrawOnY163and16:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,16,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY163and37:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,37,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY163and58:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,58,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY163and79:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,79,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY163and100:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,100,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY163and121:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,121,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
              DrawOnY163and142:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,142,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            
                            jmp continue
              DrawOnY163and163:
                                cmp existingOffset,0000
                               jz continue
                            DrawOne 163,163,PieceFilehandle,existingOffset,PieceData,PieceWidth,PieceHeight
                            jmp continue
                            ;;;;;;;end of this section
;;;;;;;;;;;;;;;;;;; this section is responsible for drawing the killed pieces;;;;;;;;;;;
               draw1knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 200,16,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked

               draw2knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 221,16,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked

               draw3knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 242,16,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw4knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 263,16,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw5knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 284,16,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw6knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 305,16,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw7knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 200,37,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw8knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 221,37,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw9knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 242,37,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw10knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 263,37,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw11knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 284,37,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
              
               draw12knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 305,37,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw13knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 200,58,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw14knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 221,58,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw15knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 242,58,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw16knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 263,58,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw17knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 284,58,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw18knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 305,58,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw19knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 200,79,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw20knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 221,79,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw21knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 242,79,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw22knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 263,79,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw23knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 284,79,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
              
               draw24knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 305,79,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw25knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 200,100,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw26knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 221,100,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw27knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 242,100,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw28knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 263,100,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw29knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 284,100,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw30knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 305,100,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
               
               draw31knock:
               cmp knockedoffset,0
               jz dontdraw
              DrawOne 200,121,PieceFilehandle,   knockedoffset,PieceData,PieceWidth,PieceHeight
              mov knockedoffset,0
              inc numberofknocked
              jmp afterdrawknocked
              ;;;;;;;;;;;;;;;;the end of this section;;;;;;;;
              
              

              first:;;;;;;;;;;;drawing the pieces in the beginning of the game;
             
              ; 2nd row has y = 37
              ; 1st row has y = 15
              ; 2nd row  from down has y = 143
              ; 1st row has y = 15
            mov ax,offset sbarFilename
            mov timeroffset,ax
            DrawOne 210,150, PieceFilehandle,timeroffset,sbarData,BarWidth,BarHeight
            DrawOne 0,0,BoardFilehandle,offsetBoardFilename,BoardData,BoardWidth,BoardHeight 

            DrawOne 16,16,PieceFilehandle,     arr,PieceData,PieceWidth,PieceHeight
            DrawOne 163,16,PieceFilehandle,    arr[14],PieceData,PieceWidth,PieceHeight
            DrawOne 58,16,PieceFilehandle,     arr[4],PieceData,PieceWidth,PieceHeight
            DrawOne 121,16,PieceFilehandle,    arr[10],PieceData,PieceWidth,PieceHeight
            DrawOne 142,16,PieceFilehandle,    arr[12],PieceData,PieceWidth,PieceHeight
            DrawOne 37,16,PieceFilehandle,     arr[2],PieceData,PieceWidth,PieceHeight
            DrawOne 100,16,PieceFilehandle,    arr[8],PieceData,PieceWidth,PieceHeight
            DrawOne 79,16,PieceFilehandle,     arr[6],PieceData,PieceWidth,PieceHeight



            DrawOne 16,37,PieceFilehandle,     arr[16],PieceData,PieceWidth,PieceHeight  
            DrawOne 37,37,PieceFilehandle,     arr[18],PieceData,PieceWidth,PieceHeight
            DrawOne 58,37,PieceFilehandle,     arr[20],PieceData,PieceWidth,PieceHeight
            DrawOne 79,37,PieceFilehandle,     arr[22],PieceData,PieceWidth,PieceHeight
            DrawOne 100,37,PieceFilehandle,    arr[24],PieceData,PieceWidth,PieceHeight
            DrawOne 121,37,PieceFilehandle,    arr[26],PieceData,PieceWidth,PieceHeight
            DrawOne 142,37,PieceFilehandle,    arr[28],PieceData,PieceWidth,PieceHeight
            DrawOne 163,37,PieceFilehandle,    arr[30],PieceData,PieceWidth,PieceHeight

            DrawOne 16,142,PieceFilehandle,    arr[96],PieceData,PieceWidth,PieceHeight  
            DrawOne 37,142,PieceFilehandle,    arr[98],PieceData,PieceWidth,PieceHeight
            DrawOne 58,142,PieceFilehandle,    arr[100],PieceData,PieceWidth,PieceHeight
            DrawOne 79,142,PieceFilehandle,    arr[102],PieceData,PieceWidth,PieceHeight
            DrawOne 100,142,PieceFilehandle,   arr[104],PieceData,PieceWidth,PieceHeight
            DrawOne 121,142,PieceFilehandle,   arr[106],PieceData,PieceWidth,PieceHeight
            DrawOne 142,142,PieceFilehandle,   arr[108],PieceData,PieceWidth,PieceHeight
            DrawOne 163,142,PieceFilehandle,   arr[110],PieceData,PieceWidth,PieceHeight

            DrawOne 16,163,PieceFilehandle,    arr[112],PieceData,PieceWidth,PieceHeight
            DrawOne 37,163,PieceFilehandle,    arr[114],PieceData,PieceWidth,PieceHeight           
            DrawOne 58,163,PieceFilehandle,    arr[116],PieceData,PieceWidth,PieceHeight
            DrawOne 79,163,PieceFilehandle,    arr[118],PieceData,PieceWidth,PieceHeight
            DrawOne 100,163,PieceFilehandle,   arr[120],PieceData,PieceWidth,PieceHeight
            DrawOne 121,163,PieceFilehandle,   arr[122],PieceData,PieceWidth,PieceHeight
            DrawOne 142,163,PieceFilehandle,   arr[124],PieceData,PieceWidth,PieceHeight
            DrawOne 163,163,PieceFilehandle,   arr[126],PieceData,PieceWidth,PieceHeight

             DrawOne 16,100,PieceFilehandle,   arr[64],PieceData,PieceWidth,PieceHeight
            ;;;;;;;;;;;;;;;;;;;;;
            continue:;;;;;; this validation to  check if  the killed is drawn or not
             cmp zikoknockedoffset,1
             jz dontdraw

            cmp knockedoffset,offset PowerFilename
            jz dontdraw


             cmp knockedoffset,0
             jz dontdraw
             cmp numberofknocked,0
             jz draw1knock
             cmp numberofknocked,1
             jz draw2knock
             cmp numberofknocked,2
             jz draw3knock
             cmp numberofknocked,3
             jz draw4knock
             cmp numberofknocked,4
             jz draw5knock
             cmp numberofknocked,5
             jz draw6knock
             cmp numberofknocked,6
             jz draw7knock
             cmp numberofknocked,7
             jz draw8knock
             cmp numberofknocked,8
             jz draw9knock
             cmp numberofknocked,9
             jz draw10knock
             cmp numberofknocked,10
             jz draw11knock
             cmp numberofknocked,11
             jz draw12knock
             cmp numberofknocked,12
             jz draw13knock
             cmp numberofknocked,13
             jz draw14knock
             cmp numberofknocked,14
             jz draw15knock
             cmp numberofknocked,15
             jz draw16knock
             cmp numberofknocked,16
             jz draw17knock
             cmp numberofknocked,17
             jz draw18knock
             cmp numberofknocked,18
             jz draw19knock
             cmp numberofknocked,19
             jz draw20knock
             cmp numberofknocked,20
             jz draw21knock
             cmp numberofknocked,21
             jz draw22knock
             cmp numberofknocked,22
             jz draw23knock
             cmp numberofknocked,23
             jz draw24knock
             cmp numberofknocked,24
             jz draw25knock
             cmp numberofknocked,25
             jz draw26knock
             cmp numberofknocked,26
             jz draw27knock
             cmp numberofknocked,27
             jz draw28knock
             cmp numberofknocked,28
             jz draw29knock
             cmp numberofknocked,29
             jz draw30knock
             cmp numberofknocked,30
             jz draw31knock
             
             afterdrawknocked:
             mov ah,2 
             mov dl,7
             int 21h 
              dontdraw:
;;;;;;;;;;;;;;;;;;;;; check  if any of kings are dead or not;;;;;;;;;;;;;;;;
              mov zikoknockedoffset,0
              jmp checkforblackcheckmate
              aftercheckforblackcheckmate:
              jmp checkforwhitecheckmate
              aftercheckforwhitecheckmate:

            mov cx,63
            mov di,0
            searchforwhitekinginthearray:
            cmp arr[di],offset kingwhiteFilename
            jz whitekingexist
            add di,2
            dec cx
            jnz searchforwhitekinginthearray

            cmp arr[126],offset kingwhiteFilename
            jz whitekingexist
            jmp endgamelabelP1
            whitekingexist:

             mov cx,63
            mov di,0
            searchforblackkinginthearray:
            cmp arr[di],offset kingblackFilename
            jz blackkingexist
            add di,2
            dec cx
            jnz searchforblackkinginthearray

            cmp arr[126],offset kingblackFilename
            jz blackkingexist
            jmp endgamelabelP1
            blackkingexist:

             
              continuegame:

            mov ah,2
            mov dx,0000
            int 10h;; cursor at 0,0
           

           
           ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
           
            mov ax,tempx
            mov x,ax
            mov ax,tempy
            mov y,ax
            highlight x , y
            highlight2 x2 , y2
            scanchar x , y
           
            mov dx,x
            mov existingX,dx  
            ;    first iput num in existingX 

             MOV DX,0
            MOV BL,100D
            
            mov dx,y
            mov existingY,dx  
           ; dehighlight x,y
            ;    2nd iput num in existingY                ;  ; [ r * 8 + c ] * 2 = index

            mov ax,offset blackBoxFilename      ; delete timer icon
            mov timeroffset,ax
            DrawOne 291,100, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            clearStatusBar
             mov ah,2
                  mov dx,0000
                  int 10h;; cursor at 0,0
                  mov ah, 9
                  mov dx, offset nocheckMess
                  int 21h
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            cmp existingX,16
            jz Xis16
            cmp existingX,37
            jz Xis37
            cmp existingX,58
            jz Xis58
            cmp existingX,79
            jz Xis79
            cmp existingX,100
            jz Xis100
            cmp existingX,121
            jz Xis121
            cmp existingX,142
            jz Xis142
            cmp existingX,163
            jz Xis163
           
           jmp secondinput

            Xis16:
            mov AL,0d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput
            
            Xis37:
            mov AL,1d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput

            Xis58:
            mov AL,2d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput

             Xis79:
            mov AL,3d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput

             Xis100:
            mov AL,4d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput

             Xis121:
            mov AL,5d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput

             Xis142:
            mov AL,6d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput

             Xis163:
            mov AL,7d
            mov col,AL
            cmp existingY,16
            jz Yis16
            cmp existingY,37
            jz Yis37
            cmp existingY,58
            jz Yis58
            cmp existingY,79
            jz Yis79
            cmp existingY,100
            jz Yis100
            cmp existingY,121
            jz Yis121
            cmp existingY,142
            jz Yis142
            cmp existingY,163
            jz Yis163
            jmp secondinput

            Yis16:
            mov AL,0d
            mov row,AL
            jmp getfilename

            Yis37:
            mov AL,1d
            mov row,AL
            jmp getfilename

            Yis58:
            mov AL,2d
            mov row,AL
            jmp getfilename

            Yis79:
            mov AL,3d
            mov row,AL
            jmp getfilename

            Yis100:
            mov AL,4d
            mov row,AL
            jmp getfilename

            Yis121:
            mov AL,5d
            mov row,AL
            jmp getfilename

            Yis142:
            mov AL,6d
            mov row,AL
            jmp getfilename

            Yis163:
            mov AL,7d
            mov row,AL
            jmp getfilename

            getfilename:   ;;;;;;;;;;;;;;;         index =  [row * 8   + col] * 2 

          
            mov cx,28
            mov si,0
            myloop:
            mov highlightx1[si],0
            inc si
            inc si
            dec cx
            jnz myloop


            mov ah,0
            mov al,8
            MUL row   ; ax = 8 * row
            add AL , col  ; ax =   [ 8 * row  ]  + col
            mov indexOver2,al
            mov al,2
            mul indexOver2  ; ax = [row * 8   + col] * 2 = index
            mov index ,AX

            mov si,index
            mov ax,arr[si]
            mov existingOffset,ax

            cmp checkQP,1
            je checkQ
            cmp checkQP,2
            je checkP


            checkQ:
            cmp ax,65
            JBE drawonthesamepawn2
            jmp aftercheckingQP

             checkP:
            cmp ax,65
            JAE drawonthesamepawn2

            aftercheckingQP:

            mov AH,2Ch
            int 21h

            mov dl,dh
            mov dh,0
            cmp arrTime[si],0
            jz dummy
            mov ax,arrTime[si]
            cmp existingOffset,65
            JBE SetTimerBlack

            cmp existingOffset,65
            JAE SetTimerWhitle

            ContTimer:
            
            cmp ax,dx
            jG Timer
            cmp ax,dx
            jz TimerClear
            dummy:
            mov arrTime[si],0
            ;;;;;;;;;;;;;;;;;;;;;;;;;;cmp offset and pieces that are selected by  user so it can highlight
            
            cmp existingOffset, offset pawnblackFilename
            jz greenareapawnblack
             cmp existingOffset, offset pawnwhiteFilename
            jz greenareapawnwhite
            cmp existingOffset, offset kingblackFilename
            jz greenareakingblack
             cmp existingOffset, offset kingwhiteFilename
            jz greenareakingwhite
            cmp existingOffset, offset bishopblackFilename
            jz greenareabishipblack
            cmp existingOffset, offset bishopwhiteFilename
            jz greenareabishipWhite
             cmp existingOffset, offset knightblackFilename
            jz greenareaknightblack
            cmp existingOffset, offset knightwhiteFilename
            jz greenareaknightwhite
            cmp existingOffset, offset rockwhiteFilename
            jz greenarearookwhite
            cmp existingOffset, offset rockblackFilename
            jz greenarearookblack
            cmp existingOffset, offset queenblackFilename
            jz greenareaqueenblack
            cmp existingOffset, offset queenwhiteFilename
            jz greenareaqueenwhite
            
          
            line1242:
               
            mov arr[si],0000 ;;;;; what value should be put in arr[index] (the first choosed cell that we take the picture from it)
                                ;; i put 0000 but this make the code act wrong 
            cmp existingOffset,0000
            jz continue
            

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

            secondinput:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            MOV DX,0
            MOV BL,100D
            mov ah,0Dh
            mov cx,x+4
            mov dx,y+4
            int 10H ; AL = COLOR
            ;deletep x,y
             mov ax,tempx
            mov x,ax
            mov ax,tempy
            mov y,ax 
             
           highlight x,y
           highlight2 x2,y2
           
           scanchar x,y
           

            mov dx,x
            mov wantedX,dx  
            ;    third iput num in wantedx 

             mov dx,y
            mov wantedY,dx  
            dehighlight x,y
            ;    fourth iput num in wantedy 


       mov si,0h
            mov dx,28   
            LP:
            mov cx,0
            mov ax,wantedX
            mov bx,wantedY
            cmp ax,highlightx1[si]
            jNE NotEqualX
               inc cx
            NotEqualX:
            inc si
            inc si
            cmp bx,highlightx1[si]
            JNE NotEqualY
               inc cx
            NotEqualY:
            cmp cx,2
            je FoundXAndY
            dec dx
            jnz LP

            jmp drawonthesamepawn
        FoundXAndY:
           
            ;;;;;;;;;;;;;;;;;;;;;
            line1370:;;;;;;;;;;;;;;;;;;   34an law fi piece 2odamo yersem fi nafs el makan
            ;;;;;;;;;;;;;;;;;;;;;;;;;to dehighlight the available movement of th selected piecces
             dehighlight highlightx1,highlighty1
               dehighlight highlightx2,highlighty2
               dehighlight highlightx3,highlighty3
               dehighlight highlightx4,highlighty4
               dehighlight highlightx5, highlighty5
               dehighlight highlightx6, highlighty6
               dehighlight highlightx7, highlighty7
               dehighlight highlightx8, highlighty8
               dehighlight highlightx9, highlighty9
               dehighlight highlightx10, highlighty10
               dehighlight highlightx11, highlighty11
               dehighlight highlightx12, highlighty12
               dehighlight highlightx13, highlighty13
               dehighlight highlightx14, highlighty14
               dehighlight highlightx15, highlighty15
               dehighlight highlightx16, highlighty16
               dehighlight highlightx17, highlighty17
               dehighlight highlightx18, highlighty18
               dehighlight highlightx19, highlighty19
               dehighlight highlightx20, highlighty20
               dehighlight highlightx21, highlighty21
               dehighlight highlightx22, highlighty22
               dehighlight highlightx23, highlighty23
               dehighlight highlightx24, highlighty24
               dehighlight highlightx25, highlighty25
               dehighlight highlightx26, highlighty26
               dehighlight highlightx27, highlighty27
               
;;;;;;;;;;;;;;;;;;;;;;;;;; second user

            cmp wantedX,16
            jz wantedXis16
            cmp wantedX,37
            jz wantedXis37
            cmp wantedX,58
            jz wantedXis58
            cmp wantedX,79
            jz wantedXis79
            cmp wantedX,100
            jz wantedXis100
            cmp wantedX,121
            jz wantedXis121
            cmp wantedX,142
            jz wantedXis142
            cmp wantedX,163
            jz wantedXis163
           
           jmp continue

            wantedXis16:
            mov AL,0d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue
            
            wantedXis37:
            mov AL,1d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue

            wantedXis58:
            mov AL,2d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue

             wantedXis79:
            mov AL,3d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue

             wantedXis100:
            mov AL,4d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue

             wantedXis121:
            mov AL,5d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue

             wantedXis142:
            mov AL,6d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue

             wantedXis163:
            mov AL,7d
            mov col,AL
            cmp wantedY,16
            jz wantedYis16
            cmp wantedY,37
            jz wantedYis37
            cmp wantedY,58
            jz wantedYis58
            cmp wantedY,79
            jz wantedYis79
            cmp wantedY,100
            jz wantedYis100
            cmp wantedY,121
            jz wantedYis121
            cmp wantedY,142
            jz wantedYis142
            cmp wantedY,163
            jz wantedYis163
            jmp continue

            wantedYis16:
            mov AL,0d
            mov row,AL
            jmp putfilename

            wantedYis37:
            mov AL,1d
            mov row,AL
            jmp putfilename

            wantedYis58:
            mov AL,2d
            mov row,AL
            jmp putfilename

            wantedYis79:
            mov AL,3d
            mov row,AL
            jmp putfilename

            wantedYis100:
            mov AL,4d
            mov row,AL
            jmp putfilename

            wantedYis121:
            mov AL,5d
            mov row,AL
            jmp putfilename

            wantedYis142:
            mov AL,6d
            mov row,AL
            jmp putfilename

            wantedYis163:
            mov AL,7d
            mov row,AL
            jmp putfilename
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;end of this section
            putfilename:

             mov ah,0
            mov al,8
            MUL row   ; ax = 8 * row
            add AL , col  ; ax =   [ 8 * row  ]  + col
            mov indexOver2,al
            mov al,2
            mul indexOver2  ; ax = [row * 8   + col] * 2 = index
            mov index ,AX


            mov si,index
            mov ax,arr[si]
            cmp timervar,0
            jnz NoKnock
            mov knockedoffset,ax


            cmp knockedoffset , offset PowerFilename
            jnz Nopower
            cmp existingOffset,65
            JAE TimerW
                mov timervar3,2
                jmp Nopower
            TimerW:
              mov timervar2,2
            Nopower:
            NoKnock:
            cmp timervar,1
            jnz DecTimer
               dec timervar
            DecTimer:
            mov ax,existingOffset
            mov arr[si],AX
            mov AH,2Ch
            int 21h
            mov dl,dh
            mov dh,0
            mov arrtime[si],dx
            
            dehighlight existingX,existingY
            
           ;;;;;;;;;;;;;;;;;;;;;
            cmp wantedX,16
            jz DrawOnX16

            cmp wantedX,37
            jz DrawOnX37

            cmp wantedX,58
            jz DrawOnX58

            cmp wantedX,79
            jz DrawOnX79

            cmp wantedX,100
            jz DrawOnX100

            cmp wantedX,121
            jz DrawOnX121

            cmp wantedX,142
            jz DrawOnX142

            cmp wantedX,163
            jz DrawOnX163
            
            jmp continue
;;;;;;;;;;;;;;;;;;;timer label and validation
            Timer:
            mov ax,offset timerFilename
            mov timeroffset,ax
            DrawOne 291,100, PieceFilehandle,timeroffset,PieceData,PieceWidth,PieceHeight
            inc timervar 
            mov al,0
            mov ah,2
            mov dx,141ch  
            int 10h
            mov dx, offset TimerONmsg1
            mov ah, 9
            int 21h
             mov al,0
            mov ah,2
            mov dx,151ch  
            int 10h
            mov dx, offset TimerONmsg2
           
            mov ah, 9
            int 21h
             mov al,0
            mov ah,2
            mov dx,161ch  
            int 10h
            mov dx, offset TimerONmsg3

           ;;;;;;;;;;end timer
            mov ah, 9
            int 21h
            mov knockedoffset,0
              
              
            jmp drawonthesamepawn
;;;;;;;;;;;;;;;;;;;;;;;;;;;p1 wisn
            TimerClear:
            clearStatusBar
            jmp dummy
            endgamelabelP1:
             mov al,1
             mov WhoWins,al
             jmp endgamelabel
          ;;;;;;;;;;;;;;;;p2 wins
           endgamelabelP2:
             mov al,2
             mov WhoWins,al
             jmp endgamelabel
          ;;;;;;;;;;;;;;wining validations 
          SetTimerBlack:
          add ax,timervar3
          jmp ContTimer
           SetTimerWhitle:
          add ax, timervar2
          jmp ContTimer
           endgamelabel:
             mov ah,2
            mov dx,151ch  
            int 10h
            cmp al,1
            jnz P1
            mov dx, offset endgamemsgP1
            jmp FoundWinner
            p1: 
            mov dx, offset endgamemsgP2
            FoundWinner:
            mov ah, 9
            int 21h
            mov ah,2
            mov dx,171ch  
            int 10h
            mov dx, offset Winner
           
            mov ah, 9
            int 21h
            mov ah,0
            int 16h
             ExitChat:
           mainscreen
   exprog:
    hlt   
MAIN ENDP
END MAIN