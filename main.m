%%

% Finish up the following
% - opponent character detection
% - findChangedCell
% - chooseMove
% - get out of loop


%% 

dobotnumber = 3; %specifies dobot used #2 or #3
% intialize dobot: COMPLETE
if exist('arduinoObj') == 0	
    dobotinit	
end




% set to zero position: COMPLETE
home = [90;0;0]; %home angles
pause(1)	

setdobotangles(q2ang(home),arduinoObj) %move to home
% calc dobot home positon
dobot.q=[home(1);home(2);home(3);-home(2)-home(3)];
dobot=fwdkiniter(dobot);  
homepos = dobot.T(1:3,4);
pause(1)
setdobotposition(dobot, homepos, arduinoObj); %move to home pos (should already be there
pause(3)
if exist('reference', 'var') == 0	
    disp('REF IMG')
    reference = takePicture();	
    reference = cropImage(reference, 10);
end
% table height value (calibrate these vales before starting
zPaper = 4; % height of the table surface, must be determined during cell setup
xBoard = 185; %X center of board
yBoard = 0; %Y center of board
bc = [xBoard;yBoard;zPaper];

% draw board
pause(1)
setdobotposition(dobot, bc+[0;0;20], arduinoObj);
cvo = 0*[-2;-2;-6;-6];
[cellCenters, cornerLoc] = drawBoard(dobot, arduinoObj, bc+[0;0;0], cvo, 3*25);
setdobotposition(dobot, bc+[0;0;20], arduinoObj);

% charater recognition, needs to be added here
myChar = 'X'; %character of the robot, user played the other charatcter
opponentChar = 'O';
%%
moveNum = 1;
board = ['_' '_' '_'; '_' '_' '_'; '_' '_' '_'];

% Wait for player move and determine location of move made
while true
    setdobotposition(dobot, homepos, arduinoObj);
    pause(3);
    disp('WAIT')
    img1 = takePicture();
    img1fixed = cropImage(img1, 10);
    img1fixed = subtractReference(img1fixed, reference);
    img1fixed = straightenGrid(img1fixed);
    img1fixed = removeWhitespace(img1fixed); 
    img1fixed = imadjust(img1fixed, [.7 1], []);
    
    while true
        disp('play now')
        pause(5);
        
        img2 = takePicture();
        img2fixed = cropImage(img2, 10);
        img2fixed = subtractReference(img2fixed, reference);
        img2fixed = straightenGrid(img2fixed);
        img2fixed = removeWhitespace(img2fixed); 
        img2fixed = imadjust(img2fixed, [0.7 1], []);

        [row, col] = findChangedCell(img1fixed, img2fixed);
        if sum([row col]) ~= 0 && board(row, col) == '_'
            changedCell = getCell(img2fixed, row, col);
            newImage = img2fixed;
            break
        end
    end
    
    % increment move counter to account for player move
    moveNum = moveNum + 1;

    % determine changed character: INCOMPLETE
    %     diyanko 
    

    % update board model with new character: COMPLETE
    board(row, col) = opponentChar

    % if lost end
     score = evaluateScore(board, myChar);
     if score == -10
         break; end
    
    % decide on best move: COMPLETE
    [row, col] = choosemove(board, myChar); 
    
    % if move made wins game, end
    if row < 0
        break; end
    
   
    
    % draw character
    if myChar == 'X'
        drawX(dobot, arduinoObj, cellCenters(row,col,:), 9, 5);
        pause(.5)
    else
        drawCircle(dobot,arduinoObj, cellCenters(row,col,:), 9);
        pause(.5)
    end
    
    % update board model
    board(row, col) = myChar
    
    % if this was the eighth or ninth move or game won, end
    score = evaluateScore(board, myChar);
    if moveNum == 8 || moveNum == 9 || score == 10
        break; end
    
    % redundant game-ending code (if no move can be made, end game)
    if row < 0
        break
    end    
    
    % increment moveNum to account for robot move
    moveNum = moveNum + 1;
end

% move to zero position
setdobotposition(dobot, homepos, arduinoObj);
disp('End of Game')

% Manually entering the user input data of the row and column
function [r,c] = findChangedCellmanual
    r = input('row');
    c = input('column');
end