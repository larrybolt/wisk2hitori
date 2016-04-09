mode(-1);
warning('off');
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
	
	for row = [1:size]
		for col = [1:size]

		end
	end
	// columns
	for col = [1:size]
		for row = [2:size-1]

		end
	end
endfunction
