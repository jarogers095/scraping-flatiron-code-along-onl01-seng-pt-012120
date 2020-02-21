require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  
  def get_page()
    return Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  
  def get_courses()
    return self.get_page().css(".post")
  end
  
  def make_courses()
    get_courses().each do |course|
      a_course = Course.new()
      a_course.title = course.css("h2").text
      a_course.schedule = course.css(".date").text
      a_course.description = course.css("p").text
    end
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

Scraper.new.print_courses

