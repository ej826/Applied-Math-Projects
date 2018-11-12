function [A0, A1] = QR_Algo(A)
A0 = A;
for n = 1:1000
    [Q0, R0] = qr(A0);
    A0 = R0 * Q0;
end
[Q0,R0] = qr(A0);
A1 = R0 * Q0;
end