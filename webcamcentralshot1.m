%% Vector Color Gradient Edge Map Generation on Webcam Feed %%

%%
% Author: Sreenjoy Chatterjee
% MS Electrical Engineering
% Rochester Institute of Technology
% Created:2/21/2014

%%

% This script accesses the feed of your webcam and detects the gradients in
% the frames. 
% Output - Two windows, one displaying the real-time RGB feed
% and the second one, showing the gradient edge map for the video feed.

%%

% ******************  USER INPUT *****************************************
% You need to adapt this function based on your image acquisition hardware
% 1. Check that you have Image Acquisition Toolbox installed
% 2. Type 'imaqhwinfo' in Command Window and input adapter name below.

adapter_name = 'win_video';    % Default Adaptor is given as winvideo

% 3. Specify type of the acquired video feed and resolution.
%     Also to be found after running imaqhwinfo
    
resolution = 'MJPG_1280x720';  % Default Resolution is given as 1280x720

%%

close all; clc;

disp('Vector Color Gradient Edge Map Generation on Webcam Feed...');

%%
NumberFrameDisplayPerSecond = 10; 

% Construct a video input object based on the adaptor from your image 
% acquisition device.
rawVid = videoinput(adapter_name, 1 , resolution);

% The object is triggered infinitely with every trigger calling a single frame
% from the video feed i.e. the current frame which is a 3 channel RGB image
set(rawVid,'FramesPerTrigger',1);
set(rawVid,'TriggerRepeat',Inf);
set(rawVid,'ReturnedColorSpace','RGB');

% This sets the configuration of the trigger to manual,
% which means we have to start and stop the video object ourselves
% and it's not automatically recurring.
triggerconfig(rawVid,'Manual')

% This calls the timer function, where the major processing is done
% in terms of extracting the present frame, detecting the gradients, and 
% returning the vector edge map as a prospective frame.
Timer = timer('TimerFcn', {@timerforwebcamcentralshot,rawVid}, ...
    'Period',1/NumberFrameDisplayPerSecond,'ExecutionMode','fixedRate');

We operate the start/stop timings of the video object manually
start(rawVid), start(Timer)

stop(Timer), stop(rawVid)

%%

clc;
disp('Video Object Terminated and Operation terminated.');





