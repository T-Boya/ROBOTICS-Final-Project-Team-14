function robot = setdobotpoisiton(robot, pos, arduinoObj)
    
    robot.T(1:3,4) = pos;
    robot = dobotik(robot);
    qall = robot.q;
    
    for i = 1:size(qall,2)
        if 1 ~= inBetween(qall(1,i), robot.J1lim)
            continue
        elseif 1 ~= inBetween(qall(2,i), robot.J2lim)
            continue
        elseif 1 ~= inBetween(qall(3,i), robot.J3lim)
            continue
        end
        robot.q = qall(:,i);
        break
    end
    
    qd = dobot.q
    
    new_angles = q2ang(qd);
    setdobotangles(new_angles,arduinoObj)
    

end