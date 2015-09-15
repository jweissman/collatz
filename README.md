# collatz

## Description

Compute the hailstone sequence.

## Features
 
  - Compute hailstone sequences
  - Narrate the sequence (indicate primality or factors)

## Examples

   ```ruby
   be pry -r collatz  
   [1] pry(main)> include Collatz::Sequence
   => Object
   [2] pry(main)> collatz 1024
   => [1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1]
   [3] pry(main)> collatz 513
   => [513, 1540, 770, 385, 1156, 578, 289, 868, 434, 217, 652, 326, 163, 490, 245, 736, 368, 184, 92, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8, 4, 2, 1]
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

## Copyright

Copyright (c) 2015 Joseph Weissman

See LICENSE.txt for details.
