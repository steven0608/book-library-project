require 'rails_helper'

describe User do
  it 'is valid with valid attributes' do
    expect(User.new(username: "username", password: "password")).to be_valid
  end
end

describe Library do
  it 'is valid with valid attributes' do
    expect(Library.new(name: "Test Library", location: "Location")).to be_valid
  end
end

describe Book do
  it 'is valid with valid attributes' do
    expect(Book.new(title: "Test Library", description: "Location", author: "Author")).to be_valid
  end
end

describe Request do
  it 'is valid with valid attributes' do
    user = User.new(username: "username", password: "password")
    library = Library.new(name: "Test Library", location: "Location")
    expect(Request.new(title: "Test Library", description: "Location", user: user, library: library)).to be_valid
  end
end
