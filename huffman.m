symbols = [1 2 3 4 5 6]; %have to be integers; can't be letters
%A = 1, E = 2, H = 3, L = 4, S = 5, _ = 6
p = [1/19 4/19 2/19 4/19 6/19 2/19];
dict = huffmandict(symbols, p);
message= [5 3 2 6 5 2 4 4 5 6 5 2 1 5 3 2 4 4 5];
%message = 'SHE SELLS SEASHELLS'
code = huffmanenco(message, dict);
msg = huffmandeco(code, dict); %to decode

disp(code);