%Author: Tarteel Alkaraan (25847208)
%Last Updated: 16/02/2025
%This is an edited version of [3]
function DisplayPictures(Pictures, DiceScore, Name)
    PathGroundTruth = 'BallFrames/GroundTruth/';
    PathMask = 'BallFrames/Mask/';
    Figure = figure;

    for I = 1:5
        if strcmp(Name, 'Best')
            subplot(5, 2, I + (I - 1));
            imshow([PathMask 'frame-' num2str(Pictures(end - I + 1) + 53) '.png']);
            title(['Best Picture ' num2str(Pictures(end - I + 1) + 53) ' - Dice Score: ' num2str(round(DiceScore(Pictures(end - I + 1)), 3))]);

            subplot(5, 2, I * 2);
            imshow([PathGroundTruth 'frame-' num2str(Pictures(end - I + 1) + 53) '_GT.png']);
            title(['Ground Truth Mask Picture ' num2str(Pictures(end - I + 1) + 53)]);
        elseif strcmp(Name, 'Worst')
            subplot(5, 2, I + (I - 1));
            imshow([PathMask 'frame-' num2str(Pictures(I) + 53) '.png']);
            title(['Worst Picture ' num2str(Pictures(I) + 53) ' - Dice Score: ' num2str(round(DiceScore(Pictures(I)), 3))]);

            subplot(5, 2, I * 2);
            imshow([PathGroundTruth 'frame-' num2str(Pictures(I) + 53) '_GT.png']);
            title(['Ground Truth Mask Picture ' num2str(Pictures(I) + 53)]);
        end
    end

    NameFile = strcat('BallFrames/Figures/', Name, '.pdf');
    WidthPicture = 30;
    RatioHeight = 1.4;
    set(findall(Figure, '-property', 'FontSize'), 'FontSize', 22)

    set(findall(Figure, '-property', 'Interpreter'), 'Interpreter', 'latex')
    set(findall(Figure, '-property', 'TickLabelInterpreter'), 'TickLabelInterpreter', 'latex')
    set(Figure, 'Units', 'Centimeters', 'Position', [3 3 WidthPicture RatioHeight * WidthPicture])
    Position = get(Figure, 'Position');
    set(Figure, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Centimeters', 'PaperSize', [Position(3), Position(4)])
    print(Figure, NameFile, '-dpdf', '-vector', '-fillpage')
end
