// script die de testen uitvoert,
// eerst de controleSudoku() functie,
// daarna de solveSudoku
mode(-1);
warning('off')
exec('solver.sce')
exec('testcases/controleSudoku2.sce')
exec('testcases/solveSudoku2.sce')
