%% tic-tac-toe
% close all
% clear all
% 
% %initalize
%  dobotinit
dobotnumber =3;
if exist('arduinoObj') == 0	
    dobotinit	
end

home = [0;10;0];
pause(1)
setdobotangles(q2ang(home),arduinoObj)

dobot.q=[home(1);home(2);home(3);-home(2)-home(3)];
dobot=fwdkiniter(dobot);

homepos = dobot.T(1:3,4);
pause(1)
%dobot = setdobotposition(dobot, homepos, arduinoObj);
bc = [185;0;20];
dobot = setdobotposition(dobot, bc, arduinoObj);
% lineS = [00;-40;0];
% lineE = [00;40;0];
% lineP=[linspace(lineS(1),lineE(1),10);linspace(lineS(2),lineE(2),10);linspace(lineS(3),lineE(3),10)];
% 
% for i = 1:10
%     tic
%     setdobotposition(dobot, homepos+lineP(:,i), arduinoObj);
%     toc
%     pause(.1)
% end
% 
% drawCircle(dobot,arduinoObj,bc+[0;0;0], 15);
% drawX(dobot, arduinoObj, bc+[0;40;0], 15);

pause(1)
dobot = setdobotposition(dobot, bc+[0;0;20], arduinoObj);
cvo = [0;0;0;0];
[cellCenters, cornerLoc] = drawBoard(dobot, arduinoObj, bc+[0;0;0], cvo, 3*25);
setdobotposition(dobot, bc+[0;0;20], arduinoObj);

drawX(dobot, arduinoObj, cellCenters(2,2,:), 9, 5);
dobot = setdobotposition(dobot, homepos, arduinoObj);
pause(10)

drawX(dobot, arduinoObj, cellCenters(1,3,:), 9, 5);
dobot = setdobotposition(dobot, homepos, arduinoObj);
pause(10)

drawX(dobot, arduinoObj, cellCenters(3,3,:), 9, 5);
dobot = setdobotposition(dobot, homepos, arduinoObj);
pause(10)

drawX(dobot, arduinoObj, cellCenters(2,3,:), 9, 5);
dobot = setdobotposition(dobot, homepos, arduinoObj);
pause(10)

drawCircle(dobot, arduinoObj, cellCenters(1,1,:), 9, 10);
setdobotposition(dobot, homepos, arduinoObj);
pause(10)

drawCircle(dobot, arduinoObj, cellCenters(2,1,:), 9, 10);
dobot = setdobotposition(dobot, homepos, arduinoObj);
pause(10)

drawCircle(dobot, arduinoObj, cellCenters(3,1,:), 9,10);
dobot = setdobotposition(dobot, homepos, arduinoObj);
pause(10)


% dobot = setdobotposition(dobot, cornerLoc(:,1)+[0;0;0], arduinoObj);
% dobot = setdobotposition(dobot, cornerLoc(:,2)+[0;0;0], arduinoObj);
% dobot = setdobotposition(dobot, cornerLoc(:,3)+[0;0;0], arduinoObj);
% dobot = setdobotposition(dobot, cornerLoc(:,4)+[0;0;0], arduinoObj);
% pause(5)

drawCircle(dobot, arduinoObj, cellCenters(1,1,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(2,1,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(3,1,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(1,2,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(2,2,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(3,2,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(1,3,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(2,3,:), 9,10);
drawCircle(dobot, arduinoObj, cellCenters(3,3,:), 9,10);

drawX(dobot, arduinoObj, cellCenters(1,1,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(2,1,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(3,1,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(1,2,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(2,2,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(3,2,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(1,3,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(2,3,:), 9, 5);
drawX(dobot, arduinoObj, cellCenters(3,3,:), 9, 5);

