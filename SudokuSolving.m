

% This script produces a solved Sudoku puzzle with inputs of the clues of a
% Sudoku puzzle. By using linear programming optimization, we are able to
% find the solutions based on the L1 norm of a constraint matrix. The
% constraint matrix is devised by the clues and size of the Sudoku puzzle.


%sizeofPuzzle is a singal number
%clues is an array with all values of the puzzle.
% For example an input might be [0 0 0 0 2 0 0 0 0 0 0 0 4 0 0 0 0 0 0 0],
% sot that the position in the input vector corresponds to the position in
% the overall matrix.

% -  -  -  -  -  -  -  -  - -
%|1 | 2| 3| 4| 5| 6| 7| 8| 9|
%|10|11|12|13|14|15|16|17|18|
%|19|20|21|22|23|24|25|26|27|
%|28|29|30|31|32|33|34|35|36|
%|37|38|39|40|41|42|43|44|45|
%|46|47|48|49|50|51|52|53|54|
%|55|56|57|58|59|60|61|62|63|
%|64|65|66|67|68|69|70|71|72|
%|73|74|75|76|77|78|79|80|81|
% -  -  -  -  -  -  -  -  - -


%Example Easy Puzzle1:
%Clues = [8 0 0 9 3 0 0 0 2 0 0 9 0 0 0 0 4 0 7 0 2 1 0 0 9 6 0 2 0 0 0 0 0
%0 9 0 0 6 0 0 0 0 0 7 0 0 7 0 0 0 6 0 0 5 0 2 7 0 0 8 4 0 6 0 3 0 0 0 0 5 
%0 0 5 0 0 0 6 2 0 0 8]
%Solution = is in image on github under "Easy Puzzle 1"

function sol = SudokuSolver(sizeOfPuzzle, clues)
    %Get clues from input and make decoded matrix
    
    clues = arrangeClues(clues)
    decodedMatrix = decodedMatrix(sizeOfPuzzle, clues);
    %Call makeA to find the A contraint matrix
    A = makeA(sizeOfPuzzle, decodedMatrix, clues);
    %Translate the solution
    
    %output the solution
end


function clues = arrangeClues( Rawclues )
    cluesHolder = [];
    for i = 1:size(Rawclues, 2)
        if(Rawclues(i) > 0)
            cluesHolder = [cluesHolder Rawclues(i) i];
        end
    end
    clues = cluesHolder;
end

function decoded = decodedMatrix(sizeOfPuzzle, clues)
    % A three dimensional matrix that has (rows, cols, values)
    % In the puzzle, if the first value is a 9, then this matrix would have
    % a 1 at A(1,1,9);
    holdM = zeros(sizeOfPuzzle, sizeOfPuzzle, sizeOfPuzzle);
    for i = 1:2:size(clues,2)
        %parsings the values and positions from the input vector
        val = clues(i);
        pos = clues(i+1);
        rowNum = fix(pos/sizeOfPuzzle)+1;
        colNum = rem(pos,sizeOfPuzzle);
        if(colNum == 0)
            colNum = 10;
        end
        %for every set of clues, setting the matrix value to one
        holdM(rowNum, colNum, val) = 1;
    end
    decoded = holdM;
end

function A = makeA(sizeOfPuzzle, M, clues)
    Aclue = getAClue(sizeOfPuzzle, clues);
    Acell = getACell(sizeOfPuzzle, M);
    Abox = Abox(sizeOfPuzzle);
    Arow = Arow(sizeOfPuzzle);
    Acol = Acol(sizeOfPuzzle);
    A = [Arow ; Acol ; Abox; Acell ; Aclue] ;
end


function clueA = getAClue(N, clues)
    holdM = [];
    for i=1:2:size(clues,2)
        holdV = zeros(1,N^3);
        val = clues(i);
        pos = clues(i+1)
        holdV(N*pos - N + val) = 1;
        holdM = [holdM;holdV];
    end
    clueA = holdM;
end


function cellA = getACell(N, ~)
    cells = [];

    for i=1:N^2
        startpos = (i-1)*N + 1;
        cell = zeros(1,N^3);
        cell(1, startpos:startpos + N -1) = ones(1, N);
        cells = [cells ; cell]; 
    end
    
    cellA = cells;
end
