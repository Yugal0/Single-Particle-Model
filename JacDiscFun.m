function [Jn]=JacDiscFun(Y)
global n;
h=1e-5; 
Jn=zeros(n^2); 
for i=1:n^2
    ynext=Y;   
    yprev=Y;   
    ynext(i)=ynext(i)+h;  
    yprev(i)=yprev(i)-h;  
    Fnext=DiffFun(ynext);   
    Fprev=DiffFun(yprev);  
    for j=1:n^2
        Jn(j,i)=0.5*(Fnext(j)-Fprev(j))/h;    
    end
end
end