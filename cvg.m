%% Function for Vector Color Gradient Algorithm for Color Images and Video Frames (in RGB Space) %%

%%
% Author: Sreenjoy Chatterjee
% MS Electrical Engineering
% Rochester Institute of Technology.
% Created: 2/9/2014

%%
% In this technique, we propose an algorithm which effectively detects 
% boundaries in vector fields. An edge map is first created for a single image, 
% be it grayscale or color. Then the same algorithm is extended to video,
% by reading the frames one at a time and processing them in real-time. 
% A vector gradient edge detector is employed, wherein the gradient 
% magnitude is calculated by using the partial derivative analysis of the 
% pixel intensities.

%%
% Input (I) - RGB Image or Video Frame
% Output Image (cvgi) - Edge Map for Image or Video Frame

%%
function cvgi=cvg(I)

% Conversion of image type from type uint8 to double and separating color channels
I2 = im2double(I);
I2r = I2(:,:,1);
I2g = I2(:,:,2);
I2b = I2(:,:,3);

% Sobel kernel for computing gradients across the image
% h - Sobel filter for horizontal gradients or edges
% h' - Sobel filter for vertical gradients or edges
h = [1 1 1;0 0 0;-1 -1 -1];

% The next few steps involve individually convolving each color channel
% with theie respective kernels.
% This means we extrct horizontal and vertical gradients individually
% and then combine them to acquire the final edge map
I2rux = imfilter(I2r,h,'conv');
I2gux = imfilter(I2g,h,'conv');
I2bux = imfilter(I2b,h,'conv');
                
I2ruy = imfilter(I2r,h','conv');
I2guy = imfilter(I2g,h','conv');
I2buy = imfilter(I2b,h','conv');

I2rvx = imfilter(I2r,h','conv');
I2gvx = imfilter(I2g,h','conv');
I2bvx = imfilter(I2b,h','conv');
                
I2rvy = imfilter(I2r,h,'conv');
I2gvy = imfilter(I2g,h,'conv');
I2bvy = imfilter(I2b,h,'conv');

I2ruxy = I2rux.^2+I2ruy.^2;
I2guxy = I2gux.^2+I2guy.^2;
I2buxy = I2bux.^2+I2buy.^2;

I2rvxy = I2rvx.^2+I2rvy.^2;
I2gvxy = I2gvx.^2+I2gvy.^2;
I2bvxy = I2bvx.^2+I2bvy.^2;

I2ru = I2ruxy.^(1/2);
I2gu = I2guxy.^(1/2);
I2bu = I2buxy.^(1/2);
                
I2rv = I2rvxy.^(1/2);
I2gv = I2gvxy.^(1/2);
I2bv = I2bvxy.^(1/2);

% Extracting the eigenvectors from the matrix as stated
p = (I2ru.^2) + (I2gu.^2) + (I2bu.^2);
q = (I2rv.^2) + (I2gv.^2) + (I2bv.^2);

t = (I2ru.*I2rv) + (I2gu.*I2gv) + (I2bu.*I2bv);

r = p.*q;

g3 = (p + (q.^2) - (4*r) - (t.^2));
g2 = g3.^(1/2);
g1 = (p + q + g2)/2;

G = g1.^(1/2);
        
cvgi = abs(G);

end








         




