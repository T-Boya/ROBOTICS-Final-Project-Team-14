function [img] = subtractReference(img, reference)
    mismatchedDimensions = [ size(img); size(reference) ];
    dimensions = [ min(mismatchedDimensions(:,1)) min(mismatchedDimensions(:,2)) ];
    img = imresize(img, dimensions);
    reference = imresize(reference, dimensions);
    img = 255 - ((255 - img) - (255 - reference));
end