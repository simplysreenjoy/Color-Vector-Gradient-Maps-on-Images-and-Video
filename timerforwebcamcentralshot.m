%% Function for Edge Map Generation on Webcam Feed %%

%%
% Author: Sreenjoy Chatterjee
% MS Electrical Engineering
% Rochester Institute of Technology
% Created:2/21/2014

%%
function timerforwebcamcentralshot(~,~,videoStream)

%     Global Variables 
    persistent im_RGB;
    persistent im_CVG;
    persistent vidHandle;
    persistent vidHandle2;
    
%     Start video stream and acquire present frame via getdata
    trigger(videoStream);
    
%     Acquiring single frame from video Stream, of type uint8
    im_RGB = getdata(videoStream,1,'uint8');
    
%     Perform CVG on current frame and return as CVG frame
    im_CVG=cvg(im_RGB);
    
%     Windows to display both RGB and CVG frames as video
    if isempty(vidHandle)
        subplot(121)
        vidHandle = imshow(im_RGB);
        title('Incoming webcam video feed in RGB space');
        subplot(122)
        vidHandle2 = imshow(im_CVG);
        title('Vector Gradient Edge Map of incoming webcam video feed');
    else
        set(vidHandle,'CData',im_RGB);
        set(vidHandle2,'CData',im_CVG);
    end
    
    
    
    
    
    
    
