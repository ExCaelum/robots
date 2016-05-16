require_relative '../test_helper'

class RobotTest < Minitest::Test

  def setup
    @robot = Robot.new({name: "Robot",
                       city: "Denver",
                       state: "Colorado",
                       avatar: "random string",
                       birthdate: "24/02/1996",
                       date_hired: "21/03/2016",
                       department: "Development"})
  end

  def test_it_assigns_attributes_correctly
    assert_equal "Robot", @robot.name
    assert_equal "Denver", @robot.city
    assert_equal "Colorado", @robot.state
    assert_equal "random string", @robot.avatar
    assert_equal "24/02/1996", @robot.birthdate
    assert_equal "21/03/2016", @robot.date_hired
    assert_equal "Development", @robot.department
  end

  def test_it_has_age
    assert_equal 20, @robot.age
  end

end
