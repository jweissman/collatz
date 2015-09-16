# collatz

   ![5-degree Collatz Graph](https://raw.github.com/jweissman/collatz/master/img/collatz-5.png)

## Description

Compute the [hailstone sequence](https://en.wikipedia.org/wiki/Collatz_conjecture).

## Features
 
  - Compute hailstone sequences
  - Narrate a sequence (indicating primality or factors of each term)
  - Compute Collatz graphs
  - Render graphs as images with graphviz

## Examples

   ```ruby
   $ bundle exec pry -r collatz  
   [1] pry(main)> include Collatz
   => Object
   [2] pry(main)> hailstone 1024
   => [1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1]
   [3] pry(main)> hailstone 513
   => [513, 1540, 770, 385, 1156, 578, 289, 868, 434, 217, 652, 326, 163, 490, 245, 736, 368, 184, 92, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]
  ```

   The narration of a sequence indicates primes with an asterisk (`*`).

   ```ruby
   [4] pry(main)> narrate 4
   4 [[2, 2]]
   2 *
   1 []
   => [4, 2, 1]

   [5] pry(main)> narrate 5
   5 *
   16 [[2, 4]]
   8 [[2, 3]]
   4 [[2, 2]]
   2 *
   1 []
   => [5, 16, 8, 4, 2, 1]
   ```

   A slightly longer example. Note output will be colorized: primes in white, other odd numbers in yellow, and even numbers in blue. 

   ```ruby
   [6] pry(main)> narrate 50
   50 [[2, 1], [5, 2]]
   25 [[5, 2]]
   76 [[2, 2], [19, 1]]
   38 [[2, 1], [19, 1]]
   19 *
   58 [[2, 1], [29, 1]]
   29 *
   88 [[2, 3], [11, 1]]
   44 [[2, 2], [11, 1]]
   22 [[2, 1], [11, 1]]
   11 *
   34 [[2, 1], [17, 1]]
   17 *
   52 [[2, 2], [13, 1]]
   26 [[2, 1], [13, 1]]
   13 *
   40 [[2, 3], [5, 1]]
   20 [[2, 2], [5, 1]]
   10 [[2, 1], [5, 1]]
   5 *
   16 [[2, 4]]
   8 [[2, 3]]
   4 [[2, 2]]
   2 *
   1 []
   => [50, 25, 76, 38, 19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1]
   ```

   Inversely let's compute the Collatz graph out to degree ten:

   ```ruby
   [6] pry(main)> collatz_graph 10
   => {1=>[2],
    2=>[4],
    4=>[1, 8],
    8=>[16],
    16=>[5, 32],
    5=>[10],
    32=>[64],
    10=>[3, 20],
    64=>[21, 128],
    3=>[6],
    20=>[40],
    21=>[42],
    128=>[256],
    6=>[12],
   ```

   Render this graph as a png (or svg, etc).
   
   ```ruby
   [8] pry(main)> visualize 15, 'png'
   => #<Graph:0x007f9ddbaae580
    @edge_attribs=[],
    @edges=
     {1=>{2=>#<struct Graph::Edge graph=#<Graph:0x007f9ddbaae580 ...>, attributes=[]>},
      2=>{4=>#<struct Graph::Edge graph=#<Graph:0x007f9ddbaae580 ...>, attributes=[]>},
      4=>{1=>#<struct Graph::Edge graph=#<Graph:0x007f9ddbaae580 ...>, attributes=[]>, 8=>#<struct Graph::Edge graph=#<Graph:0x007f9ddbaae580 ...>, attributes=[]>},
      8=>{16=>#<struct Graph::Edge graph=#<Graph:0x007f9ddbaae580 ...>, attributes=[]>},
      16=>{5=>#<struct Graph::Edge graph=#<Graph:0x007f9ddbaae580 ...>, attributes=[]>, 32=>#<struct Graph::Edge graph=#<Graph:0x007f9ddbaae580 ...>, attributes=[]>},
     ...
   ```

   This creates a dotfile `collatz-15.dot` and an image `collatz-15.png` which looks like this...

   ![15-degree Collatz Graph](https://raw.github.com/jweissman/collatz/master/img/collatz-15.png)

   [A 30-degree Collatz graph renders out at 113737 × 3035 pixels](https://raw.github.com/jweissman/collatz/raw/master/img/collatz-30.png) (15M).

## Copyright

Copyright (c) 2015 Joseph Weissman

See LICENSE.txt for details.
