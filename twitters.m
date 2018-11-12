function [H, Users] = twitters()
load msutweets.mat
H=zeros(1137,1137);
T1 =tweets(:,1);
T2 =tweets(:,2);
Users = unique([T1; T2]);
for i=1:1137
    s = Users(i);
    p1 = find(strcmp(s,T1));
    p2=strings(1,length(p1));
    v=zeros(1,length(p1));
    for n=1:length(p1)
       p2(n) = T2{p1(n)};
       v(n) = find(strcmp(p2(n), Users));
       H(i, v(n)) = 1 / length(p1);
    end
end
%Need to make H stochastic -- turn it into a Google Matrix
%(googleTwitter.m)



end

