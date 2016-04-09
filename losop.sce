mode(-1);
warning('off');

function [output]=losOp(input)
	// define size (4 rows, 4 cols => size=4)
	size=sqrt(length(input))	
	output=zeros(size)
	for i = [1:size]
		for j = [1:size]
			output(i,j)=-1
		end
	end

	// http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques
	// technique 1 // search for adjecent triplets
	for i = [1:size]
		
	end
endfunction
