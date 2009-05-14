class Match < ActiveRecord::Base
  has_many :games, :dependent => :destroy
  has_many :players, :through => :games
  
  accepts_nested_attributes_for :games
  
  def scores
    scores = {}
    self.games.each do |game|
			game.handicap = 0 if game.handicap.nil?
      scores[game.player_id] ||= []
      scores[game.player_id] << game.round_1 - game.handicap if !game.round_1.blank?
      scores[game.player_id] << game.round_2 - game.handicap if !game.round_2.blank?
      scores[game.player_id] << game.round_3 - game.handicap if !game.round_3.blank?
    end
    scores
  end
  
  def won_by(p1, p2)
    s = self.scores
    # p1 = players.first.id
    # p2 = players.last.id
    diffs = []
    # logger.debug "**********##"
    # logger.debug s.inspect
    # logger.debug p2.inspect
    # logger.debug p1.inspect
    diffs << (s[p1][0] - s[p2][0]) if !s[p1][0].blank? && !s[p2][0].blank?
    diffs << (s[p1][1] - s[p2][1]) if !s[p1][1].blank? && !s[p2][1].blank?
    diffs << (s[p1][2] - s[p2][2]) if !s[p1][2].blank? && !s[p2][2].blank?
    # logger.debug diffs.inspect
    diffs
  end
  
end
