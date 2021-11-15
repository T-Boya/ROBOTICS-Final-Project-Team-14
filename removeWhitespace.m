% Note: Takes in grayscale images

function [img] = removeWhitespace(img)
    [rows, cols] = size(img);

    % Removes vertical whitespace
    locations = findDarkestRows(img, cols, 4, true);
    img = img(:,min(locations):max(locations));

    % Removes horizontal whitespace
    locations = findDarkestRows(img, rows, 4, false);
    img = img(min(locations):max(locations),:);
end