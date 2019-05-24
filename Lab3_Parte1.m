%%%%%%%%%%%%%%%%%%%%%%%%%% PRIMERA PARTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Definici�n de denominador para ecuaci�nn
den= [13 -4 20];
%Definici�n de numerador para ecuaci�n
num = [3 25];
%Definici�n de funci�n de transferencia para segunda ecuaci�n
G = tf(num, den);

graph_c(numC,denC,'Gr�fico de respuesta continua al escal�n',[0,20]); %Se grafica din�micamente.

%%%%%%%%%%%%%%%%%%%%%%%% DISCRETIZACI�N (C-D) %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Discretizaci�n de la funci�n con tiempo de muestreo igual a 0.05
[numD_1, denD_1] = c2dm(num, den, 0.05, 'zoh');
[x,y] = get_xy(numD_1,denD_1,400,0.05); %Se optienen los valores de entrada y salida.
graph_d(x,y,'Respuesta discreta al escal�n con tiempo de muestreo = 0.05'); %Se grafica discretamente.

%Discretizaci�n de la funci�n con tiempo de muestreo igual a 0.1
[numD_2, denD_2] = c2dm(num, den, 0.1, 'zoh');
[x2,y2] = get_xy(numD_2,denD_2,200,0.1);%Se optienen los valores de entrada y salida.
graph_d(x2,y2,'Respuesta discreta al escal�n con tiempo de muestreo = 0.1'); %Se grafica discretamente.

%%%%%%%%%%%%%%%%%%%%%%% DISCRETO A CONTINUO (D-C) %%%%%%%%%%%%%%%%%%%%%%%%
%Se pasa la funci�n con tiempo de muestreo igual a 0.1 a continua
%nuevamente
[numC, denC] = d2cm(numD_2, denD_2, 0.1, 'zoh');
graph_c(numC,denC,'Funci�n de discreta a continua',[0,20]); %Se grafica din�micamente.
