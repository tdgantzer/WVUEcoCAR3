clear all
clc

%Set paths and variables
path = './';
videoFile = './stopSignVideo3.mp4';
N_th = 1;

%Read Video
vid = VideoReader(videoFile);
numberofFrames = vid.NumberOfFrames;
fprintf('Video File: %s\n',vid.Name);

%Set Destination Folder and create it
[folder, name, ext]= fileparts(videoFile);
destFolder = strcat('./',name,'_images/');
if (0 == exist(destFolder, 'dir'))
    mkdir(destFolder);
    fprintf('Created Destination Folder: %s\n',destFolder);
else
    fprintf('Existing Destination Folder: %s\n', destFolder);
    fprintf('Overwriting data in destination Folder\n');
end
destFile = strcat('./',name,'_images/',name,'_frame_');

%Extract and save the N-th Frame
fprintf('Extracting frames from file..\n');
i = 1;
frameNum = 0;
while i<= numberofFrames
    currentFrame = read(vid, i);
    destPath = strcat(destFile,num2str(frameNum,'%03d'),'.jpg');
    imwrite(currentFrame, destPath)
    i = i + N_th;
    frameNum = frameNum + 1;
end

fprintf('\nCompleted.\nOpen folder %s to view files\n', destFolder);
    