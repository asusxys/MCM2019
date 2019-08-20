function [prop]=propOfThreeLevels(TotalLevel,iter)
prop=zeros(3,iter+1);
total=zeros(1,3)
n=size(TotalLevel,1);
for i=1:iter+1
    for j=1:n
        if TotalLevel(j,i)==0
            total(1)=total(1)+1;
        elseif TotalLevel(j,i)==1
            total(2)=total(2)+1;
        else
            total(3)=total(3)+1;
        end
    end
    for k=1:3
        prop(k,i)=total(k)/sum(total);
    end
end
%% Judge if the proportion reach the threshold
% threshold=
% for i=1:iter+1
%     if prop(3,i)>=threshold
%         time=mat2str(2009+iter);
%         place=i;
%     end
% end
