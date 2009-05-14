require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  should "be valid" do
    assert Player.new.valid?
  end
end
