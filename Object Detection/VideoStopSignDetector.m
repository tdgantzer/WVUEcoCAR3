clear;

%% Read Detector Model
detectorFile = 'StopSignDetector.xml';
stopsignDetector = vision.CascadeObjectDetector(detectorFile,'MaxSize',[75 75]);

%% Read Video File and Create Video Player
camera = vision.VideoFileReader('stopSignVideoFullRes.avi','VideoOutputDataType','uint8');
videoPlayer = vision.DeployableVideoPlayer;
frame = step(camera);
step(videoPlayer,frame);

while videoPlayer.isOpen()
    frame = step(camera);
    bbox = step(stopsignDetector,frame);
    if size(bbox)
        detectedImg = insertObjectAnnotation(frame, 'rectangle', bbox, 'Stop Sign','FontSize',20);
        step(videoPlayer,detectedImg);
    else
        step(videoPlayer,frame);
    end
end

release(videoPlayer);
release(camera);

