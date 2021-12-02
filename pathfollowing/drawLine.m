function MOV = drawLine(dobot, arduinoObj, lineS, lineE, N)
    %% moves robot in a circle
    
    if ~exist('N','var')
     % third parameter does not exist, so default it to something
      N = 10;
    end
    
    
    loc = zeros(3,N);
    
    lineP=[linspace(lineS(1),lineE(1),N);linspace(lineS(2),lineE(2),N);linspace(lineS(3),lineE(3),N)];
    for i = 1:N
        %tic
        setdobotposition(dobot, lineP(:,i), arduinoObj);
        %toc
        pause(.3)
    end
    
    MOV = loc;
end
