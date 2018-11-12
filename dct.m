c = dctmtx(8);
x = [4; 3.1; 2.8; 2.5; 2.3; 2.2; 2.1; 2];
sum = 0;

f = @(k, t) 1/2 * cos((k-1)*(2*t + 1)*pi/16);
    
y = c*x;

array = linspace(0,7,70);
x1 = linspace(0,7,70);
for i = 1:length(array)
    array(i) = p(x1(i), y, f);
end
plot(x1, array);
hold on;
scatter([0 1 2 3 4 5 6 7], x, 'b.');
hold off;

% p(0,y,f)
% (1/sqrt(8))*y(1)

function poly = p(t, y, f)
sum = 0;
for i = 2:8
    sum = sum + y(i)*f(i, t);
end
poly = (1/sqrt(8))*y(1) + sum;
end

