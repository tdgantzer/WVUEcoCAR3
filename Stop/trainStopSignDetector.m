% Load positive samples.
load('labelingSessionPos_Reduced.mat');

mypositiveInstances = struct2table(labelingSession.ImageSet.ImageStruct);
positives = mypositiveInstances(:,1:2);
negativeFolder = './stopSignNeg';
negativeImages = imageDatastore(negativeFolder);

trainCascadeObjectDetector('WVUstopSignDetector3.xml',positives,negativeFolder,'FalseAlarmRate',0.1,'NumCascadeStages',...
    10,'ObjectTrainingSize',[30,30]);