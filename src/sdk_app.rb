
require File.dirname(__FILE__) + '/sdk_puzzle'
require File.dirname(__FILE__) + '/sdk_position'


if __FILE__ == $0
puzzle = SDK::Puzzle.new(
[
[4, 5, 7, 3, 0, 1, 2, 6, 9 ], #3
[1, 6, 2, 5, 4, 9, 8, 7, 3 ],
[9, 3, 8, 2, 7, 6, 4, 5, 1 ],
[3, 7, 0, 8, 6, 2, 1, 9, 5 ],
[8, 2, 5, 9, 1, 7, 3, 4, 6 ],
[6, 1, 9, 4, 3, 5, 7, 2, 8 ],
[2, 4, 1, 6, 5, 8, 9, 3, 7 ],
[5, 8, 3, 0, 9, 4, 6, 1, 2 ], #7
[7, 9, 6, 1, 2, 0, 5, 8, 4 ]
] )

puzzle.display_board
solved = puzzle.solve_back
puts "solved => #{solved}"
puzzle.display_board

puzzle = SDK::Puzzle.new(
[
[4, 5, 7, 8, 0, 1, 2, 6, 9 ], #3
[1, 6, 2, 5, 4, 9, 8, 7, 3 ],
[9, 3, 8, 2, 7, 6, 4, 5, 1 ],
[3, 7, 0, 8, 6, 2, 1, 9, 5 ],
[8, 2, 5, 9, 1, 7, 3, 4, 6 ],
[6, 1, 9, 4, 3, 5, 7, 2, 8 ],
[2, 4, 1, 6, 5, 8, 9, 3, 7 ],
[5, 8, 3, 0, 9, 4, 6, 1, 2 ], #7
[7, 9, 6, 1, 2, 0, 5, 8, 4 ]
] )

puzzle.display_board
puzzle.solve_back
puts "solved => #{solved}"
puzzle.display_board



t0 = Time.now
puts "Start solving hardest puzzle @ #{t0}"
puzzle = SDK::Puzzle.new(
[
[8, 0, 0, 0, 0, 0, 0, 0, 0 ],
[0, 0, 3, 6, 0, 0, 0, 0, 0 ],
[0, 7, 0, 0, 9, 0, 2, 0, 0 ],
[0, 5, 0, 0, 0, 7, 0, 0, 0 ],
[0, 0, 0, 0, 4, 5, 7, 0, 0 ],
[0, 0, 0, 1, 0, 0, 0, 3, 0 ],
[0, 0, 1, 0, 0, 0, 0, 6, 8 ],
[0, 0, 8, 5, 0, 0, 0, 1, 0 ],
[0, 9, 0, 0, 0, 0, 4, 0, 0 ],
] )

puzzle.display_board
puzzle.solve_back
puts "solved => #{solved}"
puzzle.display_board
t1 = Time.now
puts "Solved by @ #{t1} in #{t1 - t0} seconds"



t0 = Time.now
puts "Start solving hardest puzzle @ #{t0}"
puzzle = SDK::Puzzle.new(
[
[0, 0, 0, 0, 0, 0, 0, 1, 0 ],
[0, 0, 0, 0, 0, 2, 0, 0, 3 ],
[0, 0, 0, 4, 0, 0, 0, 0, 0 ],
[0, 0, 0, 0, 0, 0, 5, 0, 0 ],
[4, 0, 1, 6, 0, 0, 0, 0, 0 ],
[0, 0, 7, 1, 0, 0, 0, 3, 0 ],
[0, 5, 0, 0, 0, 0, 2, 0, 0 ],
[0, 0, 0, 0, 8, 0, 0, 4, 0 ],
[0, 3, 0, 9, 1, 0, 0, 0, 0 ],
] )


puzzle = SDK::Puzzle.new(
[
[0, 0, 0, 0, 0, 0, 0, 1, 0 ],
[0, 0, 0, 0, 0, 2, 0, 0, 3 ],
[0, 0, 0, 4, 0, 0, 0, 0, 0 ],
[0, 0, 0, 0, 0, 0, 5, 0, 0 ],
[4, 0, 1, 6, 0, 0, 0, 0, 0 ],
[0, 0, 7, 1, 0, 0, 0, 0, 0 ],
[0, 5, 0, 0, 0, 0, 2, 0, 0 ],
[0, 0, 0, 0, 8, 0, 0, 4, 0 ],
[0, 3, 0, 9, 1, 0, 0, 0, 0 ],
] )
puzzle.display_board
puzzle.solve_back
puts "solved => #{solved}"
puzzle.display_board
t1 = Time.now
puts "Solved by @ #{t1} in #{t1 - t0} seconds"


end 

