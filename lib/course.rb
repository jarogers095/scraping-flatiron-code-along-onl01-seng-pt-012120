class Course
  @@courses = []
  attr_accessor(:title, :schedule, :description) 
  
  def initialize(title, schedule, description)
    @title = title
    @schedule = schedule
    @description = description
    @@courses << self
  end
  
  def self.all()
    return @@courses
  end
end

