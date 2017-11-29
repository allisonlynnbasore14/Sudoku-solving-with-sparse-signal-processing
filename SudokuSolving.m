

% This script produces a solved Sudoku puzzle with inputs of the clues of a
% Sudoku puzzle. By using linear programming optimization, we are able to
% find the solutions based on the L1 norm of a constraint matrix. The
% constraint matrix is devised by the clues and size of the Sudoku puzzle.


%sizeofPuzzle is a singal number
%clues is an array with alternating values of clues and locations
%For example if there were two clues: a 7 in the first box and a 3 in the
%last box, the clues array would be [7, 1, 3, 81] (assuming a 9 by 9
%puzzle).

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


function sol = SudokuSolver(sizeOfPuzzle, clues)
    %Get clues from input and make decoded matrix
    decodedMatrix = decodedMatrix(sizeOfPuzzle, clues)
    %Call makeA to find the A contraint matrix
    
    %Translate the solution
    
    %output the solution
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
        %for every set of clues, setting the matrix value to one
        holdM(rowNum, colNum, val) = 1;
    end
    decoded = holdM;
end


