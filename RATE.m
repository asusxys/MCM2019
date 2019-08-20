function [RATE,Q,newQ]=RATE(state,ADJ_matrix,lambda,mu)
% The function applies CA model
% input:ADJ_matrix:reflect the connection between two counties
%       state:the initial number of "TotalDrugReportsCounty"
%       lambda:the affection of neighbor
%       mu:the stochastic death rate
%       infec_rate:the infection rate
% output:Q:a matrix stand for the change rate of "TotalDrugReportsCounty"
%% Calculate the RATE Matrix
n=size(state,1);
Q=zeros(n,1);
max=0;
for i=1:n
    for j=1:n
        if ADJ_matrix(i,j)==1
            if state(j)>max
                max=state(j);
            end
        end
    end
    Q(i)=max;
    max=0;
end  
newQ=NORMALIZE(Q);
normstate=NORMALIZE(state);
RATE=lambda.*newQ-mu.*normstate;

end
