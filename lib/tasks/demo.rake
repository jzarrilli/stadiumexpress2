task :demo => :environment do
  
  Product.delete_all
  Product.create(:title => 'Philly Cheesesteak',
    :description => 
      %{<p>
          This is a Philly Cheesesteak.
        </p>},
    :image_url =>   '/images/phillycheesesteak.jpg',    
    :price => 7.00)
    
  # . . .
  Product.create(:title => 'Hamburger',
    :description =>
      %{<p>
          This is a Hamburger.
        </p>},
    :image_url => '/images/hamburger.jpg',
    :price => 5.00)
  # . . .
  
  Product.create(:title => 'Cheeseburger',
     :description =>
       %{<p>
           This is a Cheeseburger.
         </p>},
     :image_url => '/images/hamburger.jpg',
     :price => 6.00)
   # . . .

  Product.create(:title => 'Salad',
    :description => 
      %{<p>
          This is a Salad.
        </p>},
    :image_url => '/images/salad.jpg',
    :price => 7.00)

  Venue.create(:name => 'Franklin Field')
  
  Venue.create(:name => 'Phillies Stadium')
  
  Venue.create(:name => 'Flyers Arena')
  
  Stand.create(:name => 'Stand 1', :location => 'Location 1')
  
  Stand.create(:name => 'Stand 2', :location => 'Location 2')
   
  Stand.create(:name => 'Stand 3', :location => 'Location 3')
  
  User.create(:name => 'Lindsey', :password => 'lindsey')
  
  User.create(:name => 'Jordan', :password => 'jordan')
  
  User.create(:name => 'Tosin', :password => 'tosin')
  
  User.create(:name => 'Adam', :password => 'adam')
  
end

