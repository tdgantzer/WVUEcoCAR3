clear all
clc
tic
frequency=1000;
writer1 = VideoWriter('CameraA.mp4','MPEG-4'); %Create a new AVI file
writer2 = VideoWriter('CameraB.mp4','MPEG-4'); %Create a new AVI file
open(writer1);
open(writer2);
for iFrame=1:frequency
    disp(iFrame);
    path1=sprintf('Snap1/test%d.jpeg',iFrame);
    path2=sprintf('Snap2/test%d.jpeg',iFrame);
    currImage1 = imread(path1);
    currImage2 = imread(path2);
    writeVideo(writer1,currImage1);
    writeVideo(writer2,currImage2);
    
end
toc
close(writer1);

close(writer2);