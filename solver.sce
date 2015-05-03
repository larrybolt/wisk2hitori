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
  // this checks what values are possible in this row
  // possibilities=setdiff([1:9],sudoku(i,:))
  // the next one checks both the row and collum, and takes the intersect
  possibilities=intersect(setdiff([1:9], getPart(sudoku,i,j)),intersect(setdiff([1:9],sudoku(:,j)),setdiff([1:9],sudoku(i,:))))
endfunction

// function to get the 3*3 part for a possision
function [res]=getPart(sudoku,i,j)
  i = ceil(i/3)-1
  j = ceil(j/3)-1
  res = sudoku(1+(3*i):3+(3*i),1+(3*j):3+(3*j))
endfunction

// this will be the solving function
function [output]=solveSudoku(input)
  filledIn = 1
  while filledIn > 0
    filledIn = 0
    for i = [1:9]
      for j = [1:9]
        if input(i,j) == 0
          pos = getPossible(input,i,j)
          if size(pos) == 1
            input(i,j) = getPossible(input,i,j)
            filledIn = filledIn + 1
          end
        end
      end
    end
  end
  output=input
endfunction

// test cases, later pas includen enzo
//exec('solveSudoku2.sce')
//exec('controleSudoku2.sce')
