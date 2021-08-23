DIR_L="/home/AlbertChen/action/rt/first"
@path=[DIR_L,]

def look_dir(dx)
  depth=@path.size
  dx.each_child{|x|
    if File.directory?(@path.join('/') + "/#{x}")
      @path << x
#      p "this is a dir:#{@path}"
      depth.times{ print '─'}
      print ' '
      p @path[-1]
      Dir.open(@path.join('/')){ |sub_dir|
        look_dir(sub_dir)
      }
    else
      depth.times{ print ' '}
      print '├'
      3.times{ print '─'}
      p "#{x}"
    end
  }
  @path.slice!(-1)
  #if $path.size != 1

end

Dir.open(DIR_L) do |dr|
  @path=[DIR_L,]
  look_dir(dr)
end

=begin

def get_file_list(path)
  Dir.entries(path).each do |sub|

    if sub != '.' && sub != '..'
      p "+++#{path}++#{sub}+++++"
      if File.directory?("#{path}/#{sub}")
        #puts "[#{sub}]"
        get_file_list("#{path}/#{sub}")
      else
        #puts "  |--#{sub}"
      end
    end
  end
end

get_file_list(DIR_L)
=end
