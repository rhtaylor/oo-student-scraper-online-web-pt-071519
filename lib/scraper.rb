require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  index_url = 'https://learn-co-curriculum.github.io/student-scraper-test-page/index.html'
  def self.scrape_index_page(index_url = 'https://learn-co-curriculum.github.io/student-scraper-test-page/index.html')
     student_hashs = []


     doc = Nokogiri::HTML(open(index_url))
    #  x = doc.css('.student-card')
    #  y = x.css('h4').css('.student-name').text
    #  x.first.css('h4').text
    #  x.first.css('a')[0].attribute('href').value = link
    #  x.first.css('card-text-container').css('.student-location').text
     scraped_data = doc.css('.student-card')
     y = scraped_data.css('a')
     #wow = y.scan(/com/i)

     binding.pry
     scraped_data.each do |student|

       student_hashs <<
     { :name =>  student.css('h4').text ,
       :location => student.css('.card-text-container').css('.student-location').text ,

       :profile_url => student.css('a')[0].attribute('href').value
       #"https://learn-co-curriculum.github.io/student-scraper-test-page/"# + student.css('a')[0].attribute('href').value

     }

   end
    student_hashs.each do |x|
      rl = x[:profile_url]
        url = "https://learn-co-curriculum.github.io/student-scraper-test-page/" + rl
     self.scrape_profile_page(url)
   end
   student_hashs
end

  def self.scrape_profile_page(url)

    doc = Nokogiri::HTML(open(url))
    profile_hash = { }
    abc = doc.css('.vitals-container')
    quote = abc.css('.vitals-container').css('.profile-quote').text.strip

    profile_hash[:profile_quote] = quote
    personal = doc.css('.social-icon-container')
    links = personal.css('a')
    bio = doc.css(".description-holder").css('p').text.strip
    profile_hash[:bio] = bio

    links.each do |y|

      handel = y.attribute('href').text

       array = handel.split('.com')
       ans = array[0]

       if ans.include?("twitter")
          profile_hash[:twitter] = handel
        elsif ans.include?("linkedin")
         profile_hash[:linkedin] = handel
       elsif ans.include?("github")
         profile_hash[:github] = handel
      #when ans.include?("flat")
    else
          profile_hash[:blog] = handel
      end

    end
    profile_hash
  end

end
