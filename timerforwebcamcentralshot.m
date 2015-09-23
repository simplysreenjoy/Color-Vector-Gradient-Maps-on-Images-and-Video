%Processing frames in real-time
%Edge Detection via Color Vector Gradient
%For Image Sequences and video from webcam feed
%Timer Function
%Author: Sreenjoy Chatterjee
%Digital Video Processing
%MS Electrical Engineering
%Rochester Institute of Technology,2013.
%Created:2/21/2014

function timerforwebcamcentralshot(obj,event,vid)
    persistent IM;
    persistent IM2;
    persistent handlesRaw;
    persistent handlesRaw2;
    
    trigger(vid);
    IM=getdata(vid,1,'uint8');
    IM2=cvg(IM);
    
    if isempty(handlesRaw)
    subplot(121)
    handlesRaw=imshow(IM);
    title('Real-life webcam feed');
    subplot(122)
    handlesRaw2=imshow(IM2);
    title('Vector Gradient webcam feed');
    else
    set(handlesRaw,'CData',IM);
    set(handlesRaw2,'CData',IM2);
    end
    
