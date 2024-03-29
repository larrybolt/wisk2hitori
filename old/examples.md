# Examples
- [Mathematics and Sudokus, techniques](http://www.math.cornell.edu/~mec/Summer2009/meerkamp/Site/Introduction.html)
- [A Matlab-based sudoku solver](http://www2.mathematik.hu-berlin.de/~pevans/personal/sudoku/)
- [Differences between Scilab and Mathlab](http://pages.cs.aueb.gr/~yiannisk/aps-06/SCILAB_HELP/matlabvsscilab_html.htm)
- [Thoughts on developing a SUDOKU solver and a MATLAB implementation of one](https://sites.google.com/site/edmarkovich2/matlab_doku)
- [Convert Mathlab files to Scilab](http://help.scilab.org/docs/5.5.2/en_US/mfile2sci.html)

## Solving Sudoku Using Recursive Backtracking
```Matlab
function X = sudoku(X) 
% SUDOKU  Solve Sudoku using recursive backtracking. 
%   sudoku(X), expects a 9-by-9 array X. 
 % Fill in all “singletons”. 
 % C is a cell array of candidate vectors for each cell. 
 % s is the first cell, if any, with one candidate. 
 % e is the first cell, if any, with no candidates. 
 [C,s,e] = candidates(X); 
 while ~isempty(s) && isempty(e) 
    X(s) = C{s}; 
    [C,s,e] = candidates(X); 
 end 
 % Return for impossible puzzles. 
 if ~isempty(e) 
    return 
 end 
 % Recursive backtracking. 
 if any(X(:) == 0) 
    Y = X; 
    z = find(X(:) == 0,1);    % The first unfilled cell. 
    for r = [C{z}]            % Iterate over candidates. 
       X = Y; 
       X(z) = r;              % Insert a tentative value. 
       X = sudoku(X);         % Recursive call. 
       if all(X(:) > 0)       % Found a solution. 
          return 
       end 
     end 
   end 
% ------------------------------ 
   function [C,s,e] = candidates(X) 
      C = cell(9,9); 
      tri = @(k) 3*ceil(k/3-1) + (1:3); 
      for j = 1:9 
         for i = 1:9 
            if X(i,j)==0 
               z = 1:9; 
               z(nonzeros(X(i,:))) = 0; 
               z(nonzeros(X(:,j))) = 0; 
               z(nonzeros(X(tri(i),tri(j)))) = 0; 
               C{i,j} = nonzeros(z)’; 
            end 
         end 
      end 
 L = cellfun(@length,C);   % Number of candidates. 
 s = find(X==0 & L==1,1); 
 e = find(X==0 & L==0,1); 
 end % candidates 
end % sudoku
```
source: [MathWorks: Solving Sudoku with MATLAB](http://nl.mathworks.com/company/newsletters/articles/solving-sudoku-with-matlab.html) 

## MATLAB Sudoku Solver
```Matlab
function S = sodoku(M,S)
%[S,Mout] = sodoku(M,[S])
%
%A recursive program that solves 'sodoku' puzzles.
%
%Inputs:  M  partially filled 9x9 matrix with zeros in 'blank' cells
%         S  list of solutions (only used during recursive calls)
%
%Outputs: S  list of solutions
%
%Example:
%
%M = [0,0,1,9,0,0,0,0,8;6,0,0,0,8,5,0,3,0;0,0,7,0,6,0,1,0,0;...
%     0,3,4,0,9,0,0,0,0;0,0,0,5,0,4,0,0,0;0,0,0,0,1,0,4,2,0;...
%     0,0,5,0,7,0,9,0,0;0,1,0,8,4,0,0,0,7;7,0,0,0,0,9,2,0,0];
%
%S = sodoku(M)
%
%Written by G.M. Boynton, 6/3/05

%If this is the first call, then zero out the solution matrix
if ~exist('S')
    S = zeros([size(M),0]);
end

%find the first blank cell, or zero
firstId = min(find(M(:)==0));
if isempty(firstId)  %If there aren't any zeros, then we have a solution!
    S(:,:,size(S,3)+1) = M;  %save it
else %calculate the list of all valid numbers that can go into this cell
    [i,j] = ind2sub([9,9],firstId);
    for k=1:9  %loop through all 9 possibilities
        ii = (ceil(i/3)-1)*3+1;
        jj = (ceil(j/3)-1)*3+1;
        mm = M(ii:ii+2,jj:jj+2); %these are the indices into the 3x3 block containing that cell
        if sum(M(i,:)==k)==0 & sum(M(:,j)==k)==0 & sum(mm(:)==k)==0  %OK for column, row, and 3x3 block
            M(i,j) = k;  %put this number in,
            S = sodoku(M,S); %and call this function recursively!
        end
    end
end
```

[source](http://www.mathworks.com/matlabcentral/fileexchange/8083-matlab-sudoku-solver)

## Sudoku solver in C
```C
#include "stdio.h"
int rec_sudoku(int (&mat)[9][9],int depth)
{
    int sol[9][9][10]; //for eliminating
    if(depth == 0) return 1;
    for(int i=0;i<9;i++)
    {
        for(int j=0;j<9;j++)
        {
            sol[i][j][9]=9;
            for(int k=0;k<9;k++)
            {
                if(mat[i][j]) sol[i][j][k]=0;
                else sol[i][j][k]=1;
            }
        }
    }
    for(int i=0;i<9;i++)
    {
        for(int j=0;j<9;j++)
        {
            if(mat[i][j] == 0) continue;
            for(int k=0;k<9;k++)
            {
                if(sol[i][k][mat[i][j]-1])
                {
                    if(--sol[i][k][9]==0) return 0;
                    sol[i][k][mat[i][j]-1]=0;
                }
                if(sol[k][j][mat[i][j]-1])
                {
                    if(--sol[k][j][9]==0) return 0;
                    sol[k][j][mat[i][j]-1]=0;
                }
            }
            for(int k=(i/3)*3;k<(i/3+1)*3;k++)
            {
                for(int kk=(j/3)*3;kk<(j/3+1)*3;kk++)
                {
                    if(sol[k][kk][mat[i][j]-1])
                    {
                        if(--sol[k][kk][9]==0) return 0;
                        sol[k][kk][mat[i][j]-1]=0;
                    }
                }
            }
        }
    }
    for(int c=1;c<=9;c++)
    {
        for(int i=0;i<9;i++)
        {
            for(int j=0;j<9;j++)
            {
                if(sol[i][j][9] != c) continue;
                for(int k=0;k<9;k++)
                {
                    if(sol[i][j][k] != 1) continue;
                    mat[i][j]=k+1;
                    if(rec_sudoku(mat,depth-1)) return 1;
                    mat[i][j]=0;
                }
                return 0;
            }
        }
    }
    return 0;
}
int main(void)
{
    int matrix[9][9] =
    {
        {1,0,0,0,0,7,0,9,0},
        {0,3,0,0,2,0,0,0,8},
        {0,0,9,6,0,0,5,0,0},
        {0,0,5,3,0,0,9,0,0},
        {0,1,0,0,8,0,0,0,2},
        {6,0,0,0,0,4,0,0,0},
        {3,0,0,0,0,0,0,1,0},
        {0,4,0,0,0,0,0,0,7},
        {0,0,7,0,0,0,3,0,0}
    };
    int d=0;
    for(int i=0;i<9;i++) for(int j=0;j<9;j++) if(matrix[i][j] == 0) d++;
    if(rec_sudoku(matrix,d)==0)
    {
        printf("no solution");
        return 0;
    }
    for(int i=0;i<9;i++)
    {
        for(int j=0;j<9;j++)
        {
            printf("%i ",matrix[i][j]);
        }
        printf("\n");
    }
    return 1;
}
```
[stackoverflow questions, also has other solutions](http://stackoverflow.com/questions/4514994/sudoku-solver-evaluation-function/4515064#4515064)
