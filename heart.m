function heart()
P = [0 1 1 4 5 3 4 0; 4 0 3 -2.5 0.5 -3 0 -5; 0 -5 -0.5 -3 -3 -2.5 -4 0; -4 0 -5 3 -1 4 0 1];
clf;  %Clear figures

for m=1:4
%Plot control points
    for k=1:4
     plot(P(m,2*k-1),P(m,2*k),'r.','MarkerSize',20);
     hold on;
    end

    t = 0:.01:1;

    % The cubic Bernstein basis functions
    B=@(k,n,t) nchoosek(n,k)*(1-t).^(n-k).*t.^k;

    B0 = B(0,3,t);
    B1 = B(1,3,t);
    B2 = B(2,3,t);
    B3 = B(3,3,t);

    % Summing them together.
    x= P(m,1) * B0  +  P(m,3) * B1  +  P(m,5) * B2  +  P(m,7) * B3;
    y= P(m,2) * B0  +  P(m,4) * B1  +  P(m,6) * B2  +  P(m,8) * B3;

    plot(x,y);   % Plot Bezier curve (x(t), y(t))
    hold on;
end
