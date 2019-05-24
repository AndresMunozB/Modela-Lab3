function [x,y] = get_xy(points, diff)
    %Construcción de puntos de salida
    y = dstep(numD_1, denD_1, points+1);
    %Construcción de puntos de entrada
    x = 0:diff:diff*points;
end