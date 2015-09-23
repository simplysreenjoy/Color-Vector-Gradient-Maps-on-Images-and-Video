%Processing frames in real-time
%Edge Detection via Color Vector Gradient
%For Image Sequences and video from webcam feed
%Main Function - Webcam Central Shot 1
%Author: Sreenjoy Chatterjee
%Digital Video Processing
%MS Electrical Engineering
%Rochester Institute of Technology,2013.
%Created:2/21/2014

close all;clear all;clc;
NumberFrameDisplayPerSecond=10; 
rawvid=videoinput('winvideo',1,'MJPG_1280x720');
set(rawvid,'FramesPerTrigger',1);
set(rawvid,'TriggerRepeat',Inf);
set(rawvid,'ReturnedColorSpace','RGB');
triggerconfig(rawvid,'Manual')

Timer=timer('TimerFcn', {@timerforwebcamcentralshot,rawvid},'Period',1/NumberFrameDisplayPerSecond,'ExecutionMode','fixedRate');

start(rawvid)
start(Timer)

stop(Timer)
stop(rawvid)
