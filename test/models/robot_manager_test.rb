require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_id = robot_manager.create({name: "Robot",
                                     city: "Denver",
                                     state: "Colorado",
                                     avatar: "random",
                                     birthdate: "24/02/1996",
                                     date_hired: "21/03/2016",
                                     department: "Development"})
    robot = robot_manager.find(robot_id)

    assert_equal "Robot", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "random", robot.avatar
    assert_equal "24/02/1996", robot.birthdate
    assert_equal "21/03/2016", robot.date_hired
    assert_equal "Development", robot.department
    assert_equal robot_id, robot.id
  end

  def test_it_can_find_all_tasks
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

    robots = robot_manager.all

    assert_equal 2, robots.count
    assert_equal "Robot", robots.first.name
    assert_equal "Denver", robots.first.city
    assert_equal "Colorado", robots.first.state
    assert_equal "random", robots.first.avatar
    assert_equal "24/02/1996", robots.first.birthdate
    assert_equal "21/03/2016", robots.first.date_hired
    assert_equal "Development", robots.first.department
  end

  def test_it_can_find_a_task
    robot_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})

    robot = robot_manager.find(robot_id)

    assert_equal "Robot", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "random", robot.avatar
    assert_equal "24/02/1996", robot.birthdate
    assert_equal "21/03/2016", robot.date_hired
    assert_equal "Development", robot.department
  end

  def test_it_can_update
    robot_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robot_manager.update(robot_id, {name: "Parker"})
    robot = robot_manager.find(robot_id)

    assert_equal "Parker", robot.name
  end

  def test_it_can_destroy
    robot_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robots = robot_manager.all

    assert_equal 1, robots.count

    robot_manager.destroy(robot_id)
    robots = robot_manager.all

    assert_equal 0, robots.count
  end

  def test_it_can_find_average_age
    robot_1_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robot_2_id = robot_manager.create({name: "Jake",
                          city: "Los Angeles",
                          state: "California",
                          avatar: "Smelly",
                          birthdate: "13/02/1995",
                          date_hired: "25/08/2013",
                          department: "Repair"})

    robot_1 = robot_manager.find(robot_1_id)
    robot_2 = robot_manager.find(robot_2_id)
    average_age = robot_manager.average_age

    assert_equal 20, robot_1.age
    assert_equal 21, robot_2.age
    assert_equal 20.5, average_age
  end

  def test_it_can_find_robots_hired_each_year
    robot_1_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robot_2_id = robot_manager.create({name: "Jake",
                          city: "Los Angeles",
                          state: "California",
                          avatar: "Smelly",
                          birthdate: "13/02/1995",
                          date_hired: "25/08/2013",
                          department: "Repair"})
    robot_3_id = robot_manager.create({name: "Katie",
                          city: "Nairobi",
                          state: "Kenya",
                          avatar: "Adorable",
                          birthdate: "26/11/1996",
                          date_hired: "29/05/2016",
                          department: "Psychology"})

    assert_equal 1, robot_manager.hired(2013)
    assert_equal 2, robot_manager.hired(2016)
  end

  def test_it_can_show_departments
    robot_1_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robot_2_id = robot_manager.create({name: "Jake",
                          city: "Los Angeles",
                          state: "California",
                          avatar: "Smelly",
                          birthdate: "13/02/1995",
                          date_hired: "25/08/2013",
                          department: "Development"})
    robot_3_id = robot_manager.create({name: "Katie",
                          city: "Nairobi",
                          state: "Kenya",
                          avatar: "Adorable",
                          birthdate: "26/11/1996",
                          date_hired: "29/05/2016",
                          department: "Psychology"})
    assert_equal 1, robot_manager.dep("psychology")
    assert_equal 2, robot_manager.dep("development")
  end

  def test_it_can_find_states
    robot_1_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robot_2_id = robot_manager.create({name: "Jake",
                          city: "Los Angeles",
                          state: "California",
                          avatar: "Smelly",
                          birthdate: "13/02/1995",
                          date_hired: "25/08/2013",
                          department: "Repair"})
    robot_3_id = robot_manager.create({name: "Katie",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "Adorable",
                          birthdate: "26/11/1996",
                          date_hired: "29/05/2016",
                          department: "Psychology"})

    assert_equal 1, robot_manager.state("california")
    assert_equal 2, robot_manager.state("colorado")
  end

  def test_it_can_find_cities
    robot_1_id = robot_manager.create({name: "Robot",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "random",
                          birthdate: "24/02/1996",
                          date_hired: "21/03/2016",
                          department: "Development"})
    robot_2_id = robot_manager.create({name: "Jake",
                          city: "Denver",
                          state: "Colorado",
                          avatar: "Smelly",
                          birthdate: "13/02/1995",
                          date_hired: "25/08/2013",
                          department: "Repair"})
    robot_3_id = robot_manager.create({name: "Katie",
                          city: "Nairobi",
                          state: "Kenya",
                          avatar: "Adorable",
                          birthdate: "26/11/1996",
                          date_hired: "29/05/2016",
                          department: "Psychology"})

    assert_equal 1, robot_manager.city("nairobi")
    assert_equal 2, robot_manager.city("denver")
  end
end
