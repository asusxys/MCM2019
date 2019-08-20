function infec_rate=LEVEL_OF_INFECT(TotalCounty,inc_rate,iter)
infec_rate=zeros(TotalCounty,iter);
% maxmin=max(inc_rate)-min(inc_rate);
for i=1:iter
    if i<6
        for j=1:TotalCounty
            temp=inc_rate(j,i);
            if temp<=0
                infec_rate(j,i)=-0.01;
            elseif temp<=1
                infec_rate(j,i)=0;
            elseif temp<=2
                infec_rate(j,i)=0.1;
            else
                infec_rate(j,i)=2;
            end
        end
    else
        for j=1:TotalCounty
            temp=inc_rate(j,5);
            if temp<=0
                infec_rate(j,i)=-0.01;
            elseif temp<=1
                infec_rate(j,i)=0;
            elseif temp<=2
                infec_rate(j,i)=0.1;
            else
                infec_rate(j,i)=2;
            end
        end
    end
end
