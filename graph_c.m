function graph_c(numerador,denominador,titulo,xlimit)
    
    %Se define figura para posteriormente poder guardar las gráficas
    figure1 = figure;
    %Se especifica que los ejes de las figuras son los que se definirán para 
    %cada gráfica por separado 
    axes1 = axes('Parent',figure1);
    
    step(numerador,denominador);
    xlim(xlimit)
    box(axes1,'on');
    hold(axes1,'on');
    grid(axes1,'on')
    title(titulo);
    xlabel('Time');
    ylabel('Amplitude');
    
end