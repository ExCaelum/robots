class Robot
  attr_reader :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department,
              :id,
              :age

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @city       = data[:city]
    @state      = data[:state]
    @avatar     = data[:avatar]
    @birthdate  = data[:birthdate]
    @date_hired = data[:date_hired]
    @department = data[:department]
    @age = get_age(birthdate)
  end

  def get_age(birthday)
    dob = Time.parse(birthday)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
