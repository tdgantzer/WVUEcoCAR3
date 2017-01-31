close all
clear
clc

path1 = 'C:\Users\MAE\Desktop\adas_final\New code\cam1\'
path2 = 'C:\Users\MAE\Desktop\adas_final\New code\cam2\'

cam1 = webcam(1);
cam1.Resolution= '1280x720';

cam2 = webcam(2);
cam2.Resolution = '1280x720';

preview(cam1);
preview(cam2);
num = 1;

disp('5 Seconds to adjust object if needed..');
while 1
    img1 = snapshot(cam1);
    img2 = snapshot(cam2);
    disp('Snapshot taken..');
    
    imwrite(img1,strcat(path1,num2str(num),'.png'));
    imwrite(img2,strcat(path2,num2str(num),'.png'));
    disp('Move to next position..You have 5 seconds');

    num = num + 1;
    k = waitforbuttonpress;
    if k == 1
        disp('Quitting....');
        break;
    end
end
