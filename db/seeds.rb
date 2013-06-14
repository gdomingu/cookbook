
require 'open-uri'
require 'rubygems'
require 'twilio-ruby'

["applesauce_spice_cake", "bourbon_mashed_sweet_potatoes", "ancho_chile_shrimp_and_pasta"].each do | x |
exrecipe_page = Nokogiri::HTML(open("http://www.simplyrecipes.com/recipes/#{x}/"))

exrecipe_title = exrecipe_page.css(".entry-header .fn").children[0].content
exrecipe_description = exrecipe_page.css(".recipe-description p").children[0].content

  if Recipe.create(:title => exrecipe_title, :description => exrecipe_description)
        twilio_client = Twilio::REST::Client.new(
          "grgregre",
          "c1gergrege"
       )
        twilio_client.account.sms.messages.create(
        :from => '+14156920586',
        :to => '+14152640084',
        :body => "Successfully added #{exrecipe_title}!"
       )
  end
end