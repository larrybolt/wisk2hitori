mode(-1);
warning('off');
z=0
w=1
leeg=-1

//6*6 eenvoudig (iOs "hitori")
N1=[5 2 1 5 4 6
    5 4 3 2 5 4
    1 5 4 4 6 2
    4 4 5 1 5 1
    4 3 5 5 2 1
    2 4 6 4 5 5]

C1=[z w w w w w
    w z w w z w
    w w w z w w
    z w z w w z
    w w w z w w
    w z w w z w]

//9*9 eenvoudig (iOs "Real Hitori")
N2=[1 8 2 4 3 9 4 1 5
    6 5 5 1 1 4 9 3 3
    8 4 6 9 5 3 2 6 7
    4 8 3 8 7 8 8 2 9
    1 6 4 2 3 6 5 9 1
    9 5 8 3 5 2 7 6 1
    2 5 3 1 6 4 4 2 8
    5 4 4 2 9 3 7 7 6
    7 9 1 5 1 6 3 8 8]

C2=[z w w w z w z w w
    w z w z w w w w z
    w w w w w z w z w
    w z w z w w z w w
    w w z w w z w w z
    w z w w z w w w w
    w w z w w z w z w
    w z w z w w z w w
    w w w w z w w w z]

// 5*5 gemakkelijk (hitoriconquest.com)
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

// 5*5 iets moeilijker (hitoriconquest.com)
N4=[5 3 3 2 2
    3 3 2 5 4
    1 2 3 1 5
    4 2 1 3 5
    1 5 4 1 3]

C4=[w w z w z
    w z w w w
    w w w z w
    w z w w z
    z w w w w]

// 8*8 iets moeilijker (muren) (hitoriconquest.com)
N5=[5 2 4 5 6 1 6 7
    5 5 2 7 8 1 4 1
    1 2 8 6 4 7 3 1
    3 4 7 7 5 2 7 6
    1 6 7 3 8 5 2 8
    2 2 3 5 7 1 6 7
    6 7 3 1 5 3 8 4
    5 8 5 2 1 6 5 3]

C5=[w w w z w w z w
    z w w w w z w w
    w z w w w w w z
    w w w z w w z w
    z w z w z w w w
    w z w w w z w z
    w w z w z w w w
    z w w w w w z w]

//5*5 gemakkelijk (brainbashers)
N6=[3 1 5 5 1
    1 5 2 3 4
    2 5 3 2 5
    5 1 2 2 3
    4 1 1 5 5]

C6=[w z w z w
    w w w w w
    w z w z w
    w w z w w
    w z w w z]

//7*7 gemakkelijk (brainbashers)
N7=[4 2 1 2 6 6 5
    7 2 6 2 1 5 3
    7 7 2 5 5 2 6
    1 1 7 5 2 6 6
    2 6 5 6 3 5 1
    4 5 2 1 4 2 7
    5 1 4 6 4 3 5]

C7=[w w w z w z w
    w z w w w w w
    z w w z w z w
    w z w w w w z
    w w w z w z w
    z w z w w w w
    w w w w z w z]

//9*9 gemakkelijk (brainbashers)
N8=[4 2 3 8 1 2 5 4 6
    8 2 6 6 9 2 7 8 3
    6 7 5 4 2 8 9 2 6
    5 9 1 6 2 1 4 6 8
    1 7 2 4 4 1 6 7 5
    1 5 9 2 9 3 1 6 2
    2 1 8 9 6 6 3 8 7
    3 6 8 9 7 4 2 4 9
    4 1 1 7 4 6 9 9 2]

C8=[z w w w w z w w w
    w z w z w w w z w
    w w w w z w w w z
    w w z w w w w z w
    w z w z w z w w w
    z w w w z w w w z
    w w z w w z w w w
    w w w z w w w z w
    w z w w z w z w w()]

//6*6 medium (muren!) (brainbashers)
N9=[5 2 2 1 6 6
    2 6 5 4 4 3
    1 6 4 2 3 6
    1 4 5 5 4 1
    3 2 1 6 4 5
    3 1 1 3 1 2]

C9=[w z w w w z
    w w w w z w
    w z w w w w
    z w z w z w
    w w w w w w
    z w z w z w]

//12*12 gemakkelijk (brainbashers)
N10=[2 11 1 12 7 1 10 6 3 6 12 2
     4 11 7 10 9 2 11 5 8 8 6 9
     11 7 9 1 4 6 12 3 9 11 8 7
     4 4 6 5 10 12 9 1 6 9 11 10
     9 2 4 8 10 9 7 6 2 7 5 6
     2 8 5 7 1 10 12 4 5 12 3 7
     10 8 9 6 5 1 5 1 12 4 9 8
     11 10 12 10 11 12 3 8 5 9 9 8
     12 2 10 7 5 3 9 10 9 11 1 6
     5 5 3 4 11 9 4 12 8 2 8 11
     5 6 6 3 9 4 8 2 12 7 12 1
     12 9 10 6 12 10 4 7 6 2 2 9]

C10=[z w w w w z w z w w z w
     w z w w z w w w z w w w
     w w z w w w w w w z w z
     z w w w z w z w z w w w
     w z w w w z w w w z w z
     w w w z w w z w z w w w
     w z w w z w w z w w z w
     z w w z w z w w w z w z
     w w z w w w w w z w w w
     z w w w z w z w w w z w
     w w z w w w w w z w w w
     z w w z w z w w w z w z]

//6*6 medium (brainbashers)
N11=[5 2 2 1 6 6
     2 6 5 4 4 3
     1 6 4 2 3 6
     1 4 5 5 4 1
     3 2 1 6 4 5
     3 1 1 3 1 2]

C11=[w z w w w z
     w w w w z w
     w z w w w w
     z w z w z w
     w w w w w w
     z w z w z w]

// speciaal geval: alle 2 in laatste kolom zwart
N12=[3 4 2 5 2
     4 2 4 1 4
     2 2 1 4 2
     1 5 4 2 3
     4 5 5 3 3]

C12=[w w w w z
     z w z w w
     w z w w z
     w w w w w
     w z w w z]

