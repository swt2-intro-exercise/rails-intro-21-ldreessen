FactoryBot.define do
  factory :paper do
    title { "MyString" }
    venue { "MyString" }
    year { 1 }
	authors {build_list :author, 1}

	factory :paper2 do
		title { "Paper 2" }
		year { 1968}
	  end
  end
end
