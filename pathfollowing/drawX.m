function MOV = drawX(dobot, arduinoObj, cp, r)
    %% moves robot in an X
    
    
    
    loc = zeros(3,1);
    corn1 = [cp(1)+r*cos(pi/4);cp(2)+r*sin(pi/4);cp(3)];
    corn2 = [cp(1)+r*cos(3*pi/4);cp(2)+r*sin(3*pi/4);cp(3)];
    corn3 = [cp(1)+r*cos(5*pi/4);cp(2)+r*sin(5*pi/4);cp(3)];
    corn4 = [cp(1)+r*cos(7*pi/4);cp(2)+r*sin(7*pi/4);cp(3)];
    setdobotposition(dobot, corn1+[0;0;20], arduinoObj)
    Loc = drawLine(dobot, arduinoObj, corn1, corn3);
    setdobotposition(dobot, corn3+[0;0;20], arduinoObj);
    setdobotposition(dobot, corn2+[0;0;20], arduinoObj);
    Loc = drawLine(dobot, arduinoObj, corn2, corn4);
    setdobotposition(dobot, corn4+[0;0;20], arduinoObj);
    pause(.5)
    MOV = loc;
end