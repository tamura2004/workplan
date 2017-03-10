require "gimei"

%w(G4 TL CF AS BP).each_with_index do |name, id|
  Rank.seed do |s|
    s.id = id
    s.name = name
  end
end

20.times do |id|
  User.seed do |s|
    s.id = id
    s.name = Gimei.kanji
    s.number = sprintf("%06d",rand(1000000))
    s.rank_id = rand(5)
    s.end_month = Date.new(2017,rand(12)+1,1)
  end
end

date = Date.today.beginning_of_month

12.times do |i|
  Month.seed do |s|
    s.id = i
    s.name = date.strftime("%m月")
    s.date = date

    date = date.next_month
  end
end
