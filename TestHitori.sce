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

exec('extracases.sce', -1)

function testlosOpTB()
  juist=[]
  tic()
  printf("Puzzel 1 oplossen\n")
  sS1 = losOp(N1)
  printf("Puzzel 2 oplossen\n")
  sS2 = losOp(N2)
  printf("Puzzel 3 oplossen\n")
  sS3 = losOp(N3)
  printf("Puzzel 4 oplossen\n")
  sS4 = losOp(N4)
  printf("Puzzel 5 oplossen\n")
  sS5 = losOp(N5)
  printf("Puzzel 6 oplossen\n")
  sS6 = losOp(N6)
  printf("Puzzel 7 oplossen\n")
  sS7 = losOp(N7)
  printf("Puzzel 8 oplossen\n")
  sS8 = losOp(N8)
  printf("Puzzel 9 oplossen\n")
  sS9 = losOp(N9)
  printf("Puzzel 10 oplossen\n")
  sS10 = losOp(N10)
  printf("Puzzel 11 oplossen\n")
  sS11 = losOp(N11)
  printf("Puzzel 12 oplossen\n\n")
  sS12 = losOp(N12)

  printf("Puzzel 13 oplossen\n\n")
  sS13 = losOp(N13)
  printf("Puzzel 14 oplossen\n\n")
  sS14 = losOp(N14)
  printf("Puzzel 15 oplossen\n\n")
  sS15 = losOp(N15)
  printf("Puzzel 16 oplossen\n\n")
  sS16 = losOp(N16)
  printf("Puzzel 17 oplossen\n\n")
  sS17 = losOp(N17)
  printf("Puzzel 18 oplossen\n\n")
  sS18 = losOp(N18)
  printf("Puzzel 19 oplossen\n\n")
  sS19 = losOp(N19)
  printf("Puzzel 20 oplossen\n\n")
  sS20 = losOp(N20)
  printf("Puzzel 21 oplossen\n\n")
  sS21 = losOp(N21)
  printf("Puzzel 22 oplossen\n\n")
  sS22 = losOp(N22)

  time = toc()

  nSolved = 0; nNotSolved = 0;
  teller = 1
  if isequal(sS1,C1) then
    nSolved = nSolved+1
    juist(teller) = 1
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS2,C2) then
    nSolved = nSolved+1
    juist(teller) = 2
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS3,C3) then
    nSolved = nSolved+1
    juist(teller) = 3
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS4,C4) then
    nSolved = nSolved+1
    juist(teller) = 4
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS5,C5) then
    nSolved = nSolved+1
    juist(teller) = 5
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS6,C6) then
    nSolved = nSolved+1
    juist(teller) = 6
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS7,C7) then
    nSolved = nSolved+1
    juist(teller) = 7
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS8,C8) then
    nSolved = nSolved+1
    juist(teller) = 8
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS9,C9) then
    nSolved = nSolved+1
    juist(teller) = 9
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS10,C10) then
    nSolved = nSolved+1
    juist(teller) = 10
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS11,C11) then
    nSolved = nSolved+1
    juist(teller) = 11
    teller = teller + 1
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS12,C12) then
    nSolved = nSolved+1
    juist(teller) = 12

  else
    nNotSolved = nNotSolved+1
  end

// own extra added
  if isequal(sS13,C13) then
    nSolved = nSolved+1
    juist(teller) = 13
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS14,C14) then
    nSolved = nSolved+1
    juist(teller) = 14
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS15,C15) then
    nSolved = nSolved+1
    juist(teller) = 15
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS16,C16) then
    nSolved = nSolved+1
    juist(teller) = 16
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS17,C17) then
    nSolved = nSolved+1
    juist(teller) = 17
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS18,C18) then
    nSolved = nSolved+1
    juist(teller) = 18
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS19,C19) then
    nSolved = nSolved+1
    juist(teller) = 19
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS20,C20) then
    nSolved = nSolved+1
    juist(teller) = 20
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS21,C21) then
    nSolved = nSolved+1
    juist(teller) = 21
  else
    nNotSolved = nNotSolved+1
  end
  if isequal(sS22,C22) then
    nSolved = nSolved+1
    juist(teller) = 22
  else
    nNotSolved = nNotSolved+1
  end

  printf("Aantal correct opgeloste puzzels = %d, nl volgende:\n",nSolved)
  disp(juist')

  printf("Aantal onvolledig of verkeerd opgeloste puzzels = %d\n",nNotSolved)


  [Pjuist, Pleeg, Pfout,totaalvakjes] = percentageCorrIngevuld( list(N1, N2, N3, N4, N5, N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,N22), list(sS1, sS2, sS3, sS4, sS5, sS6,sS7,sS8,sS9,sS10,sS11,sS12,sS13,sS14,sS15,sS16,sS17,sS18,sS19,sS20,sS21,sS22), list(C1, C2, C3, C4, C5, C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20,C21,C22));

  Pjuistper = round(Pjuist/totaalvakjes*100)
  Pleegper = round(Pleeg/totaalvakjes*100)
  Pfoutper = round(Pfout/totaalvakjes*100)
  printf("Aantal correct ingevulde vakjes: %d (= %d procent)\n",Pjuist,Pjuistper)
  printf("Aantal lege vakjes: %d (= %d procent)\n",Pleeg,Pleegper)
  printf("Aantal foutief ingevulde vakjes: %d (= %d procent)\n",Pfout,Pfoutper)


  printf("Totale tijd in seconden = %d",time)
endfunction



// Hulpfunctie voor bovenstaande functie testSolveTB


function [Pjuist,Pleeg, Pfout,totaalVakken] = percentageCorrIngevuld(lS, lsS, lO)
  totaalVakken = 0;
  Pjuist = 0;
  Pleeg = 0;
  Pfout = 0;
  for(t=1:length(lS))
    S = lS(t)
    formaat=size(S,"r")
    sS = lsS(t)
    O = lO(t)
    for i=1:formaat
      for j=1:formaat
        totaalVakken = totaalVakken + 1
        if sS(i,j) == O(i,j) then
          Pjuist = Pjuist + 1
        else if sS(i,j) == leeg then
            Pleeg = Pleeg + 1
          else
            disp("fout oplossen van "+string(t)+" cell "+string(i)+","+string(j))
            Pfout = Pfout + 1
          end
        end
      end
    end
  end
  Pjuist = Pjuist;
  Pleeg = Pleeg;
  Pfout = Pfout;
endfunction




testlosOpTB()


