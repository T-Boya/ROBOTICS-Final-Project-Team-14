%%

% Finish up the following
% - opponent character detection
% - findChangedCell
% - chooseMove
% - get out of loop


%% 

dobotnumber = 2; %specifies dobot used #2 or #3
% intialize dobot: COMPLETE
if exist('arduinoObj') == 0	
    dobotinit	
end

reference = takePicture();

% set to zero position: COMPLETE
home = [90;45;15]; %home angles
pause(1)	
setdobotangles(q2ang(home),arduinoObj) %move to home
% calc dobot home positon
dobot.q=[home(1);home(2);home(3);-home(2)-home(3)];
dobot=fwdkiniter(dobot);  
homepos = dobot.T(1:3,4);
pause(1)
setdobotposition(dobot, homepos, arduinoObj); %move to home pos (should already be there
pause(1)
% table height value (calibrate these vales before starting
zPaper = 18; % height of the table surface, must be determined during cell setup
xBoard = 185; %X center of board
yBoard = 0; %Y center of board
bc = [xBoard;yBoard;zPaper];

% draw board
pause(1)
setdobotposition(dobot, bc+[0;0;20], arduinoObj);
cvo = [-2;-2;-6;-6];
[cellCenters, cornerLoc] = drawBoard(dobot, arduinoObj, bc+[0;0;0], cvo, 3*25);
setdobotposition(dobot, bc+[0;0;20], arduinoObj);

% charater recognition, needs to be added here
myChar = 'X'; %character of the robot, user played the other charatcter
opponentChar = 'O';
%%
moveNum = 1;
board = ['_' '_' '_'; '_' '_' '_'; '_' '_' '_'];

% set imgNew to image from webcam: COMPLETE (UNTESTED CAMERA IMAGE
% FETCHING) commented out for testing w/o camera
% imgNew = getCameraImage();
% imgOriginal = imgNew;
% opponentChar = 'A';
while true
    setdobotposition(dobot, homepos, arduinoObj);
    pause(5);
    
    img1 = takePicture();
    img1fixed = cropImage(img1, 15);
    img1fixed = subtractReference(img1fixed, reference);
    img1fixed = straightenGrid(img1fixed);
    img1fixed = removeWhitespace(img1fixed); 
    
    while true
        pause(5);
        
        img2 = takePicture();
        img2fixed = cropImage(img2, 15);
        img2fixed = subtractReference(img2fixed, reference);
        img2fixed = straightenGrid(img2fixed);
        img2fixed = removeWhitespace(img2fixed); 

        [row, col] = findChangedCell(img1fixed, img2fixed);
        if sum([row col]) == 0
            continue
        else
            changedCell = getCell(img2fixed, row, col);
        end
        newImage = img2fixed;
    end
    
    % check for changes: COMPLETE (UNTESTED CAMERA IMAGE FETCHING) 
    
    %imgNew = getCameraImage();
    %[row, col] = findChangedCellFinal(imgOld, imgNew);
    [row, col] = findChangedCellmanual; %function asks for manual input of location, used for testing
    
    if row == 0
        continue; end
    moveNum = moveNum + 1;

    % determine changed character: INCOMPLETE
    % if opponentChar == 'A'
    %     opponentChar = getCell(imgNew, row, col);


    %     diyanko 
            

    %     myChar = assignOpponent(opponentChar);
    % end
    
    %commented out as this is determined befor ethe loop
    %myChar = 'X';
    %opponentChar = 'O';

    % update board model with new character: COMPLETE
    board(row, col) = opponentChar

    % if lost end: COMPLETE 
    % % % no function 'evaluate score' % % %
%     score = evaluateScore(board, myChar);
%     if score == -10
%         break; end
    
    % decide on best move: COMPLETE
    %[row, col] == chooseMove(board, myChar)+[1 1]; 
    [row,col] = chooseMoveRandom(board);
    if row < 0
        break; end
    
   
    
    % draw character: COMPLETE
    if myChar == 'X'
        drawX(dobot, arduinoObj, cellCenters(row,col,:), 9, 5);
        pause(.5)
    else
        drawCircle(dobot,arduinoObj, cellCenters(row,col,:), 9);
        pause(.5)
    end
    
    % update board model: COMPLETE
    board(row, col) = myChar;
    
    % f this was the eighth or ninth move or game won, end: COMPLETE
    % no evaluate score function
    %score = evaluateScore(board, myChar);
%     if moveNum == 8 || moveNum == 9 || score == 10
%         break; end
    
    % move to zero position: COMPLETE
    %imgOld = imgNew;
    setdobotposition(dobot, homepos+[10;10;0], arduinoObj);
    pause(1)
    
    % increment moveNum
    moveNum = moveNum + 1;
end


% key performance parameters
% ensure images are represented by 1x1 array, otherwise below fails
% shapeStats = zeros(9, 3);
% imgFinal = getCameraImage();
% for i = 1:9
    % shape opacity
%     cellOriginal = getCell(imgOriginal, mod(i, 3), floor(i/3));
%     cellModified = getCell(imgFinal, mod(i, 3), floor(i/3));
    % make cells same size
    % mismatchedDimensions = [ size(cellOriginal); size(cellModified) ];
    % dimensions = [ min(mismatchedDimensions(:,1)) min(mismatchedDimensions(:,2)) ];
%     dimensions = [ 720, 720 ];
%     cellOriginal = imresize(cellOriginal, dimensions);
%     cellModified = imresize(cellModified, dimensions);
%     modifiedVals = zeros(dimensions(1)*dimensions(2), 1);
%     for j = 1:dimensions(1)
%         for k = 1:dimensions(2)
%             if cellOriginal(j, k) ~= cellModified(j,k)
%                 modifiedVals = cellModified(dimensions(1)*(j-1) + k);
%             end
%         end
%     end
%     modifiedVals = modifiedVals(1:find(modifiedVals == 0, 1, 'first'));
%     shapeStats(i,:) = [mean(modifiedVals) range(modifiedVals) std(modifiedVals)];
% end
% % weaknesses: fails when shadows change


% Manually entering the user input data of the row and column
function [r,c] = findChangedCellmanual
    r = input('row');
    c = input('column');
end