// script die de testen uitvoert,
// eerst de controleSudoku() functie,
// daarna de solveSudoku
warning('off')
exec('solver.sce')
exec('testcases/controleSudoku2.sce')
exec('testcases/solveSudoku2.sce')
