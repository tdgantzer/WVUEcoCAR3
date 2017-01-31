function MakeTimer()
   t=timer;
   t.StartFcn = @initTimer;
   t.TimerFcn = @timerCallback;
   t.Period   = 5;
   t.TasksToExecute = 3;
   t.ExecutionMode  = 'fixedRate';
   start(t);
   wait(t);
   delete(t);
end
function initTimer(src, event)
   src.UserData = 0;
   disp('initialised')
end
function timerCallback(src, event)
    src.UserData = src.UserData + 1;
    path1 = 'C:\Users\MAE\Desktop\adas_final\New code\cam1\';
    path2 = 'C:\Users\MAE\Desktop\adas_final\New code\cam2\';

    cam1 = webcam(1);
    cam1.Resolution= '1280x720';

    cam2 = webcam(2);
    cam2.Resolution = '1280x720';

    preview(cam1);
    preview(cam2);
    
    disp('5 Seconds to adjust object if needed..');
    pause(10);
        
    img1 = snapshot(cam1);
    img2 = snapshot(cam2);
    disp('Snapshot taken..');

    imwrite(img1,strcat(path1,num2str(src.UserData),'.png'));
    imwrite(img2,strcat(path2,num2str(src.UserData),'.png'));
    disp('Move to next position..You have 5 seconds');
end