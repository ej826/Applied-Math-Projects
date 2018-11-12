load('shake.mat');

norm_tdm = zeros(26126, 33);
for i = 1:33
    norm_tdm(:, i) = tdm(:, i)/norm(tdm(:, i));
end

q = zeros(26126, 1);
q(78) = 1;
q(13441) = 1;
q = q/norm(q);
cos = norm_tdm' * q;
alpha = 0.005;

disp("This is our query vector: ");
disp(dictionary(78));
disp(dictionary(13441));
disp("These are the returned plays: ");
for k = 1:33
    if cos(k) > alpha
        disp(plays(k));
    end
end

p = zeros(26126, 1);
p(22641) = 1;
p(15895) = 1;
p(6576) = 1;
p(26097) = 1;
p = p/norm(p);
cos2 = norm_tdm' * p;
alpha2 = 0.12;

disp("This is our query vector: ");
disp(dictionary(22641));
disp(dictionary(15895));
disp(dictionary(6576));
disp(dictionary(26097));
disp("These are the returned plays: ");
for k = 1:33
    if cos2(k) > alpha2
        disp(plays(k));
    end
end

AtA = tdm'*tdm;
[V, val] = eig(AtA);
sigma = zeros(33);
for i = 1:33
    sigma(i,i) = sqrt(val(i,i));
end

[V2, Sigma2] = sortem(V, sigma);
V2 = V2(:,1:10);
Sigma2 = Sigma2(1:10,1:10);
U = zeros(26126, 10);
for i = 1:10
   U(:,i) = (tdm * V2(:, i))/Sigma2(i,i);
end

new_tdm = U * Sigma2 * V2';

norm_tdm = zeros(26126, 33);
for i = 1:33
    norm_tdm(:, i) = new_tdm(:, i)/norm(new_tdm(:, i));
end

q = zeros(26126, 1);
q(78) = 1;
q(13441) = 1;
q = q/norm(q);
cos = norm_tdm' * q;
alpha = 0.005;

disp("This is our query vector: ");
disp(dictionary(78));
disp(dictionary(13441));
disp("These are the returned plays: ");
for k = 1:33
    if cos(k) > alpha
        disp(plays(k));
    end
end

p = zeros(26126, 1);
p(22641) = 1;
p(15895) = 1;
p(6576) = 1;
p(26097) = 1;
p = p/norm(p);
cos2 = norm_tdm' * p;
alpha2 = 0.12;

disp("This is our query vector: ");
disp(dictionary(22641));
disp(dictionary(15895));
disp(dictionary(6576));
disp(dictionary(26097));
disp("These are the returned plays: ");
for k = 1:33
    if cos2(k) > alpha2
        disp(plays(k));
    end
end


function [P2,D2]=sortem(P,D)
D2=diag(sort(diag(D),'descend'));
[c, ind]=sort(diag(D),'descend');
P2=P(:,ind);
end
