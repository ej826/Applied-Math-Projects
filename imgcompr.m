%Part a
X = imread('lion.jpg');
X = rgb2gray(X);    %makes gray (0-255)
X = im2double(X);   %makes numbers double (0-1)
C = dctmtx(8);
dct = @(block) C' * block.data * C;
inv = @(block) C * block.data * C';
Y = blockproc(X,[8 8], dct);
s = 6;          %lower the number the lower the quality
Q = zeros(8);
for j = 1:8
    for k = 1:8
        if (j+k)<(s)
            Q(j,k) = 1;
        end
    end
end
f = @(block) block.data .*Q;
Y1 = blockproc(Y, [8 8], f);
X1 = blockproc(Y1, [8 8], inv);

%Rank Approximation
%Part b
k = 30;
[U,S,V] = svd(X);
X2 = U(:, 1:k) * S(1:k, 1:k) * (V(:, 1:k))';

%Part c
imshow([X X1 X2]);

