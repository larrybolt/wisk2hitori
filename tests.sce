mode(-1);
errcatch(-1,"stop")
warning('off')
exec('losop.sce', -1)
exec('helperfunc.sce', -1)
exec('testcases.sce', -1)

[z,w]=adjecentTriplets([1 2 3 4 4 4 3 3 1])
//                            z w z
//                      1 2 3 4 5 6 7 8 9
assert_checkequal(z,list(4,6))
assert_checkequal(w,list(5))

[w]=squareBetweenPair([1 2 4 8 4 2 3 1 3])
//                           w       w
//                     1 2 3 4 5 6 7 8 9
assert_checkequal(w,list(4,8))

[z]=pairInducation([3 5 4 5 5 2 3 1 5])
//                    z             z
//                  1 2 3 4 5 6 7 8 9
assert_checkequal(z,list(2,9))

z=0; w=1; l=-1
//  input(r,c)
//    r: 1 2 3 4     c
input = [l l l l  // 1
         l z l l  // 2
         l l l z  // 3
         z l l l] // 4
[w]=unshadingAroundShaded(input);
assert_checkequal(%t,isInList([1,2], w))
assert_checkequal(%t,isInList([2,1], w))
assert_checkequal(%t,isInList([2,3], w))
assert_checkequal(%t,isInList([3,2], w))
assert_checkequal(%t,isInList([4,4], w))
assert_checkequal(%t,isInList([2,4], w))
assert_checkequal(%t,isInList([3,3], w))
assert_checkequal(%t,isInList([4,2], w))


//  input(r,c)
//    r: 1 2 3 4     c
input = [3 3 2 1  // 1
         3 1 2 1  // 2
         2 7 8 9  // 3
         1 4 5 6] // 4
[z,w]=cornersHaveSameNumber(input);
assert_checkequal(%t,isInList([1,1], z))
assert_checkequal(%t,isInList([1,2], w))
assert_checkequal(%t,isInList([2,1], w))
input = [1 3 2 1
         3 1 2 1
         2 7 8 1
         1 4 1 1]
[z,w]=cornersHaveSameNumber(input);
assert_checkequal(%t,isInList([4,4], z))
assert_checkequal(%t,isInList([4,3], w))
assert_checkequal(%t,isInList([3,4], w))

//  input(r,c)
//    r: 1 2 3 4     c
input = [3 1 2 1  // 1
         3 1 2 1  // 2
         2 7 8 8  // 3
         1 4 1 1] // 4
[z,w]=cornerTechnique2(input);
assert_checkequal(%t,isInList([1,1], z)) // upper left
assert_checkequal(%t,isInList([2,2], z))
assert_checkequal(%t,isInList([1,2], w))
assert_checkequal(%t,isInList([2,1], w))
assert_checkequal(%t,isInList([4,4], z)) // lower right
assert_checkequal(%t,isInList([3,3], z))
assert_checkequal(%t,isInList([4,3], w))
assert_checkequal(%t,isInList([3,4], w))
input = [1 2 3 3
         4 1 2 2
         2 7 9 8
         2 7 2 1]
[z,w]=cornerTechnique2(input);
assert_checkequal(%t,isInList([1,4], z)) // upper right
assert_checkequal(%t,isInList([2,3], z))
assert_checkequal(%t,isInList([1,3], w))
assert_checkequal(%t,isInList([2,4], w))
assert_checkequal(%t,isInList([4,1], z)) // lower left
assert_checkequal(%t,isInList([3,2], z))
assert_checkequal(%t,isInList([3,1], w))
assert_checkequal(%t,isInList([4,2], w))

z=0; w=1; l=-1
input = [3 3 2 1
         3 1 2 1
         2 7 8 9 // the 2 has vertically & horizontaly no conflicts, thus white
         1 4 8 6]
//       l l l l  1
//       l l l l  2
//       w w l w  3
//       w w l w  4
//       1 2 3 4
[w]=noConflictMeansW(input);
assert_checkequal(%t,isInList([3,1], w))
assert_checkequal(%t,isInList([3,2], w))
assert_checkequal(%t,isInList([3,4], w))
assert_checkequal(%t,isInList([4,1], w))
assert_checkequal(%t,isInList([4,2], w))
assert_checkequal(%t,isInList([4,4], w))

z=0; w=1; l=-1
i = [1 2 3 4 3 5 2 1]
j = [l l w l l z w l]
//     ^     ^       those should be black
//   1 2 3 4 5 6 7 8
[z]=whiteColoredMeansOtherBlack(i,j)
assert_checkequal(%t,isInList(2,z))
assert_checkequal(%t,isInList(5,z))

// test isvalid part
// test multipleNumbBlack
assert_checkequal(%t,multipleNumbBlack(N1,C1))
assert_checkequal(%t,multipleNumbBlack(N2,C2))
assert_checkequal(%t,multipleNumbBlack(N3,C3))
assert_checkequal(%t,multipleNumbBlack(N4,C4))
assert_checkequal(%t,multipleNumbBlack(N5,C5))
assert_checkequal(%t,multipleNumbBlack(N6,C6))
assert_checkequal(%t,multipleNumbBlack(N7,C7))
assert_checkequal(%t,multipleNumbBlack(N8,C8))
assert_checkequal(%t,multipleNumbBlack(N9,C9))
assert_checkequal(%t,multipleNumbBlack(N10,C10))
assert_checkequal(%t,multipleNumbBlack(N11,C11))
assert_checkequal(%t,multipleNumbBlack(N12,C12))
Nbad = [5    5    1    5    3
        5    4    1    2    1
        5    3    4    3    5
        3    4    5    4    2
        1    2    3    3    4 ]
Cbad = [1    1    1    0    1
        1    1    0    1    1
        0    1    1    0    1
        1    0    1    1    1
        1    1    1    0    1]
assert_checkequal(%f,multipleNumbBlack(Nbad,Cbad))
Nbad = [5    5    1    5    3
        5    4    1    2    1
        5    3    4    3    5
        3    4    5    4    2
        1    2    3    3    4 ]
Cbad = [0    1    1    0    1
        1    1    0    1    1
        0    1    1    0    1
        1    1    1    1    1
        1    1    1    0    1]
assert_checkequal(%f,multipleNumbBlack(Nbad,Cbad))
RNbad = [5    5    1    5    3]
RCbad = [1    0    1    1    1]
assert_checkequal(%f,firstRuleForRow(RNbad,RCbad))
RNgood = [5    5    1    5    3]
RCgood = [0    1    1    0    1]
assert_checkequal(%t,firstRuleForRow(RNgood,RCgood))

// test isContinuous
assert_checkequal(%t,isContinuousWhite(C1))
assert_checkequal(%t,isContinuousWhite(C2))
assert_checkequal(%t,isContinuousWhite(C3))
assert_checkequal(%t,isContinuousWhite(C4))
assert_checkequal(%t,isContinuousWhite(C5))
assert_checkequal(%t,isContinuousWhite(C6))
assert_checkequal(%t,isContinuousWhite(C7))
assert_checkequal(%t,isContinuousWhite(C8))
assert_checkequal(%t,isContinuousWhite(C9))
assert_checkequal(%t,isContinuousWhite(C10))
assert_checkequal(%t,isContinuousWhite(C11))
assert_checkequal(%t,isContinuousWhite(C12))
Cbad = [0    1    1    0    1
        1    1    0    1    0
        0    1    1    0    1
        1    0    1    1    1
        1    1    1    0    1]
assert_checkequal(%f,isContinuousWhite(Cbad))
Cbad = [0    1    1    0    1
        1    1    0    1    1
        0    1    1    0    1
        1    0    1    1    1
        1    1    0    1    1]
assert_checkequal(%f,isContinuousWhite(Cbad))

// test 2nd rule of hitori
z=0; w=1; l=-1
assert_checkequal(%f,noBlackCellsNextToEachother([z w z z w w w z]))
assert_checkequal(%t,noBlackCellsNextToEachother([z w z w w w w z]))

// test multipleNumbBlack
assert_checkequal(%t,isValidHitori(N1,C1))
assert_checkequal(%t,isValidHitori(N2,C2))
assert_checkequal(%t,isValidHitori(N3,C3))
assert_checkequal(%t,isValidHitori(N4,C4))
assert_checkequal(%t,isValidHitori(N5,C5))
assert_checkequal(%t,isValidHitori(N6,C6))
assert_checkequal(%t,isValidHitori(N7,C7))
assert_checkequal(%t,isValidHitori(N8,C8))
assert_checkequal(%t,isValidHitori(N9,C9))
assert_checkequal(%t,isValidHitori(N10,C10))
assert_checkequal(%t,isValidHitori(N11,C11))
assert_checkequal(%t,isValidHitori(N12,C12))

quit
