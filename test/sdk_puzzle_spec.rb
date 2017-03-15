require '../src/sdk_puzzle'

describe SDK::Puzzle do
  GAME_GRID = 
  [ 
    [4, 5, 7, 3, 8, 0, 2, 6, 0 ], 
    [0, 6, 0, 5, 4, 9, 8, 7, 3 ], 
    [9, 0, 8, 2, 7, 0, 4, 5, 1 ], 
    [3, 7, 0, 8, 6, 2, 1, 9, 5 ], 
    [8, 0, 5, 9, 1, 7, 3, 4, 6 ], 
    [6, 1, 9, 0, 0, 5, 0, 2, 8 ], 
    [2, 4, 1, 6, 0, 8, 9, 3, 0 ], 
    [5, 0, 0, 7, 9, 4, 6, 1, 2 ], 
    [7, 0, 6, 1, 2, 0, 5, 0, 4 ]  
  ]
  
  FULL_GRID =
  [
    [4, 5, 7, 3, 8, 1, 2, 6, 1 ], 
    [1, 6, 1, 5, 4, 9, 8, 7, 3 ], 
    [9, 1, 8, 2, 7, 1, 4, 5, 1 ], 
    [3, 7, 1, 8, 6, 2, 1, 9, 5 ], 
    [8, 1, 5, 9, 1, 7, 3, 4, 6 ], 
    [6, 1, 9, 1, 1, 5, 1, 2, 8 ], 
    [2, 4, 1, 6, 1, 8, 9, 3, 1 ], 
    [5, 1, 1, 7, 9, 4, 6, 1, 2 ], 
    [7, 1, 6, 1, 2, 1, 5, 1, 4 ]  
  ]
  
  def mclone(grid_to_clone)
    z = [] 
    grid_to_clone.each_with_index do |r,i| z << r.clone  end
    z
  end

  describe "#find_unassigned_location" do

    it "find a free position" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = puzzle.find_unassigned_location()
      position.should_not be_nil
      position.r.should == 0
      position.c.should == 5
    end

    it "grid is full, nothing to find" do
      puzzle = SDK::Puzzle.new(mclone(FULL_GRID))
      position = puzzle.find_unassigned_location()
      position.should be_nil
    end

  end

  describe "#solved?" do
    it "should return true on solvable puzzles" do 
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      puzzle.solve_back
      puzzle.solved?.should == true
    end

    it "should return false on unsolvable puzzles" do 
	zero_grid = z = (1..9).collect do  (1..9).collect do  1 end end
	zero_grid[0] = [ 0, 2, 3, 4, 5, 6, 7, 8, 9 ] 

      puzzle = SDK::Puzzle.new(zero_grid)
      puzzle.solve_back
      puzzle.solved?.should == false
    end
  end

  describe "#check_row" do
    
    it "return ture for acceptible value" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(0,7)
      puzzle.check_row(position,9).should  ==  true
    end
    
    it "return false for value already in the row" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(0,0)
      puzzle.check_row(position,5).should  ==  false 
    end

    it "raise error for invalid input" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(0,0)
      expect{ puzzle.check_row(position,99) }.to raise_error()
    end
    
  end

  describe "#check_column" do
    
    it "return ture for acceptible value" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(0,5)
      puzzle.check_column(position,3).should  ==  true 
    end
    
    it "return false for value already in the column" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(0,5)
      puzzle.check_column(position,2).should  ==  false 
    end

    it "raise error for invalid input" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(0,5)
      expect{ puzzle.check_column(position,99) }.to raise_error()
    end
  end
  
  describe "#check_box" do
    
    # 4, 5, 7
    # 0, 6, 0
    # 9, 0, 8
    it "return ture for acceptible value in (1,1)" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      (0..2).each do |r|
        (0..2).each do |c|
          position = SDK::Position.new(r,c)
          puzzle.check_box(position,3).should  ==  true 
        end
      end
    end
    
    # 4, 5, 7
    # 0, 6, 0
    # 9, 0, 8
    it "return false for invalid value in (1,1) box" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(2,2)
      puzzle.check_box(position,4).should  ==  false 
    end
    
    # 9, 3, 0
    # 6, 1, 2
    # 5, 0, 4
    it "return ture for acceptible value in (7,7)" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      (6..8).each do |r|
        (6..8).each do |c|
          position = SDK::Position.new(r,c)
          puzzle.check_box(position,8).should  ==  true 
        end
      end
    end
    
    # 9, 3, 0
    # 6, 1, 2
    # 5, 0, 4
    it "return false for invalid value in (7,7) box" do
      puzzle = SDK::Puzzle.new(mclone(GAME_GRID))
      position = SDK::Position.new(8,8)
      puzzle.check_box(position,9).should  equal  false 
    end

  end

  describe "#solve" do
	it "this will be done"
  end
end
