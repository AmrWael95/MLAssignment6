 %note: to import the data set I used the function import in the home menu
%and excluded the rows and columns that I don't need
T = housepricesdatatrainingdata1(1:17999,1:18);
 for w=1:n
    T(:,w)=(T(:,w)-mean((T(:,w))))./std(T(:,w));
end
Jmat = ones(100);
    J =0;
     for ks=1:100
         J=0;
        [Clusters locations] = kmeans(T(:,1:17),ks);
        sum1= 0;
    for m=1:17999  
       J = J + (abs(T(m)-locations(Clusters(m))))^2  ;   
    end
    J = (1/17999)*J;
    Jmat(ks)= J;
     end
     size(Jmat)
   xo = 1:1:100;  
     plot(xo,Jmat)
     % in case of reduced data set instead of T , T(:,1:17) will be used
     
