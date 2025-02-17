%Author: Tarteel Alkaraan (25847208)
%Last Updated: 16/03/2025
%This is an edited version of [3]
function DisplayDiceScore(DiceScore)
    %Displaying Bar Graph
    Figure = figure;
    bar(DiceScore);
    xlabel('Index Picture');
    ylabel('Dice Score Similarity');
    title('Dice Score Similarity for Ball Pictures');
    ylim([0.8, 1]);
    
    NameFile = 'BallFrames/Figures/DiceScore.pdf';

    WidthPicture = 30;
    RatioHeight = 0.65;
    set(findall(Figure, '-property', 'FontSize'), 'FontSize', 22)

    set(findall(Figure, '-property', 'Interpreter'), 'Interpreter', 'latex')
    set(findall(Figure, '-property', 'TickLabelInterpreter'), 'TickLabelInterpreter', 'latex')
    set(Figure, 'Units', 'Centimeters', 'Position', [3 3 WidthPicture RatioHeight * WidthPicture])
    Position = get(Figure, 'Position');
    set(Figure, 'PaperPositionMode', 'Auto', 'PaperUnits', 'Centimeters', 'PaperSize', [Position(3), Position(4)])
    print(Figure, NameFile, '-dpdf', '-vector', '-fillpage')
end