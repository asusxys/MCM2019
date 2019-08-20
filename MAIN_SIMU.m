%% This is the main code
load('adj.mat');
% load('ini.mat');
% load('inc.mat');
load('new_inc.mat');
load('new_ini.mat');
TotalCounty=380;

% load('ky_adj.mat');
% load('ky_ini.mat');
% load('ky_inc.mat');
% TotalCounty=105;

% load('oh_adj.mat');
% load('oh_ini.mat');
% load('oh_inc.mat');
% TotalCounty=86;

% load('pa_adj.mat');
% load('pa_ini.mat');
% load('pa_inc.mat');
% TotalCounty=64;

% load('wv_adj.mat');
% load('wv_ini.mat');
% load('wv_inc.mat');
% TotalCounty=28;

% load('va_adj.mat');
% load('va_ini.mat');
% load('va_inc.mat');
% TotalCounty=97;
load('weight.mat')   %a matrix of 5 * 3
load('realp.mat')
weight=weight';
ADJ_matrix=adj;
ini_state=new_ini;
iter=50;     %2012-2062
error=0;
min=10000;
key1=0;
key2=0;
mu=0.05;
inc_rate=new_inc;
infec_rate=LEVEL_OF_INFECT(TotalCounty,inc_rate,iter);
% p2=zeros(100,iter+1);
% rate_sus=zeros(100,iter);
count=0;
gamma=0.4;
add_rate=AddFactor(weight,gamma);   % 380 * year
total_p1=zeros(100,iter+1);
total_p2=zeros(100,iter+1);
total_p3=zeros(100,iter+1);
for lambda=0:0.2:2
    for mu=0.01:0.01:0.1
         count=count+1;
%         add_rate=AddFactor(weight,gamma);   % 380 * year
         [~,~,~,TOTALstate,TotalLevel,total_rate]=CA(TotalCounty,ADJ_matrix,...
                                              ini_state,iter,lambda,mu,infec_rate,add_rate);
          p=propOfThreeLevels(TotalLevel,iter);
          total_p1(count,:)=p(1,:);   %low-risk proportion
          total_p2(count,:)=p(2,:);   %susceptible
          total_p3(count,:)=p(3,:);   %high-risk
%         p2(count,:)=p(2,:);  %susceptible counties
%         temp=zeros(1,iter);
%         for k=1:iter
%             temp(k)=p2(k+1)-p(k);
%         end
%         rate_sus(count,:)=temp;
    end
end

             
                 