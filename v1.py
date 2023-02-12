import numpy as np
from scipy.integrate import solve_ivp 
def Single_particle_model(t,c,nn):
    n = nn-1
    D = 1e-8
    R=1
    delr=R/n
    jc=10 #amps
    r=np.array([np.arange(0,1+delr,delr).T]).T 
    dcdt = np.zeros((n+1,1))
    for i in range(0,n+1):
        if i==0:
            dcdt[i]=0
        elif i==n:
            dcdt[i]=jc
        else:
            dcdt[i] = (D/(r[i]**2))*((2*r[i])*((c[i+1]-c[i-1])/2*delr) + (r[i]**2)*(c[i+1]+c[i-1]-2*c[i])/delr**2)
    return dcdt
nn=5
c0= np.zeros(nn)
ysol= solve_ivp(fun=lambda t,c: Single_particle_model(t,c,nn), t_span=[0,10], y0= c0)