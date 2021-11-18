%% tic-tac-toe
% close all
% clear all
% 
% %initalize
%dobotinit

home = [0;10;0];
pause(1)
setdobotangles(q2ang(home),arduinoObj)

dobot.q=[home(1);home(2);home(3);-home(2)-home(3)];
dobot=fwdkiniter(dobot);

homepos = dobot.T(1:3,4);
pause(1)
setdobotposition(dobot, homepos+[10;10;0], arduinoObj);


lineS = [00;-40;0];
lineE = [00;40;0];
lineP=[linspace(lineS(1),lineE(1),10);linspace(lineS(2),lineE(2),10);linspace(lineS(3),lineE(3),10)];

for i = 1:10
    tic
    setdobotposition(dobot, homepos+lineP(:,i), arduinoObj);
    toc
    pause(.1)
end

drawCircle(dobot,arduinoObj,homepos+[40;0;-55], 15);
drawX(dobot, arduinoObj, homepos+[40;0;-55], 15)

