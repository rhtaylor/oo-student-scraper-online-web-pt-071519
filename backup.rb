doc = Nokogiri::HTML(open(url))
profile_hash = { }
personal = doc.css('.social-icon-container')
links = personal.css('a')

student_links = links.each do |y|
  handel = y.attribute('href').text
   array = handel.split('.com')
   ans = array[0]

   case ans
   when ans.include?("twitter")
      profile_hash[:twitter] = handel
   when ans.include?("linkedin")
     profile_hash[:linkedin] = handel
   when ans.include?("github")
     profile_hash[:github] = handel
  when ans.include?("flat")
      profile_hash[:blog] = handel
  end
profile_hash
end
