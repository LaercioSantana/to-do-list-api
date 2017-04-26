require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    user = {
      full_name: "user",
      email: "email@email.com",
      password: "secret"
    }
    @user = User.new user
  end

  describe "Associations" do
    it { should have_many(:todos) }
  end

  it "is valid with valid a attributes" do
    expect(@user).to be_valid
  end

  it "is invalid without valid a email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without valid a password" do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  context "after save" do
    it "have a password_digest" do
      expect(@user.password_digest).to_not eq nil
    end

    it "have a hide password" do
      @user.save
      expect(User.find_by_email(@user.email).password).to eq nil
    end

    it "have a token" do
      @user.save
      expect(User.find_by_email(@user.email).token).to_not eq nil
    end
  end

end
