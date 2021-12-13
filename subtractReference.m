function [img] = subtractReference(img, reference)
    img = 255 - ((255 - img) - (255 - reference));
end