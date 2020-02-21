require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  
  def get_page()
    return Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses()
    return get_page().css("#course-grid .posts-holder")
  end
  
  def make_courses()
    get_courses().each do |course|
      a_course = Course.new()
      a_course.title = course.css(h2).text.strip
      a_course.schedule = course.css(.date).text.strip
      a_course.description = course.css()
  end
  
  
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end



