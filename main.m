% intialize dobot: INCOMPLETE
jack

% set to zero position: INCOMPLETE
jack

moveNum = 1;
board = ['_' '_' '_'; '_' '_' '_'; '_' '_' '_'];

% set imgNew to image from webcam: COMPLETE (UNTESTED CAMERA IMAGE FETCHING)
imgNew = getCameraImage();
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
    if opponentChar == 'A'
        opponentChar = getCell(imgNew, row, col);


        diyanko


        myChar = assignOpponent(opponentChar);
    end

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
    
    
    % draw character: INCOMPLETE
    jack
    
    % update board model: COMPLETE
    board(row, col) = myChar;
    
    % f this was the eighth or ninth move or game won, end: COMPLETE
    score = evaluateScore(board, myChar);
    if moveNum == 8 || moveNum == 9 || score == 10
        break; end
    
    % move to zero position: INCOMPLETE
    imgOld = imgNew;
    jack
    
    % increment moveNum
    moveNum = moveNum + 1;
end