# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def setup_match(match)
    returning(match) do |m|
      m.games.build if m.games.empty?
      m.games.build if m.games.size < 2
      # m.games.build :round => 2 if m.games.size < 3
      # m.games.build :round => 2 if m.games.size < 4
      # m.games.build :round => 3 if m.games.size < 5
      # m.games.build :round => 3 if m.games.size < 6
    end
  end
end
