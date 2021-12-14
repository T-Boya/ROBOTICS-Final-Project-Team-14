% helper function for evaluateScore
function [score] = assignScore(winner, myChar)
    if winner == myChar
        score = 10; return; end
    score = 0;
end