% representation: '_' for empty cells, 'X' and 'O' for moves. 3x3 matrix
% 'myChar' variable contains characer representing robot move (e.g. 'X')
% call chooseMove and the ideal move is returned

function [row, col] = choosemove(board, myChar)
    % 'myChar' variable contains characer representing robot move (e.g. 'X')
    [row, col] = findBestMove(board, myChar);
end

function [score] = evaluateScore(board, robot)
    % check rows and cols for winner
    for i = 1:3
        row = board(i,:);
        if all(row == row(1))
            score = assignScore(row(1), robot); return; end
        col = board(:,i);
        if all(col == col(1))
            score = assignScore(col(1), robot); return; end
    end
    
    % check diagonals for winner
    diagonalOne = diag(board);
    if all(diagonalOne == diagonalOne(1))
            score = assignScore(diagonalOne(1), robot); return; end
    diagonalTwo = diag(flipud(board));
    if all(diagonalTwo == diagonalTwo(1))
            score = assignScore(diagonalTwo(1), robot); return; end
    score = 0;
end

% helper function for evaluateScore
function [score] = assignScore(winner, robot)
    if winner == robot
        score = 10; return;
    elseif winner ~= '_'
        score = -10; return;
    end
end

function [best] = minimax(board, depth, myMove, myChar)
    score = evaluateScore(board, myChar);
    % return winner if the game ended
    if score == 10 || score == -10
        best = score; return; end
    % end game if no moves left
    if ~ismember('_', board)
        best = 0; return; end
    if myMove
        best = -1000;
        for i = 1:3
            for j = 1:3
                if board(i, j) == '_'
                    board(i, j) = myChar;
                    best = max(best, minimax(board, depth + 1, ~myMove, myChar));
                    board(i, j) = '_';
                end
            end
        end
    else
        best = 1000;
        for i = 1:3
            for j = 1:3
                if board(i, j) == '_'
                    board(i, j) = myChar;
                    best = min(best, minimax(board, depth + 1, ~myMove, myChar));
                    board(i, j) = '_';
                end
            end
        end
    end
end

function [bestMove] = findBestMove(board, myChar)
    bestVal = -1000;
    bestMove = [-1, -1];
    for i = 1:3
        for j = 1:3
            if board(i, j) == '_'
                board(i, j) = myChar;
                moveVal = minimax(board, 0, false, myChar);
                board(i, j) = '_';
                if moveVal > bestVal
                    bestMove = [i, j];
                    bestVal = moveVal;
                end
            end
        end
    end
end

% from https://www.geeksforgeeks.org/minimax-algorithm-in-game-theory-set-3-tic-tac-toe-ai-finding-optimal-move/