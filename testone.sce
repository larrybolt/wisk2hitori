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
N3=[5 5 1 5 3
    5 4 1 2 1
    5 3 4 3 5
    3 4 5 4 2
    1 2 3 3 4]

C3=[z w w z w
    w w z w w
    z w w z w
    w z w w w
    w w w z w]
R1=losOp(N3);
disp(N3)
disp(R1)
quit
