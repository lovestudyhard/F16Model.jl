using F16Model

d2r = pi/180;
npos = 0;
epos = 0;
alt = 10000;
phi = 0;
theta = 0;
psi = 0;
Vt = 300;
alp = 15*d2r;
bet = 0;
p = 0;
q = 0;
r = 0;

x0 = [npos,epos,alt,phi,theta,psi,Vt,alp,bet,p,q,r];
u0 = [9000,0,0,0,0];

# Evaluate xdot -- inplace implementation -- use this with DifferentialEquations package.
xdot1 = zeros(12);
F16Model.Dynamics!(xdot1,x0,u0);

# Evaluate xdot -- returns vector
xdot2 = F16Model.Dynamics(x0,u0); # Use this for linearization of dynamics, etc.

# Trim the aircraft for SteadyLevel at h0,V0
h0 = 10000; # ft
Vt0 = 500;   # ft/s
xbar, ubar, status, objVal = F16Model.Trim(h0,Vt0,:SteadyLevel);

# Linerize about some trim point (x0,u0)
A, B = F16Model.Linearize(xbar,ubar);


