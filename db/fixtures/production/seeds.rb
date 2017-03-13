date = Date.today.beginning_of_month

24.times do |i|
  Month.seed do |s|
    s.id = i
    s.name = date.strftime("%m月")
    s.date = date

    date = date.next_month
  end
end
