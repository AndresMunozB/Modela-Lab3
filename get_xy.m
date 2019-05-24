function [x,y] = get_xy(num, dem, points, diff)
    %Construcción de puntos de salida
    y = dstep(num, dem, points+1);
    %Construcción de puntos de entrada
    x = 0:diff:diff*points;
end