function Stanford()
load 'usestan.mat'
H = stanford;

e=ones(281903,1);
u=e/281903;
a=1-sum(H,2);

eps = 10^-6;

x0 = ones(281903,1);
x = x0/norm(x0);

for i=1:10
    xk=0.8*x'*H+(0.8*x'*a+(1-0.8)*x'*e).*u';
    x=xk';
end

[r,i] = sort(x, 'descend');

for j=1:10
    fprintf("For page %d. The rank is %f\n", i(j), r(j))
end
end
    