# _why_sample13.rb
Shoes.app do
  @shape = star :points => 5
  motion do |left, top|
    @shape.move left, top
  end
end