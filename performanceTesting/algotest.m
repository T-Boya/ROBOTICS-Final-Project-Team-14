%%  single move test
close all; clear all; clc
board = ['O' '_' '_'; '_' 'O' '_'; '_' '_' 'O'];
[row, col] = choosemove(board, 'X');

%% game simulation
close all; clear all; clc
board = ['_' '_' '_'; '_' '_' '_'; '_' '_' '_'];
for i = 1:9
    if mod(i, 2) == 0
        char = 'O';
    else
        char = 'X';
    end
    clc
    [row, col] = choosemove(board, 'X');
    if row < 0
        break
    end
    board(row, col) = char;
    board
    pause(1)
end

%% aggressive game simulation
close all; clear all; clc
board = ['O' '_' 'X'; 'X' '_' '_'; 'X' 'O' 'O'];
for i = 1:9
    if mod(i, 2) == 0
        char = 'O';
    else
        char = 'X';
    end
    clc
    [row, col] = choosemoveAggressive(board, 'X');
    if row < 0
        break
    end
    board(row, col) = char;
    board
    pause(1)
end