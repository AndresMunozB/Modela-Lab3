function [x,y] = get_xy(points, diff)
    %Construcci�n de puntos de salida
    y = dstep(numD_1, denD_1, points+1);
    %Construcci�n de puntos de entrada
    x = 0:diff:diff*points;
end