exec('testSudokus.sce')

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

function [output]=solveSudoku(input)
  // nog niks
  output=input
endfunction
//exec('solveSudoku2.sce')
//exec('controleSudoku2.sce')
