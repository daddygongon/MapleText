require 'kconv'

file=File.read(ARGV[0])
utf=NKF.nkf("-Sw",file)
utf.each_line do |line|
  nline=line.gsub(/\&/,"||")
  print nline
end

