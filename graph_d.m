function graph_d(x,y,titulo)

    figure1 = figure;
    % Create axes
    axes1 = axes('Parent',figure1);
    
    %Gr�fico de respuesta discreta al escal�n con tiempo de muestreo 0.1
    stairs(x, y);
    box(axes1,'on');
    hold(axes1,'on');
    grid(axes1,'on')
    title(titulo);
    xlabel('Time (seconds)');
    ylabel('Amplitude');
    
end