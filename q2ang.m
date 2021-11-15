function new_ang = q2ang(qd)
    %qd = qd*180/pi;
    a1 = qd(1);
    if a1>180
        a1 = 180;
        fprintf('joint 1 limit reached')
    elseif a1<-180
        a1 = -180;
        fprintf('joint 1 limit reached')
    end
    a2 = qd(2);
%     if a2>100
%         a2 = 100;
%         fprintf('joint 2 limit reached')
%     elseif a2<2
%         a2 = 2;
%         fprintf('joint 2 limit reached')
%     end
    a3 = qd(3)+a2;
    
    a4 = 0;
    new_ang = [a1;a2;a3;a4];
end