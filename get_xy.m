function [x,y] = get_xy(num, dem, points, diff)
    %Construcci�n de puntos de salida
    y = dstep(num, dem, points+1);
    %Construcci�n de puntos de entrada
    x = 0:diff:diff*points;
end