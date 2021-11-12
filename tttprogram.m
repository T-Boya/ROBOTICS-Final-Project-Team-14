%% tic-tac-toe
close all
clear all

%initalize
dobotinit

home = [0;10;0];
setdobotangles(q2ang(home),arduinoObj)
pause(1)
dobot.q=[home(1);home(2);home(3);-home(2)-home(3)];
dobot=fwdkiniter(dobot);

homepos = dobot.T(1:3,4);

setdobotposition(dobot, homepos+[10;10;0], arduinoObj)




