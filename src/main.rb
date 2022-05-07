File.open(ARGV[0], "r") do |file|
  x = file.read().split
  y = x.length()
  
  y.times do |i|
    if x[i]=="log>"
      puts x[i+1]
    elsif x[i]=="log<"
      puts x[i-1]
    elsif x[i]=="rep"
      x[i]=x[i-1].gsub(x[i+1], x[i+2])
      x[i-1]=x[i]
      x[i+1]=x[i]
      x[i+2]=x[i]
    elsif x[i]=="newline"
      x[i]=="\n"
    end
  end
end


