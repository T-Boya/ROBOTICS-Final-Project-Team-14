%% dobot init

%{
Initializes the serial connection to the dobot, 
and defines a robot object in matlab to do kinematics.

Angles can be set using the setdobotangles and readdobotangles
functions

The inverse kinemtics function dobotik can be used with 
the  q2ang function to set the dobot angles for a specified
location. 

The MATLAB dobot object can be plotted using the plotRobot
function
%}

%% MATLAB definition

zz=zeros(3,1); ex = [1;0;0]; ey = [0;1;0]; ez = [0;0;1];
% units in mm
if dobotnumber == 2
    %these are rough numbers, need to be calibrated
    L1 = 103;
    L2 = 135;
    L3 = 160;
    L4 = 42.5;
    L5 = 25;

%     p01=L1*ez;
%     p12=zz;
%     p23=L2*ez*sin(atan2(1967-1568,2025-1919))-L2*ex*cos(atan2(1967-1568,2025-1919));
%     p34=L3*ex;
%     p4T=L4*ex - L5*ez;
    x = [-57.6889;   0;  123.8430;  154.8439;   0;   11.1579;   54.0734;   0;  -59.8550];
    p01 = [0;0;L1];
    p12=zz;
    p23=x(1:3);
    p34=x(4:6);
    p4T=x(7:9);
    
elseif dobotnumber == 3
    %these are rough numbers, need to be calibrated
    L1 = 101.03;
%     L2 = 135;
%     L3 = 160;
%     L4 = 42.5;
%     L5 = 25;
    x =   [6.5927;   0;  132.4817;  160.8680;   0;    5.0455;   45.1081;   0;  -47.2972];
    p01=L1*ez;
    p12=zz;
    p23=x(1:3);
    p34=x(4:6);
    p4T=x(7:9);
    
    
    
    
end

h1=ez;
h2=ey;
h3=ey;
h4=ey;
dobot.P=[p01 p12 p23 p34 p4T];
dobot.H=[h1 h2 h3 h4];
dobot.joint_type=[0 0 0 0];
dobot.T = eye(4);
dobot.J1lim = [-180 180];
dobot.J2lim = [-10 90];
dobot.J3lim = [-20 90];

%% serial connection definition

serialportlist("available")'
arduinoObj = serialport("COM7",9600)
configureTerminator(arduinoObj,hex2dec('5A')); % Data package ends with byte 0x5A

