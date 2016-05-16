class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    table.insert(robot)
  end

  def all
    table.to_a.map {|robot| Robot.new(robot)}
  end

  def raw_robot(id)
    locate_robot(id).to_a.first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    locate_robot(id).update(robot)
  end

  def destroy(id)
    locate_robot(id).delete
  end

  def delete_all
    table.delete
  end

  def average_age
    robot_ages = robots.map {|robot| robot.age}
    (robot_ages.reduce(:+).to_f / (robot_ages.count.to_f)).round(2)
  end

  def years_hired
    robots.map { |robot| robot.date_hired[-4..-1]}.uniq.sort
  end

  def departments
    robots.map {|robot| robot.department}.uniq.sort
  end

  def cities
    robots.map {|robot| robot.city}.uniq.sort
  end

  def states
    robots.map {|robot| robot.state}.uniq.sort
  end

  def hired(year)
    robots.find_all {|robot| robot.date_hired[-4..-1].to_i == year.to_i}.count
  end

  def dep(department)
    robots.find_all {|robot| robot.department.downcase == department.downcase}.count
  end

  def city(city)
    robots.find_all {|robot| robot.city.downcase == city.downcase}.count
  end

  def state(state)
    robots.find_all {|robot| robot.state.downcase == state.downcase}.count
  end

  private

  def table
    database.from(:robots).order(:id)
  end

  def locate_robot(id)
    table.where(id: id)
  end

  def robots
    all
  end
end
