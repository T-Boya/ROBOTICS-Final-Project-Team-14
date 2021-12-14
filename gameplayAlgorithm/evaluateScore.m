function [score] = evaluateScore(board, myChar)
    score = 0;
    % check rows and cols for winner
    for i = 1:3
        row = board(i,:);
        if all(row == row(1)) && row(1) ~= '_'
            score = assignScore(row(1), myChar); return; end
        col = board(:,i);
        if all(col == col(1)) && row(1) ~= '_'
            score = assignScore(col(1), myChar); return; end
    end
    
    % check diagonals for winner
    diagonalOne = diag(board);
    if all(diagonalOne == diagonalOne(1)) && row(1) ~= '_'
            score = assignScore(diagonalOne(1), myChar); return; end
    diagonalTwo = diag(flipud(board));
    if all(diagonalTwo == diagonalTwo(1)) && row(1) ~= '_'
            score = assignScore(diagonalTwo(1), myChar); return; end
end