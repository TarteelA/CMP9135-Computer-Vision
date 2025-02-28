%Author: Tarteel Alkaraan (25847208)
%Last Updated: 28/02/2025
%This is an edited version of [3]
PathGroundTruth = 'BallFrames/GroundTruth/';
PathMask = 'BallFrames/Mask/';

DiceScore = zeros(1, 63);

for I = 54:116
    %Load Ball Region Segmented and Ball Mask Ground-Truth in Balck and White
    A = imread([PathMask 'frame-' num2str(I) '.png']);
    B = imread([PathGroundTruth 'frame-' num2str(I) '_GT.png']);

    %Change Grayscale Pictures to Black and White
    A = imbinarize(uint8(A));
    B = imbinarize(uint8(B));

    %Compute Intersection between A and B
    Intersection = sum(sum(A & B));

    %Compute Size of A and B
    ASize = sum(sum(A));
    BSize = sum(sum(B));

    %Compute Dice Score Similarity (DS)
    DiceScore(I - 53) = 2 * Intersection ./ (ASize + BSize);
end   

%Compute Average and Standard Deviation of Dice Score Similarity
DiceScoreAverage = mean(DiceScore);
DiceScoreStandardDeviation = std(DiceScore);
disp(['Dice Score Similarity Average for Ball Pictures is ' num2str(DiceScoreAverage)]);
disp(['Dice Score Similarity Standard Deviation for Ball Pictures is ' num2str(DiceScoreStandardDeviation)]);
DisplayDiceScore(DiceScore);

%Compute Mean and Standard Deviation of Dice Score
DiceScoreMean = mean(DiceScore);
DiceScoreStandardDeviation = std(DiceScore);

%Arange Dice Score Array in Ascending Order
[DiceScoreSorted, IndicesSorted] = sort(DiceScore);

%Plot 5 Worst Ball Segmented Pictures and their relating Ground-Truth Mask Picture
DisplayPictures(IndicesSorted, DiceScore, 'Worst');

%Plot 5 Best Ball Segmented Pictures and their relating Ground-Truth Mask Picture
DisplayPictures(IndicesSorted, DiceScore, 'Best');
