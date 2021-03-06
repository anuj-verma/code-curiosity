FactoryGirl.define do
  factory :organization do
    name "Josh Software Private Limited"
    website "http://www.joshsoftware.com"
    github_handle "joshsoftware"
    
    factory :organization_with_repositories do
      transient do
        repositories_count 1
      end
      after(:create) do |organization, evaluator|
        create_list(:repository, evaluator.repositories_count, name: "repo", source_url: Faker::Internet.url('github.com', "/#{Faker::Lorem.word}/#{Faker::Lorem.word}") , ssh_url: Faker::Internet.url('github.com', "/#{Faker::Lorem.word}/#{Faker::Lorem.word}") , organization: organization)
      end
    end

  end
end
