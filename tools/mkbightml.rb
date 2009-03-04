# mkbightml.rb
require 'BlueCloth'
require 'easy_ebook'
include EasyEBook

big_md = IO.read('../README.md') + "\n\n"
head = IO.read('./head.erb')

Dir.glob("../md/*.md").each{|file| big_md << "\n\n<br><br><hr color=green>\n\n" \
                                          << "<a name='#{file[6..-1]}'></a>\n\n" \
                                          << IO.read(file) << "\n\n"}

b = BlueCloth.new big_md

template = "<html><head>"
template << "#{head}</head><body><div id='content'>" \
         << b.to_html.gsub(/<code>/, '<code class="ruby">') \
         << "<div></body></html>"

open("../html/#{EBOOK}.html", 'w') do |f|
  template.each do |line|
    f.puts line.chomp == FLIP .. line.chomp == FLOP ? line.sub(PATH + '/md/', EBOOK + '.html#') : line
  end
end


