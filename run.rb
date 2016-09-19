#!/usr/bin/env ruby

require 'getoptlong'

opts = GetoptLong.new(
  ["-c", "--character", GetoptLong::REQUIRED_ARGUMENT],
  ["-o", "--output", GetoptLong::REQUIRED_ARGUMENT],
  ["-p", "--pcgen", GetoptLong::REQUIRED_ARGUMENT],
  ["-w", "--weapons-first-page", GetoptLong::REQUIRED_ARGUMENT],
  ["-C", "--complex-melee", GetoptLong::NO_ARGUMENT],
  ["-u", "--unchained-monk", GetoptLong::NO_ARGUMENT]
)

scriptdir = File.dirname(File.expand_path(__FILE__))
sheet = File.join(scriptdir, "character-sheet.xslt")

character = nil
output = File.expand_path("out.pdf")
pcgen = File.join(scriptdir, '..', 'pcgen')
weapons = 5
complex = false
unchained_monk=false

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
  when '-u'
    unchained_monk = true
  end
end

unless character
  puts "No character specified"
  exit 1
end

Dir.chdir(pcgen) do
  cmd = []
  cmd << "java"
  cmd << "-Dfirst.page.weapons=#{weapons}"
  cmd << "-Dcomplex.melee=#{complex}"
  cmd << "-Dunchained.monk=#{unchained_monk}"
  cmd << "-jar pcgen.jar"
  cmd << "-E '#{sheet}'"
  cmd << "-c '#{character}'"
  cmd << "-o '#{output}'"

  cmd = cmd.join(' ')
  puts cmd
  system(cmd)
end

