% intialize dobot: INCOMPLETE

% set to zero position: INCOMPLETE

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
        % determine changed character: INCOMPLETE
        changedChar = getCell(imgNew, row, col);

        
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
    
    
    
    % draw character: INCOMPLETE
    
    
    % update board model: COMPLETE
    board(row, col) = myChar;
    
    % f this was the eighth or ninth move or game won, end: COMPLETE
    score = evaluateScore(board, myChar);
    if moveNum == 8 || moveNum == 9 || score == 10
        break; end
    
    % move to zero position: INCOMPLETE
    imgOld = imgNew;
    
    % increment moveNum
    moveNum = moveNum + 1;
end