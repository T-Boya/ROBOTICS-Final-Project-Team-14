function MOV = drawCircle(dobot, arduinoObj, cp, r)
    %% moves robot in a circle
    
    N = 20;
    ang = 0:2*pi/N:2*pi;
    loc = zeros(3,N);
    setdobotposition(dobot, cp+[0;0;20], arduinoObj)
    for i = 1:N
        loc(:,i) = [cp(1)+r*cos(ang(i));cp(2)+r*sin(ang(i));cp(3)];
        
        
    end
    loc(:,N+1) = loc(:,1);
    
    for i = 1:N+1
               
        setdobotposition(dobot, loc(:,i), arduinoObj);
        pause(.5)
    end
    setdobotposition(dobot, loc(:,N+1), arduinoObj)
    pause(.5)
    setdobotposition(dobot, loc(:,N+1)+[0;0;20], arduinoObj)
    MOV = loc;
end
