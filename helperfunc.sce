mode(-1);
warning('off');
function [res]=isInList(needle,haystack)
	res=%f
	for i=haystack
		if i == needle
			res=%t
			return
		end
	end
endfunction
