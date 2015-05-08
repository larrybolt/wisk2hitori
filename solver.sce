mode(0);
warning('off')

// function to check if the sodoku is solved
function [valid]=controleSudoku(input)
  valid=%t
  if sum(input(:,:)) <> 405 
    //messagebox("total sum is "+string(sum(input(:,:))))
    valid=%f 
    return
  end
  for i = [1:9]
    // scilab rows
    t = input(i,:)
    if sum(t) <> 45
      //messagebox("sum for "+string(sum(input(:,:)))
      valid=%f
      return
    end
    if size(unique(t)) <> 9
      valid=%f
      return
    end
    // scilab collumns
    t = input(:,i)
    if sum(t) <> 45
      valid=%f
      return
    end
    if size(unique(t)) <> 9
      valid=%f
      return
    end
  end
  for i = [0:2]
    for j = [0:2]
      t = input(1+(3*i):3+(3*i),1+(3*j):3+(3*j))
      if sum(t) <> 45
        valid=%f
        return
      end
      if size(unique(t)) <> 9
        valid=%f
        return
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
    //messagebox("this row is not zero!!")
    possibilities = []
    return
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
  stage1 = solveStage1(input)
  if controleSudoku(stage1)
    output = stage1
    return
  end

  stage2 = solveStage2(stage1,%f)
  if controleSudoku(stage2)
    output = stage2
    return
  end

  values = list()
  for i = [1:9]
    for j = [1:9]
      if input(i,j) == 0
        pos = getPossible(input,i,j)
        //disp([i,j,size(pos)])
        values($+1) = cat(2,[i,j],pos)
      end
    end
  end

  output=values
  output=%f
endfunction

function [output]=solveStage1(input)
  filledIn = 1
  while filledIn > 0
    filledIn = 0
    for i = [1:9]
      for j = [1:9]
        if input(i,j) == 0
          pos = getPossible(input,i,j)
          if size(pos) == 1
            input(i,j) = pos
            filledIn = filledIn + 1
          end
        end
      end
    end
  end
  output=input
endfunction

function [output]=solveStage3(input)
  filledIn = 1
  while filledIn > 0
    filledIn = 0
    i = 1
    for j = [1:9]
      if input(i,j) == 0
        pos = getPossible(input,i,j)
        if size(pos) == 1
          input(i,j) = pos
          filledIn = filledIn + 1
        elseif size(pos) > 1
          for n = [1:9]
            if input(i,n) == 0 & n <> j
              posOther = getPossible(input,i,j)
              disp(pos)
              disp(posOther)
              pos = setdiff(pos,posOther)
            end
          end
          if size(pos) == 1
            input(i,j) = pos
          end
        end
      end
    end
  end
  output=input
endfunction

function [output]=solveStage2(input,bak)
  for i = [1:9]
    for j = [1:9]
      if input(i,j) == 0
        pos = getPossible(input,i,j)
        if size(pos) == 0
          // something was off
          output = %f
          //disp("stuck!")
          //disp([i,j])
          return
        elseif size(pos) == 1
          input(i,j) = pos
          //disp("filled in "+string(pos)+" at "+string(i)+string(j))
        else
          //disp("possibilities for "+string(i)+","+string(j)); disp(pos);
          for k = pos
            input(i,j) = k
            //disp("trying "+string(k));
            testinput = solveStage2(input,%t)
            if testinput <> %f
              output = testinput
              return
              //disp("found it was "+string(k))
              break
            end
          end
          output=%f
          return
        end
      end
    end
  end
  output=input
endfunction

