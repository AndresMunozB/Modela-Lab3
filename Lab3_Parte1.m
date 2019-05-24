%%%%%%%%%%%%%%%%%%%%%%%%%% PRIMERA PARTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Se define figura para posteriormente poder guardar las gráficas
figure1 = figure;
%Se especifica que los ejes de las figuras son los que se definirán para 
%cada gráfica por separado 
axes1 = axes('Parent', figure1);

%Definición de denominador para ecuaciónn
den= [13 -4 20];
%Definición de numerador para ecuación
num = [3 25];
%Definición de función de transferencia para segunda ecuación
G = tf(num, den);

%Gráfico de respuesta continua al escalón
step(num, den)
%Se añade título al gráfico
title('Gráfico de respuesta continua al escalón')
%Se crean limites en el eje X para posteriormente realizar comparación en
%igualdad de puntos
xlim([0 20])
%Se añade grilla al gráfico
grid on
%Se guarda el gráfico
saveas(figure1, 'RespContinua.png')


%%%%%%%%%%%%%%%%%%%%%%%% DISCRETIZACIÓN (C-D) %%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Discretización de la función con tiempo de muestreo igual a 0.05
[numD_1, denD_1] = c2dm(num, den, 0.05, 'zoh');

%Construcción de puntos de salida
[y] = dstep(numD_1, denD_1, 400+1);
%Construcción de puntos de entrada
x = 0:0.05:0.05*400;

%Gráfico de respuesta discreta al escalÃ³n con tiempo de muestreo 0.05
stairs(x, y);
%Se añade título al gráfico
title('Respuesta discreta al escalón con tiempo de muestreo = 0.05')
%Se añade grilla al gráfico
grid on
%Se guarda el gráfico
saveas(figure1, 'RespDiscreta0.05.png')


%Discretización de la función con tiempo de muestreo igual a 0.1
[numD_2, denD_2] = c2dm(num, den, 0.1, 'zoh');

%Construcción de puntos de salida
[y] = dstep(numD_2, denD_2, 200+1);
%Construcción de puntos de entrada
x = 0:0.1:0.1*200;

%Gráfico de respuesta discreta al escalón con tiempo de muestreo 0.1
stairs(x, y);
%Se añade título al gráfico
title('Respuesta discreta al escalón con tiempo de muestreo = 0.1')
%Se añade grilla al gráfico
grid on
%Se guarda el grÃ¡fico
saveas(figure1, 'RespDiscreta0.1.png')


%%%%%%%%%%%%%%%%%%%%%%% DISCRETO A CONTINUO (D-C) %%%%%%%%%%%%%%%%%%%%%%%%

%Se pasa la funciÃ³n con tiempo de muestreo igual a 0.1 a continua
%nuevamente
[numC, denC] = d2cm(numD_2, denD_2, 0.1, 'zoh');

%Grafico de respuesta al escalÃ³n de la funciÃ³n continua
step(numC, denC)
%Se aÃ±ade tÃ­tulo al grÃ¡fico
title('FunciÃ³n de discreta a continua')
%Se crean limites en el eje X para comparar con grÃ¡ficos previamente
%realizados
xlim([0 20])
%Se aÃ±ade grilla al grÃ¡fico
grid on
%Se guarda el grÃ¡fico
saveas(figure1, 'RespCont(D-C).png')