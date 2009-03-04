#!/bin/env ruby
# mkmd.rb
# Create ../README.md and reference ../md/***.md files, if they do not exist.
require 'easy_ebook'
include EasyEBook

def mk_link i, num, name
  fname = num + '_' + name.gsub(/[\&\#\!\(\)\\\/\:\*\?\"\<\>\| ]/, '_') + '.md'
  open('../md/' + fname, 'w'){|f| f.puts name, '-' * name.length} unless File.exist?('../md/' + fname)
  line = num[3..4] == '00' ? i.to_s + '. ' : "\t- "
  line << "[#{name}](#{PATH + '/md/' + fname})"
end

open('../README.md', 'w') do |f|
  IO.read('./table_of_contents.txt').each do |line|
    if line[0].chr == '0'
      i, num, name = line[0,3].to_i, line[0,5], line[7..-2]
      line = line[6].chr == '#' ? (i.to_s << '. ' << name) : mk_link(i, num, name)
    end
    f.puts line
  end
end unless File.exist? '../README.md'


# Import source code ../src/***.rb and create links to ../img/***.png (or.jpg)
def read_src name
  IO.readlines('../src/' + name).collect{|c| "\t" + c}
end

def make_link name
  lines = []
  lines << "**#{name}**"
  lines << "\n"
  lines << "![#{name}](#{PATH.sub('/tree/', '/raw/')}/img/#{name})"
end

def make_page_link name
  fname = ''
  Dir.glob("../md/*.md").each{|f| fname = f[6..-1]  if f[6,5] == name}
  "[#{fname[6..-4]}](#{PATH + '/md/' + fname})"
end


Dir.glob("../md/*.md").each do |file|
  lines = IO.readlines(file)
  open(file, 'w') do |f|
    lines.each do |line|
      new_line = line
      line.sub(/^# *(.*\.rb)/){new_line = read_src($1)}
      line.sub(/^# *(.*\.(png|jpg))/){new_line = make_link($1)}
      line.sub(/^# *page *(prev|next|.*)/){new_line = make_page_link($1)}
      f.puts new_line
    end
  end
end
