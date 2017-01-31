%% Exercise : Train a stop sign detector and test on single image

%% Read Input Image
img = imread('StopSign.jpg');
figure;imshow(img);

%% Non-stop sign images
negativeFolder = 'non stop sign images';

%% Positive Instances
load stopSigns
positiveInstances = data;

%% Train detector
detectorFile = 'StopSignDetector.xml';
trainCascadeObjectDetector(detectorFile, ...
                         positiveInstances, negativeFolder,...
                         'FalseAlarmRate', 0.01,'NumCascadeStages', 10);


%% Test Trained Detector
detector = vision.CascadeObjectDetector(detectorFile);
bbox = step(detector, img);
detectedImg = insertObjectAnnotation(img, 'rectangle', bbox, 'stop sign','LineWidth',5,'FontSize',40);
figure; imshow(detectedImg);

%% Test Trained Detector on Video
VideoStopSignDetector