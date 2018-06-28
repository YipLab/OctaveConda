function ImageStack = ReadStackFromTiff(filename)
  
  InfoImage = imfinfo(filename);
  mImage = InfoImage(1).Width;
  nImage = InfoImage(1).Height;
  NumberImages = length(InfoImage);
  
  ImageStack = zeros(mImage,nImage,NumberImages,'uint16');
  for i = 1:NumberImages
    ImageStack(:,:,i) = imread(filename, 'index', i, 'info', InfoImage);
  end
  
end