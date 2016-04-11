// script die de testen uitvoert,
// eerst de controleSudoku() functie,
// daarna de solveSudoku
mode(-1);
errcatch(-1,"stop")
warning('off')
exec('losop.sce', -1)
exec('./TestHitori.sce')
quit
