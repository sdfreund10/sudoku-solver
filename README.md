# sudoku-solver

Someone challenged me to write a Sudoku Solver. So this is it.

This is a very simple and naive soduku puzzle solver. It can solve basic puzzles
that require only checking which values are already used in the row, columns,
and 3x3 squares. It can not do more advanced logic to solve more complex puzzles
and it does not ever "guess and check".

## Usage

To watch it attempt to solve some puzzles, open a ruby console, load up the
`lib` directory and type the `play_sudoku` command. It will attempt to play all
of the puzzles provided via [ProjectEuler.net][https://projecteuler.net] in
[problem 96][https://projecteuler.net/problem=96]
([link to file][https://projecteuler.net/project/resources/p096_sudoku.txt])

To input your own puzzles, initialize a `Puzzle` object with the `board` in a 
9x9 2-D array, with empty cells represented as `nil`. Call the `solve_board`
method on that instance and watch it try to solve the puzzle.