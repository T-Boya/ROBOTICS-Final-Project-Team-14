%% read ang test
pause(1)
setdobotangles([0.1;0.1;0.1;0],arduinoObj);
pause(1)
readdobotangles(arduinoObj);
setdobotangles([0;0;0;0],arduinoObj);
pause(1)