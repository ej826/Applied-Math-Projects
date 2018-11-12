[U, S, V] = svd(M);

V0 = V(:, 1:6);
A = U(:, 1:6)* S(1:6, 1:6) * V0';

[v1, lam1] = pwr(M);
[v2, lam2] = pwr(A);
disp("These are the lambdas of each matrix: ");
disp(lam1);
disp(lam2);

disp("These are the original matrix and the approximation matrix eigenvectors respectively: ");
disp(v1);
disp(v2);

[r, i] = sort(v1, 'descend');
disp(i);
[a, b] = sort(v2, 'descend');
disp(b);

function [v, l] = pwr(A)
eps = 10^-6;
v0 = ones(40,1);
v = v0/norm(v0);

u = A'*v;
l = (v'*u)/(v'*v);
u = u/norm(u);

while norm(u-v) > eps
    v = u;
    u = A'*v;
    l = (v'*u)/(v'*v); 
    %we left lambda so we could check that it converged to 1
    %  surprise! it did \(^.^)/  
    u = u/norm(u);
end
v = u;

end