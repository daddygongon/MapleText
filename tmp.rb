require 'fileutils'
dir=ARGV[0]
files = Dir.glob(File.join(dir,'*'))
p tex = Dir.glob(File.join(dir,'*.tex'))
files.each{|file|
  ishiki = File.basename(file)
  if tex.include?(File.join(dir,"#{ishiki}.tex"))
#    FileUtils.rm(File.join(dir,ishiki),:noop=>true,:verbose=>true)
    FileUtils.rm(File.join(dir,ishiki),:verbose=>true)
  end
}
