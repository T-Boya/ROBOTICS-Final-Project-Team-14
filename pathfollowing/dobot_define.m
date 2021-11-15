%% dobot IK
close all


zz=zeros(3,1); ex = [1;0;0]; ey = [0;1;0]; ez = [0;0;1];
% units in mm

%these are rough numbers, need to be calibrated
L1 = 103;
L2 = 140;
L3 = 160;
L4 = 45;
L5 = 10;

p01=L1*ez;
p12=zz;
p23=L2*ez*sin(atan2(1967-1568,2025-1919))-L2*ex*cos(atan2(1967-1568,2025-1919));
p34=L3*ex;
p4T=L4*ex - L5*ez;

h1=ez;
h2=ey;
h3=ey;
h4=ey;

irb1200.P=[p01 p12 p23 p34 p4T];
irb1200.H=[h1 h2 h3 h4];
irb1200.joint_type=[0 0 0 0];
irb1200.T = eye(4);
q1 = 10;
q2 = 00;
q3 = 0;

irb1200.q = [q1;q2;q3;-q2-q3];

irb1200 = fwdkiniter(irb1200);
irb1200.T(1:3,4) = [225;0;20];
plotRobot(irb1200);
irb1200 = dobotik(irb1200);
qd = irb1200.q;

% qall = irb1200.q;
% 
% for i = 1:size(qall,2)
%     irb1200.q = qall(:,i);
%     hold on
%     plotRobot(irb1200);
%     
% end
    
    

