%% Evaluate the Mean and STD of an X
clc;
kpp_x = getImage('x_kpp.jpg');
kpp_x = removeWhitespace(kpp_x); % The one we wrote
meanValues_x = zeros(9);
stdValues_x = zeros(9);
index = 1;
for i=1:3
    for j=1:3
        cell = getCell(kpp_x,i,j);
        cell = imadjust(cell,[0 0.9]);
        cell = RemoveWhiteSpace(cell);
        meanValues_x(index) = mean2(cell);
        stdValues_x(index) = std(cell,0,[1 2]);
        index = index+1;
    end
end

%% Evaluate the Mean and STD of an O
clc;
kpp_o = getImage('o_kpp.jpg');
kpp_o = removeWhitespace(kpp_o); % The one we wrote
meanValues_o = zeros(9);
stdValues_o = zeros(9);
index = 1;
for i=1:3
    for j=1:3
        cell = getCell(kpp_o,i,j);
        cell = imadjust(cell,[0 0.9]);
        cell = RemoveWhiteSpace(cell);
        meanValues_o(index) = mean2(cell);
        stdValues_o(index) = std(cell,0,[1 2]);
        index = index+1;
    end
end

%% Printing the values
clc;
disp("Mean values of O");
mean(meanValues_o(:,1))
disp("STD values of O");
mean(stdValues_o(:,1))
disp("Mean values of X");
mean(meanValues_x(:,1))
disp("Mean values of O");
mean(stdValues_x(:,1))