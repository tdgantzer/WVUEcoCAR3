% Auto-generated by stereoCalibrator app on 10-Jan-2017
%-------------------------------------------------------


% Define images to process
imageFileNames1 = {'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\10.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\11.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\12.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\14.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\15.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\16.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\17.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\18.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\19.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\2.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\20.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\21.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\23.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\24.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\25.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\26.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\28.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\29.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\3.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\31.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\32.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\33.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\4.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\7.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\8.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam1\9.png',...
    };
imageFileNames2 = {'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\10.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\11.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\12.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\14.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\15.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\16.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\17.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\18.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\19.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\2.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\20.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\21.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\23.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\24.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\25.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\26.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\28.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\29.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\3.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\31.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\32.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\33.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\4.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\7.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\8.png',...
    'C:\Users\MAE\Desktop\adas_final\New code\Caliberation Images\cam2\9.png',...
    };

% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames1, imageFileNames2);

% Generate world coordinates of the checkerboard keypoints
squareSize = 25;  % in units of 'mm'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[stereoParams, pairsUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'mm', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', []);

% View reprojection errors
h1=figure; showReprojectionErrors(stereoParams, 'CameraCentric');

% Visualize pattern locations
h2=figure; showExtrinsics(stereoParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, stereoParams);

% You can use the calibration data to rectify stereo images.
I1 = imread(imageFileNames1{1});
I2 = imread(imageFileNames2{1});
[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('StereoCalibrationAndSceneReconstructionExample')
% showdemo('DepthEstimationFromStereoVideoExample')
