function robot = dobotik(robot)
    
    robot.q = [0;0;0;0];
    R0Tact = robot.T(1:3,1:3);
    P0T = robot.T(1:3,4);
    
    
    
    q1 = atan2(P0T(2),P0T(1));
    R0T = rotz(q1);
    p14 = P0T - robot.P(:,1) - R0T*robot.P(:,end);
    k1 = robot.H(:,3);
    d = norm(p14); 
    p1 = -1*robot.P(:,4);
    p2 = robot.P(:,3);
    q3 = subprob3(k1,p1,p2,d);
    q = [];
    for i = 1:numel(q3)
        p1 = p14;
        p2 = robot.P(:,3)+(rot(robot.H(:,3), q3(i))*robot.P(:,4));
        k1 = -1*robot.H(:,1);
        k2 = robot.H(:,2);
        [q1, q2] = subprob2(k1,k2,p1,p2); %solve for q1 and q2
        for k = 1:2
            q4 = -q2(k)-q3(i);
            robot1 = robot;
            robot1.q = [q1(k);q2(k);q3(i); q4]*180/pi;
            robot1 = fwdkiniter(robot1);
            qc = [q1(k);q2(k);q3(i); -q2(k)-q3(i)];
            if norm(robot1.T(1:3,4)-robot.T(1:3,4))<1e-2
                
                
                q = [q qc];
            else
                t = ['bad q' num2str((qc.*180/pi)') ' error: ' num2str(norm(robot1.T(1:3,4)-robot.T(1:3,4)))];
            end
        end
    end
    robot.q=q.*180/pi;
    
end