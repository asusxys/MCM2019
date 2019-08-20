load('real.mat')
reallevel=zeros(380,6);
for i=1:6
    reallevel(:,i)=findlevel(real);
end
real_p=propOfThreeLevels(reallevel,5);