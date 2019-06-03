%ÂúÅ×ÎïÏß»ìãçÐòÁÐ
function chaoticmtx=chaotic1(row,col,seed,u)
if nargin<3
   seed=0.5;
end
if nargin<4
   u=1.5;
end
seed=sin(seed);
chaoticmtx(1,1)=1-u*seed*seed;
for i=2:row*col
    chaoticmtx(1,i)=1-u*chaoticmtx(1,i-1)*chaoticmtx(1,i-1);
end    
for i=1:row*col
    chaoticmtx(1,i)=0.4+asin(chaoticmtx(1,i))/pi;
end
chaoticmtx=reshape(chaoticmtx,row,col);

