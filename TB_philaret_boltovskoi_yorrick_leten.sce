mode(-1);
warning('off');
// execute scripts silently, and supress warnings

// function to check if the sodoku is solved
// most of the time the first check will already abort the execution
// and return false if not all cells are filled in
// there is not accounted for negative values filled in
// but such check is easy to implement:
//   if (input<0 | input>9) then valid=%f;return; end
function [valid]=controleSudoku(input)
  valid=%t
  if sum(input(:,:)) <> 405 
    //disp("total sum is "+string(sum(input(:,:))))
    valid=%f 
    return
  end
  for i = [1:9]
    // rows
    t = input(i,:)
    if sum(t) <> 45
      //disp("sum for "+string(sum(input(:,:)))
      valid=%f
      return
    end
    if length(unique(t)) <> 9
      valid=%f
      return
    end
    // collumns
    t = input(:,i)
    if sum(t) <> 45
      valid=%f
      return
    end
    if length(unique(t)) <> 9
      valid=%f
      return
    end
  end
  for i = [0:2]
    for j = [0:2]
      // grids
      t = input(1+(3*i):3+(3*i),1+(3*j):3+(3*j))
      if sum(t) <> 45
        valid=%f
        return
      end
      if length(unique(t)) <> 9
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
    //disp("this row is not zero!!")
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
  state=input

  // Solving with hypermat
  prev=[]
  changed=%t
  while changed
    prev = state
    state=solveHyper(state);
    if state == prev
      changed=%f
    end
  end
  //output=state
  //return
  
  //solveHyper does this too
  //state = solveEasy(state)
  //if controleSudoku(state)
  //  output = state
  //  //disp("easy")
  //  return
  //end

  state = solveRows(state)
  if controleSudoku(state)
    output = state
    //disp("only rows")
    return
  end

  state = solveColls(state)
  if controleSudoku(state)
    output = state
    //disp("rows and colls")
    return
  end

  state = solveRecursive(state,%f)
  if controleSudoku(state)
    output = state
    //disp("recursive")
    return
  end
  // even recursion can't solve it :( must be something wrong
  disp("cant")
  output=state
  return

  // makes a list of unsolved cells with possible values
  // the idea was to sort this list by least possibilities and try 
  // filling those out first
  // the chances of filling in the correct one get higher, thus less time
  values = list()
  for i = [1:9]
    for j = [1:9]
      if input(i,j) == 0
        pos = getPossible(input,i,j)
        //disp([i,j,length(pos)])
        values($+1) = cat(2,[i,j],pos)
      end
    end
  end
  output=values
endfunction

function [output]=solveHyper(input)
  // solutions matrix
  sol = hypermat([9,9,9])

  // find possibilities
  for i = [1:9]
    for j = [1:9]
      if input(i,j) == 0
        pos = getPossible(input,i,j)
        for k = [1:9]
          if length(find(pos==k,1)) == 1
            sol(i,j,k)=1
          end
        end
      end
    end
  end

  // math
  for i = [1:9]
    for j = [1:9]
      if input(i,j) == 0 & length(find(sol(i,j,:)==1)) > 1

        //for n = [1:9]
        //  if input(i,j) == 0 & n <> j
        //    for m = [1:9]
        //      if (sol(i,j,m) == 1 & sol(i,n,m) == 1) then sol(i,j,m) = 0; end
        //    end
        //  end
        //end

      end
    end
  end

  // ignore any <0 cells
  for i = [1:9]
    for j = [1:9]
      for k = [1:9]
        if sol(i,j,k) < 0
          sol(i,j,k) = 0
        end
      end
    end
  end

  // reconstruct matrix with values filled in
  for i = [1:9]
    for j = [1:9]
      cell = find(sol(i,j,:)==1)
      if length(cell) == 1
        input(i,j)=cell
      end
    end
  end
  output=input
endfunction


// Basic algo that should be able to solve the most simple ones
// For each empty cell find possible values, if there's only
// 1 possible fill it in, keep trying until no more can be filled in
function [output]=solveEasy(input)
  filledIn = 1
  // keep searching fillable fields while new
  // cells have been filled in
  while filledIn > 0
    filledIn = 0
    for i = [1:9]
      for j = [1:9]
        if input(i,j) == 0
          pos = getPossible(input,i,j)
          if length(pos) == 1
            input(i,j) = pos
            filledIn = filledIn + 1
          end
        end
      end
    end
  end
  output=input
endfunction

// this would be a try at a more optimal solution,
// explained here: https://asciinema.org/a/19666
// for every cell with >1 possible values,
// compare with others cells in the same row/column/subgrid
function [output]=solveRows(input)
  filledIn = 1
  while filledIn > 0
    filledIn = 0
    for i = [1:9]
      for j = [1:9]
        if input(i,j) == 0
          pos = getPossible(input,i,j)
          //disp("cell "+string(i)+","+string(j)); disp(pos);
          if length(pos) == 1
            input(i,j) = pos
            filledIn = filledIn + 1
          elseif length(pos) > 1
            // try comparing with other row's empty cells
            for n = [1:9]
              if input(i,n) == 0 & n <> j
                posOther = getPossible(input,i,n)
                pos = setdiff(pos,posOther)
              end
            end
            if length(pos) == 1
              input(i,j) = pos
              filledIn = filledIn + 1
              //disp("yup row "+string(i)+","+string(j));
            end
          end
        end
      end
    end
  end
  output=input
endfunction

function [output]=solveColls(input)
  filledIn = 1
  while filledIn > 0
    filledIn = 0
    for i = [1:9]
      for j = [1:9]
        if input(i,j) == 0
          pos = getPossible(input,i,j)
          //disp("cell "+string(i)+","+string(j)); disp(pos);
          if length(pos) == 1
            input(i,j) = pos
            filledIn = filledIn + 1
          elseif length(pos) > 1
            // try comparing with other row's empty cells
            for n = [1:9]
              if input(n,j) == 0 & n <> i
                posOther = getPossible(input,n,j)
                pos = setdiff(pos,posOther)
              end
            end
            if length(pos) == 1
              input(i,j) = pos
              filledIn = filledIn + 1
              //disp("yup coll "+string(i)+","+string(j));
            end
          end
        end
      end
    end
  end
  output=input
endfunction

// This should be able to solve any sudoku
// for every empty cell find possibilities
// try the first possibility, and call self on sudoku with filled in cell (A)
// -> ==0 if we come across a cell with no possibilities return false, the initial try was bad
// -> ==1 if we can only fill in 1, fill it in
// ->  >1 if more than one call self on sudoku with filled in cell (A)
// if the possibility was correct, we'll get the solved sudoku back
// the second parameter was to check whether this was a recursive call for debugging
function [output]=solveRecursive(input,bak)
  for i = [1:9]
    for j = [1:9]
      if input(i,j) == 0
        pos = getPossible(input,i,j)
        if length(pos) == 0
          // something was off
          output = %f
          //disp("stuck!")
          //disp([i,j])
          return
        elseif length(pos) == 1
          input(i,j) = pos
          //disp("filled in "+string(pos)+" at "+string(i)+","+string(j))
        else
          //disp("possibilities for "+string(i)+","+string(j)); disp(pos);
          for k = pos
            input(i,j) = k
            //disp("trying "+string(k));
            testinput = solveRecursive(input,%t)
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

