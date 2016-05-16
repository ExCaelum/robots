require_relative '../test_helper'

class NewRobotTest < FeatureTest

  def test_user_sees_titles
    visit '/robots/new'

    assert page.has_content?('Create a new robot:')
  end

end
