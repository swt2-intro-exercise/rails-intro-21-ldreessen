require 'rails_helper'

describe "Author model", type: :model do
	it 'should have first_name, last_name, homepage' do
		author = Author.new(first_name:'Alan', last_name:'Turing', homepage:'http://wikipedia.org/Alan_Turing')
		# author.initialize(first_name:'Alan', last_name:'Turing', homepage:'http://wikipedia.org/Alan_Turing')
		expect(author.first_name).to eq('Alan')
		expect(author.last_name).to eq('Turing')
		expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
		expect(author.name).to eq('Alan Turing')
	end
end