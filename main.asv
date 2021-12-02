% intialize dobot: INCOMPLETE
%jack

if exist('arduinoObj')==0
    dobotinit
end
    

% set to zero position: INCOMPLETE
%jack

home = [0;10;0]; %home angles
pause(1)
setdobotangles(q2ang(home),arduinoObj) %move to home

% calc dobot home positon
dobot.q=[home(1);home(2);home(3);-home(2)-home(3)];
dobot=fwdkiniter(dobot);  

homepos = dobot.T(1:3,4);
pause(1)
setdobotposition(dobot, homepos+[10;10;0], arduinoObj); %move to home pos (should already be there
pause(1)

% table height value
zPaper = -175; % height of the table surface, must be determined during cell setup
xBoard = 40; %X center of board
yBoard = 0; %Y center of board

myChar = 'X';
moveNum = 1;
board = ['_' '_' '_'; '_' '_' '_'; '_' '_' '_'];

% set imgNew to image from webcam: INCOMPLETE
imgNew = getImage(...);
    
while true
    pause(5);
    
    % check for changes: INCOMPLETE (need to get new image from webcam)
    if moveNum > 1
            imgNew = getImage(...);
            [row, col] = findChangedCell(imgOld, imgNew);
            if row == 0
                continue; end
            moveNum = moveNum + 1;
            tinashe
            
        % determine changed character: INCOMPLETE
        changedChar = getCell(imgNew, row, col);
        diyanko

        
        % update board model with new character: COMPLETE
        board(row, col) = myChar;

        % if lost end: COMPLETE
        score = evaluateScore(board, myChar);
        if score == -10
            break; end
    end
    
    % decide on best move: COMPLETE
    [row, col] == chooseMove(board, myChar);
    if row < 0
        break; end
    
    % move dobot to center of cell: INCOMPLETE
    %jack
    
    
    % draw character: INCOMPLETE
    if myChar = 'x'
        
        drawX(dobot, arduinoObj, homepos+[x;y;zPaper], 15);
        pause(.5)
    else
        drawCircle(dobot,arduinoObj,homepos+[x;y;zPaper], 15);
        pause(.5)
    end
    
    % update board model: COMPLETE
    board(row, col) = myChar;
    
    % f this was the eighth or ninth move or game won, end: COMPLETE
    score = evaluateScore(board, myChar);
    if moveNum == 8 || moveNum == 9 || score == 10
        break; end
    
    % move to zero position: INCOMPLETE
    imgOld = imgNew;
    %jack
    setdobotposition(dobot, homepos+[10;10;0], arduinoObj);
    pause(1)
    % increment moveNum
    moveNum = moveNum + 1;
end