models = [
"Dept",
"Rank",
"Group",
"User",
"System",
"Project",
"Work",
"Cost",
"Assign"
]

models.each do |model|
  model = model.downcase
  puts "li= link_to '#{model}', '/#{model}s'"
end
