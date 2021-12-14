% representation: '_' for empty cells, 'X' and 'O' for moves. 3x3 matrix
% 'myChar' variable contains characer representing robot move (e.g. 'X')
% call chooseMove and the ideal move is returned

function [row, col] = choosemove(board, myChar)
    % 'myChar' variable contains characer representing robot move (e.g. 'X')
    [row, col] = findBestMove(board, myChar);
end



function [best] = minimax(board, depth, isMax, myChar)
    opponent = assignOpponent(myChar);
    score = evaluateScore(board, myChar);
    % return winner if the game ended
    if score == 10 || score == -10
        best = score; return; end
    % end game if no moves left
    if ~ismember('_', board)
        best = 0; return; end
    if isMax
        best = -1000;
        for i = 1:3
            for j = 1:3
                if board(i, j) == '_'
                    board(i, j) = myChar;
                    best = max(best, minimax(board, depth + 1, ~isMax, myChar));
                    board(i, j) = '_';
                end
            end
        end
        return;
    else
        best = 1000;
        for i = 1:3
            for j = 1:3
                if board(i, j) == '_'
                    board(i, j) = opponent;
                    best = min(best, minimax(board, depth + 1, ~isMax, myChar));
                    board(i, j) = '_';
                end
            end
        end
        return;
    end
end

function [row, col] = findBestMove(board, myChar)
    bestVal = -1000;
    row = -1; col = -1;
    for i = 1:3
        for j = 1:3
            if board(i, j) == '_'
                board(i, j) = myChar;
                moveVal = minimax(board, 0, false, myChar);
                board(i, j) = '_';
                if moveVal > bestVal && moveVal ~= -10
                    row = i; col = j;
                    bestVal = moveVal;
                end
            end
        end
    end
end

function [opponent] = assignOpponent(myChar)
    if myChar == 'X'
        opponent = 'O';
    else
        opponent = 'X';
    end
end

% from https://www.geeksforgeeks.org/minimax-algorithm-in-game-theory-set-3-tic-tac-toe-ai-finding-optimal-move/