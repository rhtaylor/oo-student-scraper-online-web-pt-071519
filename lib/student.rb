require_relative "./scraper.rb"

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hashs)
    student_hashs.each do |key, value|
      self.send(("#{key}="), value )
    end
  @@all << self
  end

  def self.create_from_collection(student_hashs)
      student_hashs.each do |x|
        Student.new(x)

      end
  end

  def add_student_attributes(profile_hash)

      profile_hash.each do |key, value|
        self.send( ("#{key}="), value)
        @@all << self
      end
    self
  end

  def self.all

  end
  def self.all
  @@all
end
end
