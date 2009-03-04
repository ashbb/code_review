# step2.rb
Shoes.app :width => 400, :height => 400 do
  title 'Title', :align => 'center'
  line 10, 55, 380, 55, :strokewidth => 10
  subtitle 'Subtitle1', :left => 10, :top => 200
  subtitle 'Subtitle2', :left => 10, :top => 250
  10.times{|i| star(100+ 30*i, 80, 12, 10, 7)}
end
