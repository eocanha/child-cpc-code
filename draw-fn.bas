10 ON ERROR GOTO 120:MODE 1:BORDER 13:INK 1,26:INK 2,18:INK 3,9:SYMBOL AFTER 160:PRINT "????????H0":WINDOW #1,1,40,24,25:PAPER #1,2:PEN #1,1:inicio=-5:fin=5:salto=0.1:ampx=20:ampy=20:h=0.00001:RAD:ejex=320:ejey=200:ORIGIN ejex,ejey:ret=1:GOTO 1000
11 ret=0
20 GOSUB 100
30 GOSUB 70
40 IF INKEY(13)=0 THEN 130 ELSE IF INKEY(14)=0 THEN 150 ELSE IF INKEY(5)=0 THEN 180 ELSE IF INKEY(20)=0 THEN 240 ELSE IF INKEY(12)=0 THEN 270 ELSE IF INKEY(4)=0 THEN 390 ELSE 40
50 :'
60 REM ESCRIBE MENU
70 CLS #1:PRINT #1,"F1=f(x)  F2=f'(x) F3=?f(x) F4=[a,b]?f(x)F5=DATOS F6=BORRA":RETURN
80 :'
90 REM DIBUJA EJES & RETICULA
100 CLS:GRAPHICS PEN 3:FOR r=0 TO -321 STEP -ampx:MOVE r,-200:DRAWR 0,400:NEXT:FOR r=0 TO 321 STEP ampx:MOVE r,-200:DRAWR 0,400:NEXT:FOR r=0 TO -201 STEP -ampy:MOVE -320,r:DRAWR 640,0:NEXT:FOR r=0 TO 201 STEP ampy:MOVE -320,r:DRAWR 640,0:NEXT
110 GRAPHICS PEN 2:MOVE 0,200:DRAWR 0,-400:MOVE -320,0:DRAWR 640,0:GRAPHICS PEN 1:RETURN
120 RESUME NEXT
130 FOR x=inicio TO fin STEP salto:PLOT x*ampx,FNy*ampy,1
140 NEXT:GOTO 30
150 FOR x=inicio TO fin STEP salto
160 y=FNy:x2=x:x=x+h:yh=FNy:x=x2:y2=(yh-y)/h:PLOT x*ampx,y2*ampy,2
170 NEXT:GOTO 30
180 CLS #1:CLEAR INPUT:INPUT #1,"INTRODUCE LA CONSTANTE DE INTEGRACION:  ",k:p=k:FOR x=salto TO fin STEP salto
190 p=p+(salto*FNy):PLOT x*ampx,p*ampy,2
200 NEXT:p=0
210 p=k:FOR x=-salto TO inicio STEP -salto
220 p=p+(-salto*FNy):PLOT x*ampx,p*ampy,2
230 NEXT:GOTO 30
240 CLS #1:PRINT #1," ### ESTOY CALCULANDO [a,b]?F(x) ###"
250 I=0:FOR x=inicio TO fin STEP salto:I=I+(FNy*salto)
260 NEXT:PRINT #1," ?F(x)=";ROUND(I,5):CLEAR INPUT:WHILE INKEY$="":WEND:GOTO 30
270 LOCATE 1,1:PRINT "[";inicio;",";fin;"]":PRINT "SALTO:";salto:PRINT "ampliacion de las X:";ampx:PRINT "ampliacion de las Y:";ampy:CLS #1:PRINT #1,"F1=f(x) F2=[a F3=b] F4=SALTO F5=ampX"
271 PRINT #1,"F6=ampY F7=EJES ";:PEN #1,3:PRINT #1,"F8=NUEVO";:PEN #1,1:PRINT #1," F0=MENU PRINC."
280 IF INKEY(13)=0 THEN 300 ELSE IF INKEY(14)=0 THEN 330 ELSE IF INKEY(5)=0 THEN 340 ELSE IF INKEY(20)=0 THEN 350 ELSE IF INKEY(12)=0 THEN 360 ELSE IF INKEY(4)=0 THEN 370 ELSE IF INKEY(10)=0 THEN 380 ELSE IF INKEY(15)=0 THEN GOSUB 100:GOTO 30
290 IF INKEY(11)=0 THEN RUN ELSE GOTO 280
300 CLS #1:CLEAR INPUT
310 WINDOW #1,1,40,15,25:CLS #1:PRINT #1,"INTRODUCE LA FORMULA Y PULSA [RETURN]":KEY 141,CHR$(13)+"GOTO 1000"+CHR$(13):KEY DEF 18,1,141
320 ON ERROR GOTO 400:WINDOW SWAP 0,1:EDIT 1000
321 KEY DEF 18,1,13:ON ERROR GOTO 120:CLS:WINDOW SWAP 1,0:WINDOW #1,1,40,24,25:GOTO 270
330 CLS #1:CLEAR INPUT:INPUT #1,"NUEVO INICIO DE [a,b]:",inicio:GOTO 270
340 CLS #1:CLEAR INPUT:INPUT #1,"NUEVO FIN DE [a,b]:",fin:GOTO 270
350 CLS #1:CLEAR INPUT:INPUT #1,"NUEVO SALTO:",salto:GOTO 270
360 CLS #1:CLEAR INPUT:INPUT #1,"NUEVA ampX:",ampx:GOTO 270
370 CLS #1:CLEAR INPUT:INPUT #1,"NUEVA ampY:",ampy:GOTO 270
380 CLS #1:PRINT #1,"COORD.ACTUALES: X=";ejex;" Y=";ejey:CLEAR INPUT:INPUT #1,"(X,Y) NUEVAS:",ejex,ejey:ORIGIN ejex,ejey:GOTO 270
390 CLS:GOSUB 100:GOTO 30
400 RESUME 320
1000 DEF FNy=SIN(x)
1010 IF ret=1 THEN 11 ELSE 321
