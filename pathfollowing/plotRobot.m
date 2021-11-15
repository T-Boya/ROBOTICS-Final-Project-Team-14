function p = plotRobot(Robot)
    
    radius=.01;
    [Robot_rbt,colLink]=defineRobot(Robot,radius);
    config = Robot.q*pi/180;
    show(Robot_rbt, config);
    p=0;
end