require_relative '../test_helper'

class NavbarTest < FeatureTest

  def test_robot_factory_link_works
    visit '/robots'
    click_link 'Robot Factory'

    assert_equal '/', current_path
  end

  # def test_robot_profile_link_works
  #   visit '/'
  #   click_link 'Robot Profiles'
  #
  #   assert_equal '/robots/view', current_path
  # end

  def test_robot_index_link_works
    visit '/'
    click_link 'Robot Index'

    assert_equal '/robots', current_path
  end

  def test_new_robot_link_works
    visit '/'
    click_link 'New Robot'

    assert_equal '/robots/new', current_path
  end
end
