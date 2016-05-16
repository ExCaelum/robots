require_relative '../test_helper'

class IndexTest < FeatureTest

  def test_robot_index_sees_all_robots
    robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robot_manager.create({name: "Jake",
                          city: "Los Angeles",
                          state: "California",
                          avatar: "Smelly",
                          birthdate: "13/02/1995",
                          date_hired: "25/08/2013",
                          department: "Repair"})

    visit '/robots'

    assert page.has_content?("Robot")
    assert page.has_content?("Jake")
  end
end
