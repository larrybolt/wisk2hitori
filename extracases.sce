mode(-1);
warning('off');
// source: Real Hitori App

// Easy 10

N13=[7 1 4 2 6 1 8 3 3
     3 4 9 2 6 7 3 1 6
     1 3 8 2 4 6 5 7 5
     8 1 1 3 5 4 7 2 7
     4 2 3 7 1 5 7 5 1
     7 6 8 8 3 5 4 9 4
     1 3 5 6 2 1 4 8 5
     5 8 6 3 9 2 7 3 1
     4 5 7 9 7 1 3 4 5]

C13=[w z w z w w w z w
     w w w w z w z w w
     z w w z w w w w z
     w z w w w w z w w
     w w w z w z w w z
     z w z w w w z w w
     w z w w w z w w z
     w w w z w w z w w
     z w z w w z w w z]

// Easy 11

N14=[5 1 6 4 9 8 2 4 3
     7 6 4 3 4 8 2 9 3
     3 8 1 2 6 3 7 5 4
     6 2 4 8 1 1 3 7 3
     2 6 7 8 8 5 9 4 6
     1 9 5 7 8 6 3 1 2
     9 7 7 1 5 4 8 2 7
     7 1 9 3 2 7 5 6 8
     6 4 3 9 7 2 1 7 5]

C14=[w w w z w z w w w
     z w z w w w z w z
     w w w w w z w w w
     w w w w z w w w z
     w z w z w w w z w
     z w w w z w z w w
     w w z w w w w w z
     w z w z w z w w w
     z w w w w w w z w]

// Medium 10

N15=[5 1 1 9 6 3 1 7 4
     4 3 7 3 8 5 2 2 1
     3 6 8 4 4 2 7 5 7
     6 5 4 3 2 7 8 1 8
     1 5 9 5 3 4 5 2 8
     8 4 8 3 5 6 3 6 3
     4 8 6 1 9 6 4 3 2
     2 3 6 7 4 3 1 8 1
     5 2 3 2 7 1 6 4 6]

C15=[w w z w w w z w w
     z w w z w w w z w
     w w z w z w z w w
     w w w w w w w w z
     w z w w w w z w w
     z w w z w z w w z
     w w z w w w z w w
     w z w w w z w w z
     z w w z w w z w w]

// Medium 11

N16=[1 9 1 3 8 1 5 8 6
     2 1 3 2 7 4 6 6 9
     6 4 4 9 3 2 1 7 2
     8 2 3 5 6 5 9 4 7
     5 7 9 1 7 6 7 5 3
     8 6 2 8 5 9 8 3 2
     9 3 1 7 1 2 6 8 5
     1 6 8 2 4 3 3 9 3
     2 7 6 5 9 3 3 1 8]

C16=[z w z w w w w z w
     w w w z w w z w w
     w z w w w w w w z
     w w z w w z w w w
     w z w w z w w z w
     z w w z w w w w z
     w w z w w z w w w
     w z w w w w z w z
     z w w z w z w w w]

// Hard 10

N17=[5 2 8 4 4 6 4 9 3
     4 2 2 9 8 7 6 3 7
     4 5 3 6 6 7 4 2 4
     2 8 1 6 4 9 7 4 5
     8 1 6 7 9 6 2 1 4
     7 1 9 3 3 8 6 6 4
     1 6 7 5 2 4 9 4 6
     3 6 1 8 1 4 5 8 3
     6 9 2 3 7 3 8 5 4]

C17=[w w w z w w z w z
     w z w w w z w w w
     z w w z w w w w z
     w w z w z w w z w
     w z w w w z w w w
     w w w z w w z w z
     w z w w w z w w w
     z w w w z w w z w
     w w z w w z w w z]

// Hard 11

N18=[9 5 8 7 3 1 2 1 3
     7 2 4 8 3 9 3 1 6
     9 4 7 5 9 6 7 2 1
     5 2 3 9 4 2 1 4 8
     4 1 7 2 6 3 8 8 5
     8 3 1 6 4 6 5 9 5
     9 5 4 4 3 1 1 8 7
     2 7 5 1 8 6 4 2 9
     1 7 7 3 3 5 9 6 7]

C18=[w z w w w z w w z
     w w w w z w w z w
     z w z w w z w w w
     w z w w z w w w w
     w w z w w w w z w
     w w w w w z w w z
     z w z w z w z w w
     w w w w w w w z w
     w z w w z w w w z]

// Challanging 10
// Vanaf Challanging begint backtracking meer een rol te spelen

N19=[2 5 7 9 3 3 4 6 1
     4 5 2 6 3 1 9 7 5
     3 6 7 2 4 5 9 4 3
     3 1 6 1 8 3 5 2 4
     1 9 5 1 4 4 5 6 3
     6 2 3 5 1 7 8 3 9
     5 1 8 1 9 3 2 3 7
     9 7 3 8 1 2 1 4 6
     1 2 9 3 7 7 6 1 2]

C19=[w w w w z w w z w
     w z w w w w z w w
     z w z w w w w z w
     w w w z w z w w w
     z w w w z w z w z
     w w z w w w w w w
     w z w z w z w z w
     w w w w z w w w w
     w z w w w z w z w]

// Challanging 11

N20=[7 1 3 1 5 9 2 8 5
     3 5 1 1 9 4 7 1 2
     2 1 6 4 3 2 1 3 7
     6 1 8 1 2 5 4 5 1
     2 6 7 3 8 4 2 1 5
     1 9 4 7 4 2 6 3 8
     9 3 9 2 2 8 1 7 4
     9 2 4 5 7 1 8 6 3
     4 8 4 4 1 7 4 2 4]

C20=[w z w w w w w w z
     w w w z w z w z w
     z w w w z w z w w
     w z w z w w w z w
     w w w w w w z w w
     w w z w w z w z w
     z w w w z w w w w
     w w z w w w w w w
     z w w z w w z w z]

// Extreme 10
// in Extreme is backtracking haast onvermijdelijk

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

// Extreme 11

N22=[4 6 7 8 1 6 5 1 3
     3 4 3 1 9 3 7 5 6
     1 2 9 1 5 3 1 2 8
     9 6 3 2 1 5 8 3 4
     1 7 1 5 2 4 2 9 2
     5 3 4 5 8 1 9 2 6
     8 8 1 4 7 3 6 3 9
     2 8 5 9 4 7 4 6 1
     8 1 1 3 4 1 2 1 5]

C22=[w z w w z w w w w
     w w z w w z w w z
     w z w z w w z w w
     w w w w w w w z w
     z w z w z w z w w
     w w w z w w w z w
     w z w w w z w w w
     w w w w z w w w w
     z w z w w z w z w]

