function [r,c] = chooseMoveRandom(Board)
    % randomly chooses a valid move
    check = 0;
    while check==0
        r =  randi([1 3]);
        c = randi([1 3]);

        charB = Board(r,c);
        if charB == '_'
            check = 1;
        end
    end
end