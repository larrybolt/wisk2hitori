mode(0);
exec('testSudokus.sce');

// function to check if the sodoku is solved
function [valid]=isValid(input)
  valid=%t
  if sum(input(:,:)) <> 405 
    //messagebox("total sum is "+string(sum(input(:,:))))
    valid=%f 
  end
  for i = [1:9]
    // scilab rows
    t = input(i,:)
    if sum(t) <> 45
      //messagebox("sum for "+string(sum(input(:,:)))
      valid=%f
    end
    if size(unique(t)) <> 9
      valid=%f
    end
    // scilab collumns
    t = input(:,i)
    if sum(t) <> 45
      valid=%f
    end
    if size(unique(t)) <> 9
      valid=%f
    end
  end
  for i = [0:2]
    for j = [0:2]
      t = input(1+(3*i):3+(3*i),1+(3*j):3+(3*j))
      if sum(t) <> 45
        valid=%f
      end
      if size(unique(t)) <> 9
        valid=%f
      end
    end
  end
endfunction

// function to get possible values for a cell,
// arguments: sudoku matrix, row, collumn
function [possibilities]=getPossible(sudoku,i,j)
  if sudoku(i,j) <> 0
    // only zero rows should be filled in 
    // TODO: remove for performance afterwards
    messagebox("this row is not zero!!")
  end
  possibilities=setdiff([1:9],sudoku(i,:))
endfunction
// this will be the solving function
function [output]=solveSudoku(input)
  // nog niks
  for i = [1:9]
    for j = [1:9]
      if input(i,j) == 0
        input(i,j) = getPossible(input,i,j)
      end
    end
  end
  output=input
endfunction

// test cases, later pas includen enzo
//exec('solveSudoku2.sce')
//exec('controleSudoku2.sce')
