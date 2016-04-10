mode(-1);
errcatch(-1,"stop")
warning('off')
exec('losop.sce', -1)
exec('helperfunc.sce', -1)

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

quit
