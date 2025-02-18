%Author: Tarteel Alkaraan (25847208)
%Last Updated: 16/03/2025
%This is an edited version of [3]
function Output = LookForBalls(Picture)
    %% Close Shapes to Make Them Complete
    SE = strel('disk', 4);
    Picture = imclose(Picture, SE);
    Picture = imfill(Picture, 'holes');

    %% Make Shapes Convex to Delete Holes in Balls
    ConvComp = bwconncomp(Picture);
    State = regionprops(ConvComp, 'ConvexHull');
    Picture_Convex = false(size(Picture));

    for I = 1:numel(State)

        %Receive Convex Hull for Existing Shape
        HullConvex = State(I).ConvexHull;

        %Change Convex Hull to Black and White Mask
        Mask = poly2mask(HullConvex(:,1), HullConvex(:,2), size(Picture, 1), size(Picture, 2));

        %Mix Mask with Current Black and White Picture
        Picture_Convex = Picture_Convex | Mask;
        
    end

    %% Delete Shapes that are very small or to big, are to long, and have a low area to bounding box area ratio
    ConvComp2 = bwconncomp(Picture_Convex);
    State2 = regionprops(ConvComp2, 'Area', 'Centroid', 'Extent');

    X = [State2.Centroid];
    X = X(2:2:end);

    %Make New Black and White Picture where just Elliptical Shapes are included
    Shapes_Elliptical = ismember(labelmatrix(ConvComp2), find((325 < [State2.Area] & [State2.Area] < 2600) & (height(Picture) * 0.45 < X) & [State2.Extent] > 0.6));
    %imshow(Shapes_Elliptical)
    %imshow(Picture_Convex)
    Output = Shapes_Elliptical;
end
