%%%%%%%%%%%%%%%%%%%%%%%%%% PRIMERA PARTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Se define figura para posteriormente poder guardar las gr�ficas
figure1 = figure;
%Se especifica que los ejes de las figuras son los que se definir�n para 
%cada gr�fica por separado 
axes1 = axes('Parent', figure1);

%Definici�n de denominador para ecuaci�nn
den= [13 -4 20];
%Definici�n de numerador para ecuaci�n
num = [3 25];
%Definici�n de funci�n de transferencia para segunda ecuaci�n
G = tf(num, den);

%Gr�fico de respuesta continua al escal�n
step(num, den)
%Se a�ade t�tulo al gr�fico
title('Gr�fico de respuesta continua al escal�n')
%Se crean limites en el eje X para posteriormente realizar comparaci�n en
%igualdad de puntos
xlim([0 20])
%Se a�ade grilla al gr�fico
grid on
%Se guarda el gr�fico
saveas(figure1, 'RespContinua.png')


%%%%%%%%%%%%%%%%%%%%%%%% DISCRETIZACI�N (C-D) %%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Discretizaci�n de la funci�n con tiempo de muestreo igual a 0.05
[numD_1, denD_1] = c2dm(num, den, 0.05, 'zoh');

%Construcci�n de puntos de salida
[y] = dstep(numD_1, denD_1, 400+1);
%Construcci�n de puntos de entrada
x = 0:0.05:0.05*400;

%Gr�fico de respuesta discreta al escalón con tiempo de muestreo 0.05
stairs(x, y);
%Se a�ade t�tulo al gr�fico
title('Respuesta discreta al escal�n con tiempo de muestreo = 0.05')
%Se a�ade grilla al gr�fico
grid on
%Se guarda el gr�fico
saveas(figure1, 'RespDiscreta0.05.png')


%Discretizaci�n de la funci�n con tiempo de muestreo igual a 0.1
[numD_2, denD_2] = c2dm(num, den, 0.1, 'zoh');

%Construcci�n de puntos de salida
[y] = dstep(numD_2, denD_2, 200+1);
%Construcci�n de puntos de entrada
x = 0:0.1:0.1*200;

%Gr�fico de respuesta discreta al escal�n con tiempo de muestreo 0.1
stairs(x, y);
%Se a�ade t�tulo al gr�fico
title('Respuesta discreta al escal�n con tiempo de muestreo = 0.1')
%Se a�ade grilla al gr�fico
grid on
%Se guarda el gráfico
saveas(figure1, 'RespDiscreta0.1.png')


%%%%%%%%%%%%%%%%%%%%%%% DISCRETO A CONTINUO (D-C) %%%%%%%%%%%%%%%%%%%%%%%%

%Se pasa la función con tiempo de muestreo igual a 0.1 a continua
%nuevamente
[numC, denC] = d2cm(numD_2, denD_2, 0.1, 'zoh');

%Grafico de respuesta al escalón de la función continua
step(numC, denC)
%Se añade título al gráfico
title('Función de discreta a continua')
%Se crean limites en el eje X para comparar con gráficos previamente
%realizados
xlim([0 20])
%Se añade grilla al gráfico
grid on
%Se guarda el gráfico
saveas(figure1, 'RespCont(D-C).png')