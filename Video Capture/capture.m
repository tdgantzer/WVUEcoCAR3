clear all
clc
frequency=1000;
info = imaqhwinfo('winvideo');
info.DeviceInfo.SupportedFormats
tic;
vid1 = videoinput('winvideo', 1,'YUY2_640x480');
imaqhwinfo(vid1)
vid2 = videoinput('winvideo', 2,'YUY2_640x480');
imaqhwinfo(vid2)
disp('Cameras Initialized'); 
set(vid1, 'FramesPerTrigger', inf);
set(vid2, 'FramesPerTrigger', inf);
set(vid1, 'ReturnedColorspace', 'rgb');
set(vid2, 'ReturnedColorspace', 'rgb');
vid1.FrameGrabInterval = 1;
vid2.FrameGrabInterval = 1;
start(vid1)
start(vid2)

writer1.FrameRate = 25;
writer2.FrameRate = 25;
%folder = strcat(folderL, '/');
%folder = strcat(folderR, '/');
for iFrame = 1:frequency                  
          disp(iFrame);
          I=getsnapshot(vid1);
          J=getsnapshot(vid2);
          savename1 = sprintf('Snap1/test%d.jpeg',iFrame);
          savename2 = sprintf('Snap2/test%d.jpeg',iFrame);
          imwrite(I, savename1);
          imwrite(J, savename2);
        flushdata(vid1);
        flushdata(vid2);

end
stop(vid1);
stop(vid2);


flushdata(vid1);
flushdata(vid2);
toc;