function google()
[H, Users] = twitters();
e=ones(1137,1);
u=e/1137;
a=1-sum(H,2);
G=0.8*H+(0.8*a+(1-0.8)*e).*u';

eps = 10^-6;

v0 = ones(1137, 1);
v = v0/norm(v0);
u = G'*v;

l = (v'*u)/(v'*v);
u = u/norm(u);

while norm(u-v) > eps
    v = u;
    u = G'*v;
    l = (v'*u)/(v'*v);
    u = u/norm(u);
end

v = u;
[r, i] = sort(v, 'descend');

for j = 1: 10
    fprintf("For page ")
    Users(i(j))
    fprintf("The rank is %f\n", r(j))
end