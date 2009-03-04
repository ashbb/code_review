# step4.rb
Shoes.app :width => 400, :height => 400 do 
  stars = []
  10.times{|i| stars << star(100+ 30*i, 80, 12, 10, 7)}
  
  button 'OK', :left => 225, :top => 310 do
    s = stars[rand(10)]
    a = animate do |i|
      s.move s.left, s.top + i
      a.remove if s.top > 320
    end
  end
end