FactoryBot.define do
  factory :paper do
    title { "MyString" }
    venue { "MyString" }
    year { 1 }
	authors {build_list :author, 1}
  end
end
