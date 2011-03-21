#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Product.delete_all
Product.create(:title => 'Philly Cheesesteak',
  :description => 
    %{<p>
        <em>The Philly Cheesesteak</em> The cheesesteak was developed in the early 20th century 
        "by combining frizzled beef, onions, and cheese in a small loaf of bread," according to a 
        1987 exhibition catalog published by the Library Company of Philadelphia and the Historical Society 
        of Pennsylvania.
      </p>},
  :image_url =>   '/images/phillycheesesteak.jpg',    
  :price => 8.55)
# . . .
Product.create(:title => 'Le Hamburger',
  :description =>
    %{<p>
        Le Royale or Le Big Mac
      </p>},
  :image_url => '/images/hamburger.jpg',
  :price => 5.85)
# . . .

Product.create(:title => 'Salad',
  :description => 
    %{<p>
        <em>Caesar's</em> the healthy option
      </p>},
  :image_url => '/images/salad.jpg',
  :price => 6.05)
