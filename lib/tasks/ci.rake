namespace :ci do
  desc "Prepare database, run all tests including rspec and cucumber tests"
  task :build => ['db:migrate', 'test', 'spec', 'cucumber'] do
  end
end

