function monopoly()
H=zeros(40,40);
for i=1:40
    if i==31
        H(31,13)=1/36;
        H(31,14)=1/18;
        H(31,15)=1/12;
        H(31,16)=1/9;
        H(31,17)=5/36;
        H(31,18)=1/6;
        H(31,19)=5/36;
        H(31,20)=1/9;
        H(31,21)=1/12;
        H(31,22)=1/18;
        H(31,23)=1/36;
    end
    if i+2==31
        H(i,11)=1/36;
    else
        md = mod(i+2, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/36;
    end
    if i+3 == 31
        H(i,11)=1/18;
    else
        md = mod(i+3, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/18; 
    end
    if i+4==31
        H(i,11)=1/12;
    else
        md = mod(i+4, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/12;
    end
    if i+5==31
        H(i,11)=1/9;
    else
        md = mod(i+5, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/9;
    end
    if i+6==31
        H(i,11)=5/36;
    else
        md = mod(i+6, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=5/36;
    end
    if i+7==31
        H(i,11)=1/6;
    else
        md = mod(i+7, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/6;
    end
    if i+8==31
        H(i,11)=5/36;
    else
        md = mod(i+8, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=5/36;
    end
    if i+9==31
        H(i,11)=1/9;
    else
        md = mod(i+9, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/9;
    end
    if i+10==31
        H(i,11)=1/12;
    else
        md = mod(i+10, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/12;
    end
    if i+11==31
        H(i,11)=1/18;
    else
        md = mod(i+11, 40);
        if md == 0
            md = 40;
        end
        H(i,md)=1/18;
    end
    if i+12==31
        H(i,11)=1/36;
    else
        md = mod(i+12, 40);
        if md == 0
            md = 40;
        end
        H(i ,md)=1/36;
    end
end

e=ones(40,1);
u=e/40;
a=1-sum(H,2);
G=0.99*H+(0.99*a+(1-0.99)*e)*u';

eps = 10^-6;

v0 = ones(40,1);
v=v0/norm(v0);
u = G'*v;

l = (v'*u)/(v'*v);
u = u/norm(u);

while norm(u-v) > eps
    v = u;
    u = G'*v;
    l = (v'*u)/(v'*v);
    u = u/norm(u);
end

v=u;
[r,i]=sort(v,'descend');

disp("From most likely to land on to least likely");

for j=1:40
    i(j)
end