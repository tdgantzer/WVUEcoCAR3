%WVU Vehicle Detect and Estimate Distance
%load detector
detector = vision.CascadeObjectDetector('cardetect10_0_5.xml','MinSize',[50,50],'MergeThreshold',50);%,'MaxSize',[400,400]);

% Load stereo parameters
%load('WVUStereoPatameters.mat')
load stereoParams

% Set range for disparity and point cloud
disparityRange = [0 64];
thresholds=[-5 5;-5 10;0 30]; 

% Load input
vidL = VideoReader('Camera7L_final.mp4');
numberofFramesL = vidL.NumberOfFrames;
fprintf('Video File: %s\n',vidL.Name);


vidR = VideoReader('Camera7R_final.mp4');
numberofFramesR = vidR.NumberOfFrames;
fprintf('Video File: %s\n',vidR.Name);

cdataL = read(vidL, 100);
cdataR = read(vidR, 100);
[imageL,imageR] =  rectifyStereoImages(cdataL,cdataR,stereoParams);
disparityMap = disparity(rgb2gray(imageL),rgb2gray(imageR),'DisparityRange',disparityRange);
ptCloud = reconstructScene(disparityMap,stereoParams);


ptCloud = ptCloud/1000;
ptCloud = thresholdPC(ptCloud,thresholds);

writer1 = VideoWriter('WVUDistanceEstimationOutput1.mp4','MPEG-4');   
writer1.FrameRate = 25;
open(writer1);

VP = vision.DeployableVideoPlayer;

i = 1200;
while i<= numberofFramesR

    cdataL = read(vidL, i);
    cdataR = read(vidR, i);
    
    bboxes = step(detector, cdataL);
    
    x1 = bboxes(:,1);
    x2 = bboxes(:,1)+bboxes(:,3);
    y1 = bboxes(:,2);
    y2 = bboxes(:,2)+bboxes(:,4);
    ptCloudZRoi = ptCloud(y1:y2,x1:x2,3);
    
    distance = mean(ptCloudZRoi(:),'omitnan')
    
    frame = insertObjectAnnotation(cdataL,'rectangle',bboxes,num2str(distance));
    writeVideo(writer1,frame); 
     step(VP,frame);
    i=i+1;
end

release(detector);
release(VP);
close(writer1);
