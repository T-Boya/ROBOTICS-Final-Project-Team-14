function MOV = drawLine(dobot, arduinoObj, lineS, lineE)
    %% moves robot in a circle
    
    N = 10;
    
    loc = zeros(3,N);
    
    lineP=[linspace(lineS(1),lineE(1),N);linspace(lineS(2),lineE(2),N);linspace(lineS(3),lineE(3),N)];
    for i = 1:N
        %tic
        setdobotposition(dobot, lineP(:,i), arduinoObj);
        %toc
        pause(.2)
    end
    
    MOV = loc;
end
