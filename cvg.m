
%Function for Vector Color Gradient Algorithm for Color Images (in RGB Space)
%Implementation of Lee & Cook's Paper on
%Detecting Boundaries in a vector field
% Input Image I and Output Image Ga
%Author: Sreenjoy Chatterjee
%Digital Video Processing
%MS Electrical Engineering
%Rochester Institute of Technology,2013.
%Created:2/9/2014

function cvgi=cvg(I)
I2=im2double(I);
I2r=I2(:,:,1);
I2g=I2(:,:,2);
I2b=I2(:,:,3);

h=[1 1 1;0 0 0;-1 -1 -1];

I2rux=imfilter(I2r,h,'conv');
I2gux=imfilter(I2g,h,'conv');
I2bux=imfilter(I2b,h,'conv');
                
I2ruy=imfilter(I2r,h','conv');
I2guy=imfilter(I2g,h','conv');
I2buy=imfilter(I2b,h','conv');

I2rvx=imfilter(I2r,h','conv');
I2gvx=imfilter(I2g,h','conv');
I2bvx=imfilter(I2b,h','conv');
                
I2rvy=imfilter(I2r,h,'conv');
I2gvy=imfilter(I2g,h,'conv');
I2bvy=imfilter(I2b,h,'conv');

I2ruxy=I2rux.^2+I2ruy.^2;
I2guxy=I2gux.^2+I2guy.^2;
I2buxy=I2bux.^2+I2buy.^2;

I2rvxy=I2rvx.^2+I2rvy.^2;
I2gvxy=I2gvx.^2+I2gvy.^2;
I2bvxy=I2bvx.^2+I2bvy.^2;

I2ru=I2ruxy.^(1/2);
I2gu=I2guxy.^(1/2);
I2bu=I2buxy.^(1/2);
                
I2rv=I2rvxy.^(1/2);
I2gv=I2gvxy.^(1/2);
I2bv=I2bvxy.^(1/2);

p=(I2ru.^2)+(I2gu.^2)+(I2bu.^2);
q=(I2rv.^2)+(I2gv.^2)+(I2bv.^2);

t=(I2ru.*I2rv)+(I2gu.*I2gv)+(I2bu.*I2bv);

r=p.*q;

g3=(p+(q.^2)-(4*r)-(t.^2));
g2=g3.^(1/2);
g1=(p+q+g2)/2;

G=g1.^(1/2);
        
cvgi=abs(G);
     
% figure(),imshow(cvgi)
end








         




