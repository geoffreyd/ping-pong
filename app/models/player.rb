class Player < ActiveRecord::Base
  has_many :matches, :through => :games
  has_many :games
  
  def handicap(vs)
    vs_matches = matches.reject { |m| !m.players.include? vs }
    differences = []
    vs_matches.each do |m|
      diffs = m.won_by self.id, vs.id
      differences << Float(diffs.inject {|sum, elem| sum += elem }) / Float(diffs.length) if !diffs.empty?
    end
    # logger.debug "******"
    # logger.debug differences.inspect
    if differences.empty?
      "No Data"
    else
      diff_sum = Float(differences.inject {|sum, elem| sum += elem })
      ret = (diff_sum / Float(differences.length)).floor
      ret > 0 ?  0 : ret.abs
    end
  end
end
