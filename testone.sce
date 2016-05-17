// script die de testen uitvoert,
// eerst de controleSudoku() functie,
// daarna de solveSudoku
mode(-1);
errcatch(-1,"stop")
warning('off')
exec('losop.sce', -1)
z=0
w=1
leeg=-1
N21=[9 7 3 3 8 2 6 5 6
     7 8 2 5 1 4 9 8 3
     1 3 8 9 4 1 7 1 9
     2 8 9 6 5 8 4 7 2
     5 2 9 9 1 2 6 7 8
     2 5 1 8 9 7 3 6 3
     4 8 3 7 3 5 5 2 1
     7 4 7 1 6 3 2 9 2
     1 9 5 8 3 6 8 4 5]

C21=[w w w z w w z w w
     w z w w z w w w z
     z w w z w z w w w
     w z w w w w w w z
     w w z w w z w z w
     z w w z w w z w w
     w w z w w z w w w
     z w w w w w w w z
     w w z w z w z w w]
R1=losOp(N21);
disp(N21)
disp(R1)
quit
