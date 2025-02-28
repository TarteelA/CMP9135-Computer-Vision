%Author: Tarteel Alkaraan (25847208)
%Last Updated: 28/02/2025
%This is an edited version of [3]
Pictures = dir('BallFrames/Mask/*.png');

while true
    for I = 1:length(Pictures)
        Picture = imread(Pictures(I).folder + "/" + Pictures(I).name);
        imshow(Picture);
    end
end
