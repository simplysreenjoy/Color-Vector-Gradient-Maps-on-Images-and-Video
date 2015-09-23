
tic;
clear all; close all; clc;

vid_obj = VideoReader('kol_time_lapse_4.mp4');
% get(vid_obj);

vidWidth = vid_obj.Width; vidHeight = vid_obj.Height;

mov = struct('cdata',zeros(vidHeight,vidWidth,1,'uint8'),'colormap',[]);

k = 1;

while hasFrame(vid_obj)
    
    I = readFrame(vid_obj);
    I1 = cvg(I);
%     mov(k).cdata(:,:,1)= I1;
%     mov(k).cdata(:,:,2)= I1;
%     mov(k).cdata(:,:,3)= I1;
%     mov(k).cdata = I;

    
    k = k + 1;
    
end

hf = figure();

set(hf,'position',[150 150 vidWidth vidHeight]);
movie(hf,mov,1,vid_obj.FrameRate);


% writerObj = VideoWriter('peaks.avi');
% open(writerObj);
% 
% for k = 1:20 
% %    surf(sin(2*pi*k/20)*Z,Z)
%    frame = mov(k).cdata;
%    writeVideo(writerObj,frame);
% end
% 
% close(writerObj);
% 
% 
% 

toc;








