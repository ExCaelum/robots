require_relative '../test_helper'

class DashboardTest < FeatureTest

  def test_user_sees_titles
    visit '/'

    assert page.has_content?("Welcome to the Robot Factory")
    assert page.has_content?("Statistical Data")
    assert page.has_content?("Average Age")
    assert page.has_content?("Departments")
    assert page.has_content?("Year Hired")
    assert page.has_content?("States")
    assert page.has_content?("Cities")
  end

  def test_statistical_data_is_correct
    robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})

    visit '/'

    assert page.has_content?("20")
    assert page.has_content?("1")
    assert page.has_content?("Denver")
    assert page.has_content?("Colorado")
    assert page.has_content?("2016")
    assert page.has_content?("Development")
  end

end
