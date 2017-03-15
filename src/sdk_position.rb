module SDK
	class Position
		attr_accessor :r, :c
		def initialize( row, column) 
			@r = row 
			@c = column 
		end

		def to_s
			puts "<<#{@r}, #{@c}>>"
		end

	end

end

