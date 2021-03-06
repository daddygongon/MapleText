require 'kconv'
# make content.tex from directories.

content = ''

ARGV.each do |argv|
  dir_name = File.basename(argv)
  hiki_inLatex = dir_name + '/' + dir_name
  puts hiki_file = hiki_inLatex + '.tex'
  text = NKF.nkf('-w', File.read(hiki_file))
  ifDocument = false
  text.each_line do |line|
    case line
    when /\\begin\{document\}/
      ifDocument = true
    when /\\end\{document\}/
      ifDocument = false
    when /^\\input\{(.*)\}/
      content << "\\input\{" + dir_name + "/#{Regexp.last_match(1)}\} \n"
    else
      content << line if ifDocument
    end
  end
  tmp = dir_name + '/figures' + '/*.eps'
  Dir.glob(tmp).each do |file|
    p file
    #    system("cp #{file} ./figures")
  end
end
file1 = File.open('content.tex', 'w')
file1.print NKF.nkf('-s', content)
file1.close
