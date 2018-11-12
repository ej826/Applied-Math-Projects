X = imread('colors.jpg');
X = im2double(X);

R = X(:, :, 1);
G = X(:, :, 2);
B = X(:, :, 3);

Y = 0.299*R + 0.587*G + 0.114*B; %gray scale of it
U = B-Y;
V = R-Y;

XG = rgb2gray(X);

Q = [16 11 10 16 24 40 51 61; 12 12 14 19 26 58 60 55; 14 13 16 24 40 57 69 56; 14 17 22 29 51 87 80 62; 18 22 37 56 68 109 103 77; 24 35 55 64 81 104 113 92; 49 64 78 87 103 121 120 101; 72 92 95 98 112 100 103 99];

Y1 = Y*255-128;

C = dctmtx(8);
dct = @(block) C' * block.data * C;
inv = @(block) C * block.data * C';
quant = @(b) round(b.data ./ Q) .* Q;
Y2 = blockproc(Y1, [8 8], dct);
Y3 = blockproc(Y2, [8 8], quant);
Y4 = blockproc(Y3, [8 8], inv);

Y4 = (Y4+128)/255;

U1 = U*255 -128;
Q1 = 3*Q;
quant1 = @(b) round(b.data./Q1).*Q1;
U2 = blockproc(U1, [8 8], dct);
U3 = blockproc(U2, [8 8], quant1);
U4 = blockproc(U3, [8 8], inv);
U4 = (U4 + 128)/255;

V1 = V*255 -128;
V2 = blockproc(V1, [8 8], dct);
V3 = blockproc(V2, [8 8], quant1);
V4 = blockproc(V3, [8 8], inv);
V4 = (V4 + 128)/255;

B2 = U4 + Y4;
R2 = V4 + Y4;
G2 = (Y4 - 0.299*R2 - 0.114*B2)/0.587;

X2 = X;

X2(:, :, 1) = R2;
X2(:, :, 2) = G2;
X2(:, :, 3) = B2;

imshow([X X2 X-X2]);