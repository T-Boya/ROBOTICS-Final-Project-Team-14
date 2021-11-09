% Note: Takes in grayscale images

function [img] = removeWhitespace(img)
    [rows, cols] = size(img);

    % remove vertical whitespace
    % x = linspace(1, cols, cols);
    y = zeros(1, cols);
    for i = 1:cols
        y(i) = -sum(img(:,i));
    end
    % plot(x, y);
    [peaks, locations] = findpeaks(y, 'MinPeakDistance', 100);
    [~, locationsTemp] = maxk(peaks, 4);
    for i = 1:4
        locationsTemp(i) = locations(locationsTemp(i));
    end
    locations = locationsTemp;
    img = img(:,min(locations):max(locations));

    % remove horizontal whitespace
    % x = linspace(1, rows, rows);
    y = zeros(1, rows);
    for i = 1:rows
        y(i) = -sum(img(i,:));
    end
    % plot(x, y);
    [peaks, locations] = findpeaks(y, 'MinPeakDistance', 100);
    [~, locationsTemp] = maxk(peaks, 4);
    for i = 1:4
        locationsTemp(i) = locations(locationsTemp(i));
    end
    locations = locationsTemp;
    img = img(min(locations):max(locations),:);
end