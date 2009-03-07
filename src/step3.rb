# step3.rb
Riddles =<<-EOS
What letter is a drink? --> t
What has nothing but a head and a tail? --> coin
What is it that by losing an eye has nothing left but a nose? \
--> noise
EOS
Nums = (0..2).sort_by{rand}

Shoes.app :width => 400, :height => 400 do
  def set_riddle
    num = Nums.pop
    @q.text, = Riddles.to_a[num].split(' --> ')
  end
  
  @q = tagline '', :left => 20, :top => 130, :width => 360,
               :stroke => green
  @you = edit_line :left => 20, :top => 310, :width => 200
  button 'OK', :left => 225, :top => 310 do
    set_riddle
  end
end
  