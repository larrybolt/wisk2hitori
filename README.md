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

There are thee kinds of techniques:
* techniques based on numbers, these should be ran first (#num)
* techniques based on the shading of cells. (#shading)
* techniques based on numbers and shading

Based on numbers can be done interchangebly, afterwards a portion of the cells
will have a certain shading, and the second kind of techniques will shading even
more cells.

Lastely there are more advanced techniques which I'm not sure yet how to implement.

the #shading techniques can be ran multiple times afterwards, based on previous
shading-techniques that were applied.

## Current status:

**done**
* 1 Searching for adjacent triplets #num
* 2 Square between a pair #num
* 3 Pair induction #num
* 7 Corner technique 1 #num
* 8 corder technique 2 #num
* 5 Un-shading around shaded squares #shading
* 4 Shading squares in rows and columns (is eigenlijk nr.1 van basic techniques) #shading

**todo**
* 6 Un-shading squares to avoid partitions #shading

[http://www.menneske.no/hitori/methods/eng/methodcnc.html](other source with techniques)
