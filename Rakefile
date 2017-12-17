lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.warning = false
end

desc 'Create source and test files for a new day'
task 'new_day' do
  day = ENV['DAY'] || highest_day + 1
  new_day = day.to_i

  source_path = "lib/day_#{new_day}/day_#{new_day}.rb"
  throw 'source already exists' if File.exists?(source_path)

  test_path = "test/day_#{new_day}/day_#{new_day}_test.rb"
  throw 'test already exists' if File.exists?(test_path)

  FileUtils.mkdir_p(File.dirname(source_path))
  File.open(source_path, 'w') do |file|
    file.write(source_src(new_day))
  end

  FileUtils.mkdir_p(File.dirname(test_path))
  File.open(test_path, 'w') do |file|
    file.write(test_src(new_day))
  end

  puts "created files for day #{new_day}"

end

private

def highest_day
  highest = Dir['lib/day_*'].map do |e|
    e.match(/\d+/).to_s.to_i
  end
  .max
end

def source_src(day)
  <<~END
    class Day#{day}
    end
  END
end

def test_src(day)
  <<~END
    require 'minitest/autorun'
    require 'day_#{day}/day_#{day}'

    class Day#{day}Test < Minitest::Test
      def test_one
      end
    end
  END
end

task default: :test
