task :demo => :environment do
  
  Product.delete_all
  Product.create(:title => 'Philly Pretzel',
    :description => 
      %{<p>
          This is a Philly Pretzel.
        </p>},
    :image_url =>   '/images/pretzel.png',    
    :price => 1.50)
    
  # . . .
  Product.create(:title => 'Can of Coca Cola',
    :description =>
      %{<p>
          This is a can of Coca Cola.
        </p>},
    :image_url => '/images/cocacola.png',
    :price => 1.00)
  # . . .
  
  Product.create(:title => 'Can of Diet Coca Cola',
    :description =>
      %{<p>
          This is a can of Coca Cola.
        </p>},
    :image_url => '/images/dietcocacola.png',
    :price => 1.00)
  # . . .
  
  Product.create(:title => 'Can of Sprite',
     :description =>
       %{<p>
           This is a can of Sprite.
         </p>},
     :image_url => '/images/sprite.png',
     :price => 1.00)
   # . . .

  Product.create(:title => 'Bottle of Water',
    :description => 
      %{<p>
          This is a bottle of water.
        </p>},
    :image_url => '/images/water.png',
    :price => 1.00)

  # Venue.create(:name => 'Meiklejohn Stadim (you are here!)', :image_url => '/images/MStadium.png')
  # 
  # Venue.create(:name => 'Franklin Field', :image_url => '/images/FranklinField.png')
  # 
  # Venue.create(:name => 'Palestra', :image_url => '/images/Palestra.png')
  # 
  # Venue.create(:name => 'Detkin Lab', :image_url => '/images/Detkin.png')
  # 
  # Stand.create(:name => 'Home Stand', :location => 'Entrance Gate')
  # 
  # Stand.create(:name => 'Away Stand', :location => 'Entrance Gate')
  
  User.create(:name => 'Lindsey', :password => 'lindsey')
  
  User.create(:name => 'Jordan', :password => 'jordan')
  
  User.create(:name => 'Tosin', :password => 'tosin')
  
  User.create(:name => 'Adam', :password => 'adam')
  
end

