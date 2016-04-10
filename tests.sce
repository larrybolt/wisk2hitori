mode(-1);
errcatch(-1,"stop")
warning('off')
exec('losop.sce', -1)

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

quit
