lines = File.readlines(ARGV[0])
lines.each{|line|
#  if md=line.match(Regexp.new("\\A\\\\ChartElementTwo"))
  if md=line.match(/\A\\ChartElementTwo/)
    p md
  end
}
