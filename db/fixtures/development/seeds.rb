require "gimei"
require "pp"

date = Date.today.beginning_of_month

24.times do |i|
  Month.seed do |s|
    s.id = i
    s.name = date.strftime("%m月")
    s.date = date

    date = date.next_month
  end
end

2.times do |i|
  dept_name = Gimei.last.katakana
  Dept.seed do |s|
    s.id = i
    s.name = "#{dept_name}部"
  end
  2.times do |j|
    group_id = i * 2 + j
    group_name = Gimei.last.katakana
    Group.seed do |s|
      s.id = group_id
      s.dept_id = i
      s.name = "#{dept_name}部#{group_name}課"
    end
  end
end

%w(PM TL CF AS BP).each_with_index do |name, id|
  Rank.seed do |s|
    s.id = id
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
    s.month_id = rand(24)
  end
end

10.times do |i|
  System.seed do |s|
    s.id = i
    s.number = "#{rand(10)}-#{rand(100)}"
    s.name = "#{Gimei.last.kanji}システム"
  end
end

varb = %w(構築 更改 制度対応 廃棄対応 機能追加 性能改善)

10.times do |i|
  Project.seed do |s|
    s.id = i
    s.number = rand(10000000) * 1000
    s.name = "#{Gimei.last.kanji}システムの#{varb.sample}"
    s.month_id = rand(24)
  end
end

params = 100.times.map{
  [rand(12), rand(20)]
}.sort.uniq

pp params

params.each_with_index do |arr, id|
  month_id, user_id = *arr
  Work.seed do |s|
    s.id = id
    s.month_id = month_id
    s.user_id = user_id
    s.power = rand(10) * 10 + 10
  end
end

params = 20.times.map{
  [rand(10), rand(4), rand(10)]
}.uniq

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

params = 100.times.map{
  [rand(4), rand(10), rand(10), rand(5), rand(12)]
}.uniq

params.each_with_index do |arr, id|
  group_id, project_id, system_id, rank_id, month_id = *arr
  Cost.seed do |s|
    s.id = id
    s.group_id = group_id
    s.project_id = project_id
    s.system_id = system_id
    s.rank_id = rank_id
    s.month_id = month_id
    s.power = rand(30) * 10 + 10
  end
end

params = 100.times.map{
  [rand(4), rand(10), rand(10), rand(20), rand(12)]
}.uniq

params.each_with_index do |arr, id|
  group_id, project_id, system_id, user_id, month_id = *arr
  Assign.seed do |s|
    s.id = id
    s.group_id = group_id
    s.project_id = project_id
    s.system_id = system_id
    s.user_id = user_id
    s.month_id = month_id
    s.power = rand(30) * 10 + 10
  end
end



