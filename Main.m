%Author: Tarteel Alkaraan (25847208)
%Last Updated: 16/03/2025
%This is an edited version of [3]
%Go Through All Pictures
Ground_Truth_Pictures = dir('BallFrames/GroundTruth/*.png');
Pictures = dir('BallFrames/Original/*.png');
Output = 'BallFrames/Mask/';

for I = 1:length(Pictures)
    %Read Picture
    Picture = imread(Pictures(I).folder + "/" + Pictures(I).name);

    %% Threshold Whole Picture and Look for Balls
    %Change Picture to Black and White using Otsu Thresholding
    MaskOtsu = imbinarize(Picture(:, :, 1), 'adaptive', 'Sensitivity', 0.35);

    %Look For Balls in Picture
    MaskBalls = LookForBalls(MaskOtsu);

    %% Save Mask
    imshow(MaskBalls)
    %imshow(MaskOtsu)
    %imwrite(MaskBalls, fullfile(Output, Pictures(I).name));
end
close("all")
