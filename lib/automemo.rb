models = %w(assign cost dept group month order project rank system user work)

models.each do |model|
  puts "it { exepct(build :#{model}).to be_valid}"
end
