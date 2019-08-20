function [level_matrix]=findlevel(state_matrix)
%this function aims to find the corresponding level
%three levels in total
%total drugs: 0-1000 low-risk(0)
%             1000-10000 susceptible(1)
%             10000- high-risk(2)
thr1=1000;
thr2=10000;
n=size(state_matrix,1);
level_matrix=zeros(n,1);
for i=1:n
    if state_matrix(i)<=thr1
        level_matrix(i)=0;
    elseif state_matrix(i)<=thr2
        level_matrix(i)=1;
    else
        level_matrix(i)=2;
    end
end
end
