function MeasureCellSize(image)

    I = imread(image);
    BW = im2bw(I);
    
    %measure the area of the cells
    measurements = regionprops(BW, 'Area');
    allAreas = [measurements.Area];
    
    histogram(allAreas,'Normalization','probability','FaceColor',[0.5,0.5,0.5])
    xlabel('Cell Area (pixels)')
    ylabel('Percentage of Cells')

end