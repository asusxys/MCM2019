load('task2.mat');
y=task2;
x=2012:1:2017;
for i=1:3:7
    plot(x,y(i,:))
    hold on
end

