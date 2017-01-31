%% Read Input Image
img = imread('pedestrian.jpg');
figure;imshow(img);

%% Non-stop sign images
negativeFolder = [matlabroot,'\toolbox\vision\visiondata\nonStopSigns'];


%% Open Un-Labeled Images

trainingImageLabeler([matlabroot,'\toolbox\vision\visiondata\stopSignImages'])

%% Open Labeled Images 
trainingImageLabeler('LabelingSession.mat')

%% Train detector
detectorFile = 'StopSignDetector.xml';
trainCascadeObjectDetector(detectorFile,positiveInstances,negativeFolder);


%% Test Trained Detector
detector = vision.CascadeObjectDetector(detectorFile);
bbox = step(detector, img);
detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'stop sign','LineWidth',5,'FontSize',40);
figure; imshow(detectedImg);
