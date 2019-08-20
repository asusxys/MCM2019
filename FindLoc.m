%% find locations
function [loc]=FindLoc(TotalLevel)
load('TotalLevel.mat')
loc=zeros(2,380);
ini=TotalLevel(:,8);
y21=TotalLevel(:,12);
y52=TotalLevel(:,43);
k=1;
k1=1;
for i=1:380
    if ini(i)==0 && y21(i)==2
        loc(1,k)=i;
        k=k+1;
    end
    if ini(i)==0 && y52(i)==1
        loc(2,k1)=i;
        k1=k1+1;
    end
end
end