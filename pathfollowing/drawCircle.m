function MOV = drawCircle(dobot, arduinoObj, cp, r)
    %% moves robot in a circle
    
    N = 20;
    ang = 0:2*pi/N:2*pi;
    loc = zeros(3,N);
    for i = 1:N
        loc(:,i) = [cp(1)+r*cos(ang(i));cp(2)+r*sin(ang(i));cp(3)];
        
        setdobotposition(dobot, loc(:,i), arduinoObj);
        pause(.2)
    end
    
    MOV = loc;
end
