#!/usr/bin/env ruby

require 'getoptlong'
require 'pp'

opts = GetoptLong.new(
  ["-c", "--character", GetoptLong::REQUIRED_ARGUMENT],
  ["-o", "--output", GetoptLong::REQUIRED_ARGUMENT],
  ["-p", "--pcgen", GetoptLong::REQUIRED_ARGUMENT],
  ["-w", "--weapons-first-page", GetoptLong::REQUIRED_ARGUMENT],
  ["-C", "--complex-melee", GetoptLong::NO_ARGUMENT]
)

scriptdir = File.dirname(File.expand_path(__FILE__))
sheet = File.join(scriptdir, "character-sheet.xslt")

character = nil
output = File.expand_path("out.pdf")
pcgen = File.join(scriptdir, '..', 'pcgen')
weapons = 5
complex = false

opts.each do |opt, arg|
  case opt
  when '-c'
    character = File.expand_path(arg)
  when '-o'
    output = File.expand_path(arg)
  when '-p'
    pcgen = File.expand_path(arg)
  when '-w'
    weapons = arg
  when '-C'
    complex = true
  end
end

unless character
  puts "No character specified"
  exit 1
end

Dir.chdir(pcgen) do
  system(%Q{java -Dfirst.page.weapons=#{weapons} -Dcomplex.melee=#{complex} -jar pcgen.jar -E "#{sheet}" -c "#{character}" -o "#{output}"})
end

