require 'rails_helper'

RSpec.describe Todo, type: :model do
  before :each do
    user = {
      full_name: "user",
      email: "email@email.com",
      password: "secret"
    }
    @user = User.new user

    todo = {
      description: "todo 1",
      done: false,
      priority: 1
    }
    @todo = @user.todos.new todo
  end

  describe "Associations" do
    it { should belong_to(:user) }
  end

  it "is valid with valid a attributes" do
    expect(@todo).to be_valid
  end

  it "is invalid without valid a description" do
    @todo.description = nil
    expect(@todo).to_not be_valid
  end

  context "by default" do
    it "have a priority equal to 0" do
      expect(Todo.new.priority).to eq 0
    end

    it "have a done equal to false" do
      expect(Todo.new.done).to eq false
    end

    it "have a priority equal to 0" do
      expect(Todo.new.priority).to eq 0
    end

    it "is invalid" do
      expect(Todo.new).to_not be_valid
    end
  end
end
