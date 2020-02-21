class Course
  @@courses = []
  attr_accessor(:title, :schedule, :description) 
  
  def initialize()
    @@courses << self
  end
  
  def self.all()
    return @@courses
  end
end

