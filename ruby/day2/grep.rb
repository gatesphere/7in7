def grep (pattern, file)
  IO.foreach(file) do |line|
    if (line =~ pattern) then
      puts line
    end
  end
end

