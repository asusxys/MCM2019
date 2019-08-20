load('p2.mat')
x=2012:1:2062;
for i=1:36
    plot(x,newp2(i,:))
    hold on
end
