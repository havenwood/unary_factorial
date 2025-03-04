# frozen_string_literal: true

task default: %w[test]

task :test do
  Rake::FileList['test/*_test.rb'].each do |file|
    ruby file
  end
end

task :bench do
  Rake::FileList['bench/*_bench.rb'].each do |file|
    ruby file
  end
end
