% intialize dobot: COMPLETE
if exist('arduinoObj') == 0	
    dobotinit	
end

% set to zero position: COMPLETE
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

% set imgNew to image from webcam: COMPLETE (UNTESTED CAMERA IMAGE FETCHING)
imgNew = getCameraImage();
imgOriginal = imgNew;
opponentChar = 'A';
while true
    pause(5);
    
    % check for changes: COMPLETE (UNTESTED CAMERA IMAGE FETCHING)
    imgNew = getCameraImage();
    [row, col] = findChangedCell(imgOld, imgNew);
    if row == 0
        continue; end
    moveNum = moveNum + 1;

    % determine changed character: INCOMPLETE
    % if opponentChar == 'A'
    %     opponentChar = getCell(imgNew, row, col);


    %     diyanko


    %     myChar = assignOpponent(opponentChar);
    % end
    myChar = 'X';
    opponentChar = 'O';

    % update board model with new character: COMPLETE
    board(row, col) = myChar;

    % if lost end: COMPLETE
    score = evaluateScore(board, myChar);
    if score == -10
        break; end
    
    % decide on best move: COMPLETE
    [row, col] == chooseMove(board, myChar);
    if row < 0
        break; end
    
    % move dobot to center of cell: INCOMPLETE
    jack
    
    
    % draw character: COMPLETE
    if myChar == 'X'
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
    
    % move to zero position: COMPLETE
    imgOld = imgNew;
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