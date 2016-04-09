mode(-1);
warning('off');
exec('helperfunc.sce',-1);

z=0
w=1
leeg=-1
// input(row,colomn)

function [output]=losOp(input)
	// define size (4 rows, 4 cols => size=4)
	size=sqrt(length(input))	
	output=zeros(size)
	for i = [1:size]
		for j = [1:size]
			output(i,j)=leeg
		end
	end

	// http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques
	// technique 1 // search for adjecent triplets
	// rows
	for row = [1:size]
		for col = [2:size-1]
			if input(row,col-1) == input(row,col) & input(row,col) == input(row,col+1)
				output(row,col)=w
				output(row,col-1)=z
				output(row,col+1)=z
			end
		end
	end
	// columns
	for col = [1:size]
		for row = [2:size-1]
			if input(row-1,col) == input(row,col) & input(row,col) == input(row+1,col)
				output(row,col)=w
				output(row-1,col)=z
				output(row+1,col)=z
			end
		end
	end
	// technique 2 // square between a pair
	// rows
	for row = [1:size]
		for col = [2:size-1]
			if input(row,col-1) <> input(row,col) & input(row,col-1) == input(row,col+1)
				output(row,col)=w
			end
		end
	end
	// columns
	for col = [1:size]
		for row = [2:size-1]
			if input(row-1,col) <> input(row,col) & input(row-1,col) == input(row+1,col)
				output(row,col)=w
			end
		end
	end
	// technique 3 // pair induction
	// rows
//	for row = [1:size]
//		// current row we're scanning
//		currentRow = input(row,:)
//		// take the unique numbers
//		disp("here")
//		disp(currentRow)
//		numbersNeedChecking = unique([currentRow])
//		disp("here")
//		disp(currentRow)
//		for num = numbersNeedChecking
//			locationsOfNumber = find(currentRow == num)
//			// if we don't have the same number 3 or more times in a row, try the next number
//			if length(locationsOfNumber)<3 then continue end
//			// currentRow =                4 3 2 1 8 7 8 8 5  8  6
//			// we are checking for 8's:    * * * * 8 * 8 8 *  8  * because num = 8
//			// the indexes for these 8's:  1 2 3 4 5 6 7 8 9 10 11
//			//                                     ^   ^ ^    ^
//			// so locationsOfNumber = 5 7 8 10
//			// now we need to find the numbers that are alone, eg: [5] 7 8 [10]
//			// and the ones that connect with others           eg:  5 [7 8] 10
//			alone=list()    // will be: 5 10
//			notAlone=list() // will be: 7 8
//			for i = [1:length(locationsOfNumber)-1]
//				if locationsOfNumber(i) <> locationsOfNumber(i+1)-1 & isInList(i,notAlone) <> %t
//					alone($+1)=locationsOfNumber(i)
//					continue
//				elseif locationsOfNumber(i) == locationsOfNumber(i+1)-1
//					notAlone($+1)=locationsOfNumber(i)
//					notAlone($+1)=locationsOfNumber(i+1)
//				end
//			end
//			if length(notAlone)>1
//				for i = alone
//					output(row,i)=z
//				end
//			end	
//		end
//	end
//	// columns
//	for col = [1:size]
//		for row = [1:size]
//
//		end
//	end
endfunction
