require 'rails_helper'

RSpec.describe Person, type: :model do
  it 'is invalid without a first name' do
    person = Person.new(first_name: nil)
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
    person = Person.new(first_name: 'Bob', last_name: nil)
    expect(person).not_to be_valid
  end

  it 'updates the requested person' do
    person = Person.create! valid_attributes
    put :update, {:id => person.to_param, :person => new_attributes}, valid_session
    person.reload
    expect(person.first_name).to eq('NewFirstName')
    expect(person.last_name).to eq('NewFirstName')
  end

end


