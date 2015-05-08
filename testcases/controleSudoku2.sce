mode(-1);
warning('off');
// correct opgeloste sudokus

S1 = [8 7 1 2 3 5 6 9 4;
      2 9 6 1 8 4 5 7 3;
      5 3 4 6 9 7 1 2 8;
      9 4 5 8 2 3 7 1 6;
      3 6 2 7 1 9 8 4 5;
      7 1 8 5 4 6 9 3 2;
      1 2 7 3 6 8 4 5 9;
      6 5 9 4 7 2 3 8 1;
      4 8 3 9 5 1 2 6 7] 
      
S2 = [1 2 3 4 5 6 7 8 9;
      4 5 6 7 8 9 1 2 3;
      7 8 9 1 2 3 4 5 6;
      2 3 4 5 6 7 8 9 1;
      5 6 7 8 9 1 2 3 4;
      8 9 1 2 3 4 5 6 7;
      3 4 5 6 7 8 9 1 2;
      6 7 8 9 1 2 3 4 5;  
      9 1 2 3 4 5 6 7 8]
    

// niet correct opgeloste sudokus

T1 = [8 7 1 2 3 5 6 9 4;
      2 9 6 1 8 4 5 7 3;
      5 3 4 6 9 7 1 2 8;
      9 4 5 8 2 3 7 1 6;
      3 6 2 7 1 9 8 4 5;
      7 1 8 5 4 6 9 3 2;
      1 2 7 3 6 8 4 1 9;
      6 5 9 4 7 2 3 8 1;
      4 8 3 9 5 1 2 6 7]
      
T2 = [8 7 1 2 3 5 6 9 4;
      2 9 6 1 8 4 5 7 3;
      5 3 4 6 9 7 1 2 8;
      9 4 5 8 2 3 7 1 6;
      3 6 2 7 1 9 8 4 5;
      7 1 8 5 4 6 9 3 2;
      1 2 7 3 6 8 4 5 9;
      6 5 9 4 7 2 3 8 1;
      4 8 3 9 5 1 2 0 7]
      
T3 = [8 7 1 2 3 5 6 9 4;
      2 9 6 1 8 4 5 7 3;
      5 3 4 6 9 7 1 2 8;
      9 4 5 8 2 3 7 1 6;
      3 6 2 7 1 9 8 6 5;
      7 1 8 5 4 6 9 3 2;
      1 2 7 3 6 8 4 5 9;
      4 5 9 4 7 2 3 8 1;
      6 8 3 9 5 1 2 4 7]
      
T4 = [1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9;
      1 2 3 4 5 6 7 8 9]
      
T5 = [1 1 1 1 1 1 1 1 1;
      2 2 2 2 2 2 2 2 2;
      3 3 3 3 3 3 3 3 3;
      4 4 4 4 4 4 4 4 4;
      5 5 5 5 5 5 5 5 5;
      6 6 6 6 6 6 6 6 6;
      7 7 7 7 7 7 7 7 7;
      8 8 8 8 8 8 8 8 8;
      9 9 9 9 9 9 9 9 9]
      
T6 = [1 2 3 4 5 6 7 8 9;
      2 3 4 5 6 7 8 9 1;
      3 4 5 6 7 8 9 1 2;
      4 5 6 7 8 9 1 2 3;
      5 6 7 8 9 1 2 3 4;
      6 7 8 9 1 2 3 4 5;
      7 8 9 1 2 3 4 5 6;
      8 9 1 2 3 4 5 6 7;
      9 1 2 3 4 5 6 7 8]
      
T7 = [1 2 3 4 5 6 7 8 9;
      4 5 6 7 8 9 1 2 3;
      7 8 9 1 2 3 4 5 6;
      2 3 4 5 6 7 8 9 1;
      5 6 7 8 9 1 2 3 4;
      8 9 1 2 3 4 5 6 7;
      3 4 5 6 7 8 9 1 2;
      6 7 8 10 1 2 3 4 5;  
      9 1 2 3 4 5 6 7 8]
      
T8 = [2 1 3 4 5 6 7 8 9;
      5 4 6 7 8 9 1 2 3;
      4 3 5 6 7 8 9 1 2;
      8 7 9 1 2 3 4 5 6;
      3 2 4 5 6 7 8 9 1;
      6 5 7 8 9 1 2 3 4;
      9 8 1 2 3 4 5 6 7;
      7 6 8 9 1 2 3 4 5;  
      1 9 2 3 4 5 6 7 8]
      
      
      
function testControleSudoku()
    nJuist = 0; nFout = 0;
    if(controleSudoku(S1)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(controleSudoku(S2)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T1)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T2)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T3)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T4)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T5)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T6)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T7)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    if(~controleSudoku(T8)) then nJuist = nJuist +1; else nFout = nFout + 1; end
    disp("Aantal correct gecontroleerde sudoku puzzels = ");disp(nJuist); 
    disp("Aantal niet correct gecontroleerde sudoku puzzels = ");disp(nFout);  
endfunction

testControleSudoku()
      


 
