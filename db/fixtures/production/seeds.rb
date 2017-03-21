5.times do |i|
  Year.seed do |s|
    s.id = i
    s.date = Date.new(2016 + i, 1, 1)
  end
end

5.times do |year_id|
  12.times do |i|
    Month.seed do |s|
      s.id = i + year_id * 12
      s.year_id = year_id
      s.date = Date.new(2016 + year_id, i + 1, 1).months_since(3)
    end
  end
end
