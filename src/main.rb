File.open(ARGV[0], "r") do |file|
  x = file.read().split
  y = x.length()
  
  y.times do |i|
    if x[i]=="log>"
      puts x[i+1].gsub("::s::", " ")
    elsif x[i]=="log<"
      puts x[i-1].gsub("::s::", " ")
    elsif x[i]=="rep"
      x[i]=x[i-1].gsub(x[i+1], x[i+2])
      x[i-1]=x[i]
      x[i+1]=x[i]
      x[i+2]=x[i]
    elsif x[i]=="newline"
      x[i]="\n"
    elsif x[i]=="exit"
      exit()
    elsif x[i]=="forceExit"
      exit!()
    elsif x[i]=="cfile"
      x[i]=ARGV[0]
    end
  end
end

