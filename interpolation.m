function [points] = interpolation(startArray, endArray)% ignore this function, it is not used
    % given column vectors startArray and endArray of same size and (1 x n)
    n = max(abs(startArray - endArray)) * ceil(0.1);
    points = zeros(ceil(n), length(startArray));
    for i = 1:size(startArray)
        points(:,i) = linspace(startArray(i), endArray(i), n);
    end
end