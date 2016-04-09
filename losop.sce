mode(-1);
warning('off');
exec('helperfunc.sce',-1);

zwart=0
wit=1
leeg=-1
// input(row,colomn)

function [output]=losOp(input)
  // define size (4 rows, 4 cols => z=4)
  // naming this variable size is a bad idea
  z=sqrt(length(input))
  output=zeros(z)
  for i = [1:z]
    for j = [1:z]
      output(i,j)=leeg
    end
  end

  // http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques
  // technique 1 // search for adjecent triplets
  // rows
  for row = [1:z]
    for col = [2:z-1]
      if input(row,col-1) == input(row,col) & input(row,col) == input(row,col+1)
        output(row,col)=wit
        output(row,col-1)=zwart
        output(row,col+1)=zwart
      end
    end
  end
  // columns
  for col = [1:z]
    for row = [2:z-1]
      if input(row-1,col) == input(row,col) & input(row,col) == input(row+1,col)
        output(row,col)=wit
        output(row-1,col)=zwart
        output(row+1,col)=zwart
      end
    end
  end
  // technique 2 // square between a pair
  // rows
  for row = [1:z]
    for col = [2:z-1]
      if input(row,col-1) <> input(row,col) & input(row,col-1) == input(row,col+1)
        output(row,col)=wit
      end
    end
  end
  // columns
  for col = [1:z]
    for row = [2:z-1]
      if input(row-1,col) <> input(row,col) & input(row-1,col) == input(row+1,col)
        output(row,col)=wit
      end
    end
  end
  // technique 3 // pair induction
  // rows
  for row = [1:z]
    // current row we're scanning
    currentRow = input(row,:)
    [certainlyBlack]=pairInducation(currentRow)
    for i=certainlyBlack
      output(row,i)=zwart
    end
  end
  // columns
  for col = [1:z]
    // current column we're scanning
    currentCol = input(:,col)
    [certainlyBlack]=pairInducation(currentCol)
    for i=certainlyBlack
      output(i,col)=zwart
    end
  end
endfunction
function [certainlyBlack]=pairInducation(listInput)
  // take the unique numbers
  certainlyBlack = list()
  numbersNeedChecking = unique(listInput)
  for num = numbersNeedChecking
    locationsOfNumber = find(listInput == num)
    // if we don't have the same number 3 or more times in a row, try the next number

    if length(locationsOfNumber)<3 then continue end
    // listInput =                 4 3 2 1 8 7 8 8 5  8  6
    // we are checking for 8's:    * * * * 8 * 8 8 *  8  * because num = 8
    // the indexes for these 8's:  1 2 3 4 5 6 7 8 9 10 11
    //                                     ^   ^ ^    ^
    // so locationsOfNumber = 5 7 8 10
    // now we need to find the numbers that are alone, eg: [5] 7 8 [10]
    // and the ones that connect with others           eg:  5 [7 8] 10
    alone=list()    // will be: 5 10
    notAlone=list() // will be: 7 8
    for i = [1:length(locationsOfNumber)]
      n1=locationsOfNumber(i)   // first iteration this is 5
      if i == length(locationsOfNumber)
        if isInList(n1,notAlone) <> %t
          alone($+1)=n1
        end
        continue
      end
      n2=locationsOfNumber(i+1) // first iteration this is 7, last iteration
                                // this doesn't exist, invalid index
      if n1 <> n2-1 & isInList(n1,notAlone) <> %t
        alone($+1)=n1
      elseif n1 == n2-1
        notAlone($+1)=n1
        notAlone($+1)=n2
      end
    end
    if length(notAlone)>1 == %t
      for i = alone
        certainlyBlack($+1)=i
      end
    end
  end
endfunction
