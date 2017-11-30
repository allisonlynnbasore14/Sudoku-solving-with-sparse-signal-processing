
row1 = [ zeros(N,(0*N^2)) I I I I zeros(N,(N^3 - N^2)) ];
row2 = [ zeros(N,(1*N^2)) I I I I zeros(N,(N^3 - 2 * N^2)) ];
row3 = [ zeros(N,(2*N^2)) I I I I zeros(N,(N^3 - 3 * N^2)) ];
row4 = [ zeros(N,(3*N^2)) I I I I zeros(N,(N^3 - 4 * N^2)) ];

rows = [row1;row2;row3;row4];

col1 = [zeros(N,0*N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N*1)];
col2 = [zeros(N,1*N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N*2)];
col3 = [zeros(N,2*N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N*3)];
col4 = [zeros(N,3*N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N) I zeros(N,(N^2)-N*4)];
colms = [col1; col2; col3;col4];

boxSize = 2;

j = [I I]
box1 = [zeros(N, 0* (2*N)) j zeros(N, N^2 - size(j,2)) j zeros(N, N^3 - (2*2*N) - ( N^2 - size(j,2)))];
box2 = [zeros(N, 1* (2*N)) j zeros(N, N^2 - size(j,2)) j zeros(N, N^3 - (3*2*N) - ( N^2 - size(j,2)))];
box3 = [zeros(N, 2* (2*N)) j zeros(N, N^2 - size(j,2)) j zeros(N, N^3 - (4*2*N) - ( N^2 - size(j,2)))];
box4 = [zeros(N, 3* (2*N)) j zeros(N, N^2 - size(j,2)) j zeros(N, N^3 - (5*2*N) - ( N^2 - size(j,2)))];

boxes = [box1;box2;box3;box4];


cells = []

for i=1:N^2
    startpos = (i-1)*N + 1;
    cell = zeros(1,N^3);
    cell(1, startpos:startpos + N -1) = ones(1, N);
    cells = [cells ; cell]; 
end

clue1 = [ 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
clue2 = [ 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
clue3 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
clue4 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
clue5 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
clue6 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
clue7 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
clue8 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0];
clue9 = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0];
clues = [clue1 ; clue2; clue3; clue4; clue5; clue6; clue7; clue8; clue9]

A = [rows; colms; boxes; cells ; clues]
b = [zeros(size(A,1),1)]
