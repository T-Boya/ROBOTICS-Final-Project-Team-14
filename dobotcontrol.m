%% dobot control

%% establish connection/setup


serialportlist("available")'
arduinoObj = serialport("COM3",9600)
configureTerminator(arduinoObj,hex2dec('5A')); % Data package ends with byte 0x5A

%% random angles
%setdobotangles(q2ang([0;-10;0]), arduinoObj
%readdobotangles(arduinoObj)









