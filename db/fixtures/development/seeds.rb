require "gimei"

2.times do |i|
  Year.seed do |s|
    s.id = i
    s.date = Date.new(2017 + i, 1, 1)
  end
end

2.times do |year_id|
  12.times do |i|
    Month.seed do |s|
      s.id = i + year_id * 12
      s.year_id = year_id
      s.date = Date.new(2017 + year_id, i + 1, 1).months_since(3)
    end
  end
end

2.times do |i|
  dept_name = Gimei.last.katakana
  Dept.seed do |s|
    s.id = i
    s.number = i
    s.name = "#{dept_name}部"
  end
  2.times do |j|
    group_id = i * 2 + j
    group_name = Gimei.last.katakana
    Group.seed do |s|
      s.id = group_id
      s.number = group_id
      s.dept_id = i
      s.name = "#{dept_name}部#{group_name}課"
    end
  end
end

%w(PM TL CF AS BP).each_with_index do |name, id|
  Rank.seed do |s|
    s.id = id
    s.number = id
    s.unit_price = 1000 + 1000 * id
    s.name = name
  end
end

20.times do |id|
  User.seed do |s|
    s.id = id
    s.name = Gimei.kanji
    s.number = sprintf("%06d",rand(1000000))
    s.rank_id = rand(5)
    s.group_id = rand(4)
  end
end

3.times do |i|
  System.seed do |s|
    s.id = i
    s.number = "#{rand(10)}-#{rand(100)}"
    s.name = "#{Gimei.last.kanji}システム"
  end
end

varb = %w(構築 更改 制度対応 廃棄対応 機能追加 性能改善)

3.times do |i|
  Project.seed do |s|
    s.id = i
    s.number = rand(10000000) * 1000
    s.name = "#{Gimei.last.kanji}システムの#{varb.sample}"
  end
end

%w(企画 検討 設計 開発 検証 移行 運用 廃棄).each_with_index do |name, id|
  Step.seed do |s|
    s.id = id
    s.name = name
  end
end

params = 400.times.map{
  [rand(24), rand(20)]
}.sort.uniq

params.each_with_index do |arr, id|
  month_id, user_id = *arr
  Work.seed do |s|
    s.id = id
    s.month_id = month_id
    s.user_id = user_id
    s.power = rand(10) * 10 + 10
  end
end

params = 10.times.map{
  [rand(3), rand(4), rand(3)]
}.uniq.sample(50)

params.each_with_index do |arr, id|
  project_id, group_id, system_id = *arr
  Order.seed do |s|
    s.id = id
    s.project_id = project_id
    s.group_id = group_id
    s.system_id = system_id
    s.price = rand(10000000)
  end
end

params = 400.times.map{
  [rand(5), rand(5), rand(24)]
}.uniq

params.each_with_index do |arr, id|
  order_id, rank_id, month_id = *arr
  Cost.seed do |s|
    s.id = id
    s.order_id = order_id
    s.rank_id = rank_id
    s.month_id = month_id
    s.power = rand(30) * 10 + 10
  end
end

params = 400.times.map{
  [rand(5), rand(20), rand(24)]
}.uniq

params.each_with_index do |arr, id|
  order_id, user_id, month_id = *arr
  Assign.seed do |s|
    s.id = id
    s.order_id = order_id
    s.user_id = user_id
    s.month_id = month_id
    s.power = rand(30) * 10 + 10
  end
end



