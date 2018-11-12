

function [v, l] = pwr()
H = [0 1/2 1/2 0 0; 0 0 0 1 0; 1/3 1/3 0 1/3 0;1/3 0 1/3 0 1/3; 
   1 0 0 0 0];
eps = 10^-6;
v0 = [1;1;1;1;1];
v = v0/norm(v0);

u = H'*v;
l = (v'*u)/(v'*v);
u = u/norm(u);

while norm(u-v) > eps
    v = u;
    u = H'*v;
    l = (v'*u)/(v'*v); 
    %we left lambda so we could check that it converged to 1
    %  surprise! it did \(^.^)/  
    u = u/norm(u);
end
v = u;

end

