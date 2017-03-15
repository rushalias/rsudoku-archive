require File.dirname(__FILE__) + '/sdk_position'


module SDK


class Puzzle

 def initialize (board) @board = board end

	def solved?
		find_unassigned_location == nil
	end

	def find_unassigned_location
		(0..8).each do |row| 
			(0..8).each do |column|
				if @board[row][column] == 0 
					return Position.new(row,column)
				end
			end
		end
		return nil;
	end

	def no_conflict(position, number)
		check_row(position,number) && 
		check_column(position,number) && 
		check_box(position,number)
	end

	def set_value(position, value)
		@board[position.r][position.c] = value
	end

	def solve_back
		# check to see if we are done
		position = find_unassigned_location
		return true unless position != nil
		(1..9).each do |number| 
			if (no_conflict(position,number))
				set_value(position,number)
				return true if (solve_back())
				set_value(position,0)
			end
		end
		return false
	end

	def display_board 
		puts"\n\n\n"
		(0..8).each do |row| 
			print "| "
			(0..8).each do |column|
				print "#{@board[row][column]} "
			end
			puts "|"
		end
		puts"\n\n\n"
	end

	def check_row(p,v)
		throw "shit has hit the fan" if v > 9 || v < 0
		!@board[p.r].include?(v)
	end

	def check_column(p,v)
		throw "shit has hit the fan" if v > 9 || v < 0
		col = []
		(0..8).each do |i|
			col <<  @board[i][p.c]
		end
		!col.include?(v)
	end

	def check_box(p,v)
		throw "shit has hit the fan" if v > 9 || v < 0
		list = []
		br = p.r/3 * 3
		bc = p.c/3 * 3
		(br..br+2).each do |ri|
			(bc..bc+2).each do |ci|
			  list << @board[ri][ci]
			end
		end
		!list.include?(v)
	end
end
end

