function ColorByCellSize (image)

    I = imread(image);
    BW = im2bw(I);
    
    %count the number of cells
    CountCells = imbinarize(I);
    [CountCellNumber,~] = bwboundaries(BW,'noholes');
    
    %measure the area of the cells
    measurements = regionprops(BW, 'Area');
    allAreas = [measurements.Area];
    
    %plot size labels of each boundaried area
    [B,L] = bwboundaries(BW,'noholes');
    for i = 1:size(L,1)
        for j = 1:size(L,2)
            if L(i,j) > 0
                CellArea(i,j) = allAreas(1,L(i,j));
            else
                CellArea(i,j) = 0;
            end
        end
    end
    imshow(label2rgb(CellArea, @jet, [.5 .5 .5]))
    hold on
    for k = 1:length(B)
       boundary = B{k};
       plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
    end
    xlabel(strcat(num2str(size(CountCellNumber,1)),' Cells Counted'))
end