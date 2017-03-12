require "gimei"

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
    s.end_month = Date.new(2018,3,1)
  end
end

date = Date.today.beginning_of_month

24.times do |i|
  Month.seed do |s|
    s.id = i
    s.name = date.strftime("%m月")
    s.date = date

    date = date.next_month
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
    s.end_month = Date.new(2018,3,1)
  end
end

100.times do |i|
  begin
    Work.seed do |s|
      s.id = i
      s.month_id = rand(12)
      s.user_id = rand(20)
      s.power = rand(10)/10.0
    end
  rescue
  end
end

20.times do |id|
  begin
    Order.seed do |s|
      s.id = id
      s.project_id = rand(10)
      s.group_id = rand(4)
      s.system_id = rand(10)
      s.price = rand(10000000)
    end
  rescue
  end
end

100.times do |id|
  begin
    Cost.seed do |s|
      s.id = id
      s.group_id = rand(4)
      s.project_id = rand(10)
      s.system_id = rand(10)
      s.rank_id = rand(5)
      s.month_id = rand(12)
      s.power = rand(30)/10.0
    end
  rescue
  end
end

100.times do |id|
  begin
    Assign.seed do |s|
      s.id = id
      s.group_id = rand(4)
      s.project_id = rand(10)
      s.system_id = rand(10)
      s.user_id = rand(20)
      s.month_id = rand(12)
      s.power = rand(30)/10.0
    end
  rescue
  end
end



