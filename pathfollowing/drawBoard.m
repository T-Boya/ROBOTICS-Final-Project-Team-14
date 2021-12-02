function [cellCenters, cornerLoc] = drawBoard(dobot, arduinoObj, bc, cvo, L)
    % funciton draws board
    % bc is board center
    % cvo is corner vertical offsets
    % L is board side length
    % cell centers is an array with the center points of each cell
    
    cornStop = 1;
    
    cornerLoc = zeros(3,4);
    cornerLoc(:,1) = bc + [L/2;L/2;cvo(1)];
    cornerLoc(:,2) = bc + [L/2;-L/2;cvo(2)];
    cornerLoc(:,3) = bc + [-L/2;-L/2;cvo(3)];
    cornerLoc(:,4) = bc + [-L/2;L/2;cvo(4)];
    
%     mL1 = bc + [L/2;L/6;.67*cvo(1)-.33*cvo(2)];
%     mL2 = bc + [L/2;-L/6;.67*cvo(2)-.33*cvo(1)];
%     mL3 = bc + [L/6;-L/2;.67*cvo(2)-.33*cvo(3)];
%     mL4 = bc + [-L/6;-L/2;.67*cvo(3)-.33*cvo(2)];
%     mL5 = bc + [-L/2;-L/6;.67*cvo(3)-.33*cvo(4)];
%     mL6 = bc + [-L/2;L/6;.67*cvo(4)-.33*cvo(3)];
%     mL7 = bc + [-L/6;L/2;.67*cvo(4)-.33*cvo(1)];
%     mL8 = bc + [L/6;L/2;.67*cvo(1)-.33*cvo(4)];
    mL1 = bc + [L/2;L/6;.5*cvo(1)+.5*cvo(2)];
    mL2 = bc + [L/2;-L/6;.5*cvo(2)+.5*cvo(1)];
    mL3 = bc + [L/6;-L/2;.5*cvo(2)+.5*cvo(3)];
    mL4 = bc + [-L/6;-L/2;.5*cvo(3)+.5*cvo(2)];
    mL5 = bc + [-L/2;-L/6;.5*cvo(3)+.5*cvo(4)];
    mL6 = bc + [-L/2;L/6;.5*cvo(4)+.5*cvo(3)];
    mL7 = bc + [-L/6;L/2;.5*cvo(4)+.5*cvo(1)];
    mL8 = bc + [L/6;L/2;.5*cvo(1)+.5*cvo(4)];
    
    setdobotposition(dobot, cornerLoc(:,1)+[0;0;20], arduinoObj);
    Loc = drawLine(dobot, arduinoObj, cornerLoc(:,1), cornerLoc(:,2));
    pause(cornStop)
    Loc = drawLine(dobot, arduinoObj, cornerLoc(:,2), cornerLoc(:,3));
    pause(cornStop)
    Loc = drawLine(dobot, arduinoObj, cornerLoc(:,3), cornerLoc(:,4));
    pause(cornStop)
    Loc = drawLine(dobot, arduinoObj, cornerLoc(:,4), cornerLoc(:,1));
    pause(cornStop)
    setdobotposition(dobot, mL1+[0;0;20], arduinoObj);
    pause(cornStop)
    Loc = drawLine(dobot, arduinoObj, mL1, mL6);
    pause(cornStop+1)
    setdobotposition(dobot, mL6+[0;0;20], arduinoObj);
    setdobotposition(dobot, mL5+[0;0;20], arduinoObj);
    pause(cornStop)
    Loc = drawLine(dobot, arduinoObj, mL5, mL2);
    pause(cornStop)
    setdobotposition(dobot, mL2+[0;0;0], arduinoObj);
    pause(cornStop)
    setdobotposition(dobot, mL2+[0;0;20], arduinoObj);
    setdobotposition(dobot, mL3+[0;0;20], arduinoObj);
    pause(cornStop)
    Loc = drawLine(dobot, arduinoObj, mL3, mL8);
    pause(cornStop)
    setdobotposition(dobot, mL8+[0;0;20], arduinoObj);
    setdobotposition(dobot, mL7+[0;0;20], arduinoObj);
    pause(cornStop)
    Loc = drawLine(dobot, arduinoObj, mL7, mL4);
    setdobotposition(dobot, mL4+[0;0;20], arduinoObj);
    pause(cornStop+3)
    pause(1)
    
    cellCenters=zeros(3,9);
    cellCenters(:,1)=bc + [L/3;L/3;.67*cvo(1)];
    cellCenters(:,2)=bc + [L/3;0;.67*(cvo(1)+cvo(2))];
    cellCenters(:,3)=bc + [L/3;-L/3;.67*cvo(2)];
    cellCenters(:,4)=bc + [0;-L/3;.67*(cvo(3)+cvo(2))];
    cellCenters(:,5)=bc + [-L/3;-L/3;.67*cvo(3)];
    cellCenters(:,6)=bc + [-L/3;0;.67*(cvo(3)+cvo(4))];
    cellCenters(:,7)=bc + [-L/3;L/3;.67*cvo(4)];
    cellCenters(:,8)=bc + [0;L/3;.67*(cvo(1)+cvo(4))];
    cellCenters(:,9)=bc ;
    
    
end