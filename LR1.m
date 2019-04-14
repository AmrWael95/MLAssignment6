%Here I used the full set with prices
T = housepricesdatatrainingdata(1:17999,3:21);
n=length(T(1,:));
for w=2:n
    T(:,w)=(T(:,w)-mean((T(:,w))))./std(T(:,w));
end
size(T)
Corr_x = corr(T(1:17999,2:18));
Cov_x =cov(T(1:17999,2:18));

[U S V] =  svd(Cov_x);

lambda = diag(S);
size(lambda);
k=1;
alpha =1000;
sum_m =sum(lambda)
while(alpha > 0.001)
alpha = 1-((sum(lambda(1:k))/sum_m));
        k = k+1;
    end;
   % size(T)
   size(U(:,1:17)');
    R = U(:,1:17)'*(T(1:17999,2:18))';
    new_T = U(:,1:17)*R;
    size(T(1:17999,2:18));
    size(new_T)
    size(T)
     errormatrix = sum(T(1:17999,2:18)-new_T');
    
% clear all
% ds = tabularTextDatastore('house_prices_data_training_data.csv','TreatAsMissing','NA',.....
%     'MissingValue',0,'ReadSize',25000);
 T = [T(1:17999,1) new_T']';
Alpha=.0001;
m=17999;
%U0=T{:,2}
T=T';
U1=T(:,2:18);
lambda = 0.5;
X=[ones(m,1) U1];
   % U1 U.^2 U.^3];
   
n=length(X(1,:));
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

Y=T(:,2)/mean(T(:,2));
Theta=zeros(n,1);
k=1;
size(X)
size(Y)
Theta
E(k)=(1/(2*m))*sum((X*Theta-Y).^2)+ ((lambda/(2*m))*sum(Theta.^2));
R=1;
while R==1
Alpha=Alpha*1;
Theta=Theta-(Alpha/m)*X'*(X*Theta-Y);
k=k+1
E(k)=(1/(2*m))*sum((X*Theta-Y).^2)+ ((lambda/(2*m))*sum(Theta.^2))
if E(k-1)-E(k)<0
    break
end 
q=(E(k-1)-E(k))./E(k-1);
if q <.01;
    R=0;
end

end
Theta