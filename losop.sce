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
  if %t
    z=sqrt(length(input))
    output=zeros(z)
    for i = [1:z]
      for j = [1:z]
        output(i,j)=leeg
      end
    end
  end

  // techniques only requiring a list of numbers
  // http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques
  // technique 1 // search for adjecent triplets
  if %t
    // rows
    for row = [1:z]
      currentRow = input(row,:)
      [certainlyBlack,certainlyWhite]=adjecentTriplets(currentRow)
      for i=certainlyBlack
        output(row,i)=zwart
      end
      for i=certainlyWhite
        output(row,i)=wit
      end
    end
    // columns
    for col = [1:z]
      currentCol = input(:,col)
      [certainlyBlack,certainlyWhite]=adjecentTriplets(currentCol)
      for i=certainlyBlack
        output(i,col)=zwart
      end
      for i=certainlyWhite
        output(i,col)=wit
      end
    end
  end
  // technique 2 // square between a pair
  if %t
    // rows
    for row = [1:z]
      currentRow = input(row,:)
      [certainlyWhite]=squareBetweenPair(currentRow)
      for i=certainlyWhite
        output(row,i)=wit
      end
    end
    // columns
    for col = [1:z]
      currentCol = input(:,col)
      [certainlyWhite]=squareBetweenPair(currentCol)
      for i=certainlyWhite
        output(i,col)=wit
      end
    end
  end
  // technique 3 // pair induction
  if %t
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
  end

  // techniques requiring the whole grid
  // second rule of hitori, unshading around shaded square
  if %t
    certainlyWhite = unshadingAroundShaded(output)
    for i = certainlyWhite
      output(i(1), i(2))=wit
    end
  end

  // concer technique 1
  if %t
    [certainlyBlack,certainlyWhite] = cornersHaveSameNumber(input)
    for i = certainlyBlack
      output(i(1), i(2))=zwart
    end
    for i = certainlyWhite
      output(i(1), i(2))=wit
    end
  end
  // concer technique 2
  if %t
    [certainlyBlack,certainlyWhite] = cornerTechnique2(input)
    for i = certainlyBlack
      output(i(1), i(2))=zwart
    end
    for i = certainlyWhite
      output(i(1), i(2))=wit
    end
  end

  // whiteColoredMeansOtherBlack
  if %t
    // rows
    for row = [1:z]
      currentRow = input(row,:)
      currentColors = output(row,:)
      [certainlyBlack]=whiteColoredMeansOtherBlack(currentRow,currentColors)
      for i=certainlyBlack
        output(row,i)=zwart
      end
    end
    // columns
    for col = [1:z]
      currentCol = input(:,col)
      currentColors = output(:,col)
      [certainlyBlack]=whiteColoredMeansOtherBlack(currentCol,currentColors)
      for i=certainlyBlack
        output(i,col)=zwart
      end
    end
  end
endfunction

// techniques only requiring a list of numbers
// http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques
// technique 1 // search for adjecent triplets
// x 5 5 5 x x
//   z w z
function [certainlyBlack,certainlyWhite]=adjecentTriplets(input)
  certainlyBlack = list()
  certainlyWhite = list()
  for i = [2:length(input)-1]
    if input(i-1) == input(i) & input(i) == input(i+1)
      certainlyBlack($+1) = i-1
      certainlyWhite($+1) = i
      certainlyBlack($+1) = i+1
    end
  end
endfunction
// technique 2 // square between a pair
// x x 2 4 2 x
//       w
function [certainlyWhite]=squareBetweenPair(input)
  certainlyWhite = list()
  for i = [2:length(input)-1]
    if input(i-1) <> input(i) & input(i-1) == input(i+1)
      certainlyWhite($+1) = i
    end
  end
endfunction
// technique 3 // pair induction
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

// techniques requiring the whole grid
// second rule of hitori, unshading around shaded square
// . . . .    . . . .
// . . . .    . . w .
// . . z . -> . w z w
// . . . .    . . w .
function [certainlyWhite]=unshadingAroundShaded(input)
  certainlyWhite = list()
  z = sqrt(length(input))
  for row = [1:z]
    for col = [1:z]
      if input(row,col) == zwart
        if row > 1 then certainlyWhite($+1) = [row-1,col]; end
        if row < z then certainlyWhite($+1) = [row+1,col]; end
        if col > 1 then certainlyWhite($+1) = [row,col-1]; end
        if col < z then certainlyWhite($+1) = [row,col+1]; end
      end
    end
  end
endfunction

// concer technique 1
// 3 3 .     z w .  analogue for other corners
// 3 . . --> w . .
// . . .     . . .
function [certainlyBlack,certainlyWhite]=cornersHaveSameNumber(input)
  certainlyWhite = list()
  certainlyBlack = list()
  z = sqrt(length(input))
  if input(1,1) == input(1,2) & input(1,1) == input(2,1) // left upper
    certainlyBlack($+1) = [1,1]
    certainlyWhite($+1) = [1,2]
    certainlyWhite($+1) = [2,1]
  end
  if input(z,z) == input(z,z-1) & input(z,z) == input(z-1,z) // right lower
    certainlyBlack($+1) = [z,z]
    certainlyWhite($+1) = [z,z-1]
    certainlyWhite($+1) = [z-1,z]
  end
  if input(1,z) == input(1,z-1) & input(1,z) == input(2,z) // right upper
    certainlyBlack($+1) = [1,z]
    certainlyWhite($+1) = [1,z-1]
    certainlyWhite($+1) = [2,z]
  end
  if input(z,1) == input(z-1,1) & input(z,1) == input(z,2) // left lower
    certainlyBlack($+1) = [z,1]
    certainlyWhite($+1) = [z-1,1]
    certainlyWhite($+1) = [z,2]
  end
endfunction

// corner technique 2
  // 3 1 . . .    z w . . . // top left vertical
  // 3 1 . . .    w z . . .
  // . . . . . -> . . . . .
  // 4 4 . 5 5    w z . ? ? <- // TODO: what do we do with these?
  // 2 2 . 5 5    z w . ? ? // lower left horizontal
  // 8 cases; upper/lower,left/right,vertical/horizontal
function [certainlyBlack,certainlyWhite]=cornerTechnique2(input)
  z = sqrt(length(input))
  certainlyWhite = list()
  certainlyBlack = list()
  if (input(1,1) == input(2,1) & input(1,2) == input(2,2)) | (input(1,1) == input(1,2) & input(2,1) == input(2,2))
      // upper left ver                                       // upper left hor
    certainlyBlack($+1) = [1,1]
    certainlyBlack($+1) = [2,2]
    certainlyWhite($+1) = [2,1]
    certainlyWhite($+1) = [1,2]
  end
  if (input(1,z-1) == input(2,z-1) & input(1,z) == input(2,z)) | (input(1,z-1) == input(1,z) & input(2,z-1) == input(2,z))
      // upper right ver                                          // upper right hor
    certainlyBlack($+1) = [1,z]
    certainlyBlack($+1) = [2,z-1]
    certainlyWhite($+1) = [1,z-1]
    certainlyWhite($+1) = [2,z]
  end
  if (input(z-1,1) == input(z,1) & input(z-1,2) == input(z,2)) | (input(z-1,1) == input(z-1,2) & input(z,1) == input(z,2))
      // lower left ver                                           // lower left hor
    certainlyBlack($+1) = [z,1]
    certainlyBlack($+1) = [z-1,2]
    certainlyWhite($+1) = [z-1,1]
    certainlyWhite($+1) = [z,2]
  end
  if (input(z-1,z-1) == input(z,z-1) & input(z-1,z) == input(z,z)) | (input(z-1,z-1) == input(z-1,z) & input(z,z-1) == input(z,z))
      // lower left ver                                               // lower left hor
    certainlyBlack($+1) = [z,z]
    certainlyBlack($+1) = [z-1,z-1]
    certainlyWhite($+1) = [z-1,z]
    certainlyWhite($+1) = [z,z-1]
  end
endfunction


// [1 2 3 4 3 5 2 1]
// [l l w l l z w l]
//    ^     ^       those should be black
//  1 2 3 4 5 6 7 8
function [certainlyBlack]=whiteColoredMeansOtherBlack(inputRow,inputColors)
  certainlyBlack = list()
  z = length(inputRow)
  for i = find(inputColors == wit)       // find all white locations
    num = inputRow(i)                    // find what numbers on that location
    otherPlaces = find(inputRow == num)  // find other places with that number
    if length(otherPlaces) == 1 then continue; end // if there's just one, skip
    for j = otherPlaces
      if j == i then continue; end
      certainlyBlack($+1) = j
    end
  end
endfunction
