tic;
clear all; close all; clc;

videoFReader = vision.VideoFileReader('kol_time_lapse_5.mp4');
videoFWriter = vision.VideoFileWriter('kol_time_lapse_5_cvg4.avi','FrameRate',videoFReader.info.VideoFrameRate, 'VideoCompressor','MJPEG Compressor');
videoPlayer = vision.VideoPlayer;

while ~isDone(videoFReader)
   frame = step(videoFReader);
   frame2 = cvg(frame);
%    frame = uint8(cvg(frame));
   step(videoFWriter,frame2);
end

release(videoFReader);
release(videoFWriter);

toc;