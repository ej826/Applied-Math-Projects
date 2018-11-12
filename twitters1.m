function [v,l] = pwr(A, v0, eps)
 = twitters();
v0 = [1;0;0;0;0];
eps = 10^-6;
v = v0/norm(v0);
u = A*v;
l = (v'*u)/(v'*v);
u = u/norm(u);
while norm(u-v) > eps
    v = u;
    u = A*v;
    l = (v'*u)/(v'*v);
    u = u/norm(u);
end
end