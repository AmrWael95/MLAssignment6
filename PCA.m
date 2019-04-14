%note: to import the data set I used the function import in the home menu
%and excluded the rows and columns that I don't need
T = housepricesdatatrainingdata1(1:17999,1:18);
n=length(T(1,:));
%Normalizing the data
for w=1:n
    T(:,w)=(T(:,w)-mean((T(:,w))))./std(T(:,w));
end
%correlation Matrix
Corr_x = corr(T);
%Covariance Matrix
Cov_x =cov(T);
% Singular value decomposition
[U S V] =  svd(Cov_x);

lambda = diag(S);
size(lambda)
k=1;
alpha =1000;
sum_m = sum(lambda);
%Finding optimum Number of features
while(alpha > 0.001)
alpha = 1-((sum(lambda(1:k))/sum_m));
        k = k+1;
    end;
   % size(T)
   size(U(:,1:17)');
   %getting the reduced data set
    R = U(:,1:17)'*(T)';
    new_T = U(:,1:17)*R;
    size(T);
    size(new_T);
    %finding the error
     errormatrix = (1/17999)*sum(T-new_T')
     
  