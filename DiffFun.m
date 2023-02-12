function [f]= DiffFun(y) %discretized function
global n;
delx=0.001;
f=zeros(1,n^2);
delt=0.001;
D=3.4e-10;
nc=1;
ic=10;
F=96500;
%k=(delx)^2/(2*D*delt);
%g=delx*i/(nc*F*D);
for i=n+1:n:n^2
    f(i)=D*(y(i+1)-y(i))/delx+ic/(nc*F);
end
for i=2*n:n:n^2
    f(i)=y(i)-y(i-1);
end
for i=n+1:n:n^2
    for j=(i+1):(i+n-2)
        f(j)=(D*delt/delx^2)*(y(i+1)-2*y(i)+y(i-1))-y(i)+y(i-n);
    end
end
end