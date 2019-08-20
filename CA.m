function [newq,q,rate_matrix,TOTALstate,TotalLevel,total_rate]=CA(TotalCounty,...
                          ADJ_matrix,ini_state,iter,lambda,mu,infec_rate,add_rate)
% The function applies CA model
% input:TotalCounty:total number of the county
%       ADJ_matrix:reflect the connection between two counties
%       ini_state:the initial number of "TotalDrugReportsCounty"
%       iter:the iteration number
%       lambda:the affection of neighbor
%       mu:the stochastic death rate
%       infec_rate:the infection rate
% output:TOTALstate:the simulation result 
% state transition:
% state 1:low-risk county=0
% state 2:susceptible county=1
% state 3:high-risk county=2
% The redder the color, the more the number
% The bluer the color, the less the number
%% I. initialize the state
% find the initial level of each county
TotalLevel=zeros(TotalCounty,iter+1);   %all levels over time
LEVEL=findlevel(ini_state);
TOTALstate=zeros(TotalCounty,iter+1);
total_rate=zeros(TotalCounty,iter);
% z=zeros(TotalCounty,iter+1);
o=ones(TotalCounty,1);
state=ini_state;
subplot(2,4,1)
imagesc(reshape(LEVEL,20,19));
colormap('jet')
axis equal
axis tight
TOTALstate(:,1)=state;
TotalLevel(:,1)=LEVEL;

[rate_matrix,q,newq]=RATE(ini_state,ADJ_matrix,lambda,mu);
k=2;

%% II. Update states and determine the county's risk level
for i=1:iter
    [rate_matrix,q,newq]=RATE(state,ADJ_matrix,lambda,mu);
    rate_matrix=0.3*rate_matrix+0.3*infec_rate(:,i)+0.3*add_rate(:,i);
    total_rate(:,i)=rate_matrix;
%     rate_matrix=0.5*rate_matrix+0.5*infec_rate(:,i)
    state=state.*(rate_matrix+o);
    TOTALstate(:,i+1)=state;    %All states contain
    LEVEL=findlevel(state);    
    TotalLevel(:,i+1)=LEVEL;    %All levels contain
%     imagesc(reshape(LEVEL,20,19));
%     colormap('jet')
%     axis equal
%     axis tight
% %     pause(1)
%     drawnow
%     if i>7
%         subplot(2,2,i-7)
%         imagesc(reshape(state,20,19))
%         colormap('jet')
%         pause(1)
%         drawnow
%     end
%     subplot(2,6,i+1)
    if rem(i,6)==0 && i<48
        subplot(2,4,k)
        imagesc(reshape(LEVEL,20,19))
        colormap('jet')
        axis equal
        axis tight
        drawnow 
        k=k+1;
    end
%     if i== 11
%         subplot(1,2,1)
%         imagesc(reshape(LEVEL,20,19))
%         colormap('jet')
%         title('2021')
%         axis equal
%         axis tight
%         pause(1)
%         drawnow 
%     elseif i==42
%         subplot(1,2,2)
%         imagesc(reshape(LEVEL,20,19))
%         colormap('jet')
%         title('2052')
%         axis equal
%         axis tight
%         pause(1)
%         drawnow 
%     end
   
end
end

