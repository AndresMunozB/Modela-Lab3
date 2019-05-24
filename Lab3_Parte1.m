%%%%%%%%%%%%%%%%%%%%%%%%%% PRIMERA PARTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Definición de denominador para ecuaciónn
den= [13 -4 20];
%Definición de numerador para ecuación
num = [3 25];
%Definición de función de transferencia para segunda ecuación
G = tf(num, den);

graph_c(numC,denC,'Gráfico de respuesta continua al escalón',[0,20]); %Se grafica dinámicamente.

%%%%%%%%%%%%%%%%%%%%%%%% DISCRETIZACIÓN (C-D) %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Discretización de la función con tiempo de muestreo igual a 0.05
[numD_1, denD_1] = c2dm(num, den, 0.05, 'zoh');
[x,y] = get_xy(numD_1,denD_1,400,0.05); %Se optienen los valores de entrada y salida.
graph_d(x,y,'Respuesta discreta al escalón con tiempo de muestreo = 0.05'); %Se grafica discretamente.

%Discretización de la función con tiempo de muestreo igual a 0.1
[numD_2, denD_2] = c2dm(num, den, 0.1, 'zoh');
[x2,y2] = get_xy(numD_2,denD_2,200,0.1);%Se optienen los valores de entrada y salida.
graph_d(x2,y2,'Respuesta discreta al escalón con tiempo de muestreo = 0.1'); %Se grafica discretamente.

%%%%%%%%%%%%%%%%%%%%%%% DISCRETO A CONTINUO (D-C) %%%%%%%%%%%%%%%%%%%%%%%%
%Se pasa la función con tiempo de muestreo igual a 0.1 a continua
%nuevamente
[numC, denC] = d2cm(numD_2, denD_2, 0.1, 'zoh');
graph_c(numC,denC,'Función de discreta a continua',[0,20]); %Se grafica dinámicamente.
