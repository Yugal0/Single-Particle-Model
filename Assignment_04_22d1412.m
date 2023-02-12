%Roll. No. 22d1412

clc
clear

global n delx;
n=4;
delx=0.001;
w=eye(n^2); 
itr_max=1000; err=1; eps=1e-8;itr=1;
y0=ones(n^2,1);  
y0(1:n,1)=10;
while itr<=itr_max && err>=eps
if (itr==1) 
    y=y0;  
end  

f=transpose(DiffFun(y));
j=JacDiscFun(y);
dely=-inv(j)*f;
ynew=y+dely;

norm_deno=(transpose(ynew)*w*ynew)^0.5;
norm_nume=(transpose(ynew-y)*w*(ynew-y))^0.5;
err=norm_nume/norm_deno;

y=ynew;
itr=itr+1;
end

subplot(122)
plot(n^2,ynew);
title("Converged Values")
xlabel("x")
ylabel("y")
subplot(121)
plot(n^2,y0);
title("Initial Guess")
xlabel("x")
ylabel("y")