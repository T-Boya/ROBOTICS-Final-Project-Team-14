function [locations] = findDarkestRows(img, rows, k, vertical)
    % x = linspace(1, rows, rows);
    y = zeros(1, rows);
    for i = 1:rows
        if vertical
            y(i) = abs(sum(img(:,i)));
        else
            y(i) = abs(sum(img(i,:)));
        end
    end
    % plot(x, y);
    [peaks, locations] = findpeaks(y, 'MinPeakDistance', 100);
    [~, locationsTemp] = maxk(peaks, k);
    for i = 1:k
        locationsTemp(i) = locations(locationsTemp(i));
    end
    locations = locationsTemp;
end