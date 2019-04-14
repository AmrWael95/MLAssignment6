X =  housepricesdatatrainingdata1(1:17999,1:18);
n=length(X(1,:));
for w=1:n
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
end
cov_data = cov(X);
u = mean(X,1);
y = mvnpdf(X,u,cov_data)
plot3(X(:,1),X(:,2),y)
%example for plotting 2 features versus the pdf

