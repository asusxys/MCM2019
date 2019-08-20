function res=NORMALIZE(matrix)
n=size(matrix,1);
sum_all=sum(matrix);
res=matrix./sum_all;
end
