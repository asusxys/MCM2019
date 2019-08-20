load('prop.mat')
x=2010:1:2110;
plot(x,p(2,:))
hold on
%% 计算一阶导数
% syms x;
% y=9e-08*x^3-0.00056*x^2+1.2*x-7.9e+02;
% z=diff(y,x);
% fplot(z)
%% 找出变化率最大的点
max_ratio=0;
point=1;
for i=10:100
    temp=p(2,i+1)-p(2,i);
    if temp>max_ratio
        max_ratio=temp;
        point=i+1;
    end
end
k=(p(2,point)-p(2,1))/(point-1);
syms u;
v=k*(u-2010)+p(2,1);
fplot(v)
xlim([2010,2110])
ylim([0.08,0.16])
hold on
scatter(point+2009,p(2,point),'r')