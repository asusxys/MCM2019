%% task 2 :considering the socio-economic data
function [AddRate]=AddFactor(weight,gamma)
% this function is to calculate the additional increase caused by socio-economic factors
% input : the weight matrix of selected factors
% output : the additional increase
load('sub.mat');         % load the socio-economic data(380*15)
k2=0;
AddRate=zeros(380,50);  % 2012-2062
for i=1:50
%     p_decre=rand(380,1)*gamma;
    if i<6
        k1=k2+1;
        k2=k1+2;
        newWeight=NORMALIZE(weight(:,i)); % 3*1  
        subs=sub(:,k1:k2);   %380 * 3
        AddRate(:,i)=NORMALIZE(subs*newWeight)
%         AddRate(:,i)=NORMALIZE(subs*newWeight)-p_decre;    
    else
        AddRate(:,i)=AddRate(:,5);
    end
end
end