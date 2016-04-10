# Hitori solving using scilab
[![Example of a hitori](http://www.conceptispuzzles.com/picture/27/1219.gif)](http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques)
[![Example of a solved hitori](http://www.conceptispuzzles.com/picture/27/1220.gif)](http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques)

## Code style
Code is written modular, so every technique is contained in a funciton.
This allows for easier writing of tests, and test driven development.

It may seem as it's slower to write the code this way, however the overhead
created is neglectible.

## Techniques
The first set of techniques is based on:
[http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques](http://www.conceptispuzzles.com/index.aspx?uri=puzzle/hitori/techniques)

There are two kinds of techniques:
* techniques based on numbers, these should be ran first (#num)
* techniques based on the color of other cells. (#color)

Based on numbers can be done interchangebly, afterwards a portion of the cells
will have a certain color, and the second kind of techniques will color even
more cells.

Lastely there are more advanced techniques which I'm not sure yet how to implement.

the #color techniques can be ran multiple times afterwards, based on previous
color-techniques that were applied.

## Current status:

**done**
* 1 Searching for adjacent triplets #num
* 2 Square between a pair #num
* 3 Pair induction #num
* 5 Un-shading around shaded squares #color
* 7 Corner technique 1 #num

**todo**
* 4 Shading squares in rows and columns (is eigenlijk nr.1 van basic techniques) #color
* 6 Un-shading squares to avoid partitions #color
* 8 corder technique 2 #num
