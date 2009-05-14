require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  should "be valid" do
    assert Match.new.valid?
  end
  
  should "be able to add a player through matches" do
    @player = Player.make
    @match = Match.make
  
    @match.players << @player
    assert @match.players.include?(@player)
  end
  
  context "with some games" do
    setup do
      @p1 = Player.make
      @p2 = Player.make
      @match = Match.make
      @g1 = Game.make :player => @p1, :match => @match, :round_1 => 6, :round_2 => 5, :handicap => 5
      @g2 = Game.make :player => @p2, :match => @match, :round_1 => 11, :round_2 => 11, :handicap => 0
    end
    
    should "have correct scores" do
      scores = @match.scores
      assert_equal [1,0], scores[@p1.id]
      assert_equal [11,11], scores[@p2.id]
    end
    
    should "have correct won_by for player1" do
      assert_equal [-10,-11], @match.won_by(@p1.id, @p2.id)
    end
    
    should "have correct won_by for player2" do
      assert_equal [10, 11], @match.won_by(@p2.id, @p1.id)
    end

		should "not error if handicap is nil" do
			@g2.destroy
			@g2 = Game.make :player => @p2, :match => @match, :round_1 => 11, :round_2 => 11, :handicap => nil
			sco = {}
			sco[@g1.id] = [1,0]
			sco[@g2.id] = [11,11]
			assert_nothing_thrown do
				@match.scores
			end
		end
    
  end
  
end
