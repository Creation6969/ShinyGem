File.open(ARGV[0], "r") do |file|
  x = file.read().split
  y = x.length()
  vars = []
  
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
    elsif x[i]=="dup"
      x[i+2]=x[i+1]
    elsif x[i]=="empty"
      # nothing!
    elsif x[i]=="shift"
      x[i]=x[i+1]
    elsif x[i]=="log<<"
      puts x[i-3].gsub("::s::", " ")
    elsif x[i]=="="
      vars.push("#{x[i-1]} #{x[i+1]}")
    elsif x[i]=="var"
      v = vars.length()
      v.times do |ind|
        cv = vars[ind].split
        if cv[0]==x[i+1]
          x[i]=cv[1]
          x[i+1]=x[i]
        end
      end
    end
  end
end

