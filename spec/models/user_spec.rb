require "rails_helper"

RSpec.describe User, type: :model do
  describe "name" do
    subject {FactoryGirl.build :user}
    before do
      subject.name = ""
    end
    it {is_expected.not_to be_valid}
  end

  describe "email" do
    subject {FactoryGirl.build :user}
    context "email length" do
      before do
        subject.email = "a" * 300 + "@gmail.com"
      end
      it {is_expected.not_to be_valid}
    end

    context "email regex" do
      before do
        subject.email = "huy123@gmail,com"
      end
      it {is_expected.not_to be_valid}
    end

    context "unique" do
      before do
        subject.email.upcase!
      end
      it {is_expected.to be_valid}
    end

    context "email low-case" do
      before do
        subject.email = "123456@GMAIL.CoM"
        subject.email.downcase!
      end
      it {is_expected.to be_valid}
    end
  end

  describe "#password" do
    context "password nonblank" do
      subject {FactoryGirl.build :user}
      before do
        subject.password = subject.password_confirmation = "    "
      end
      it {is_expected.not_to be_valid}
    end

    context "password should have a minimum length" do
      subject {FactoryGirl.build :user}
      before do
        subject.password = subject.password_confirmation = "a" * 5
      end
      it {is_expected.not_to be_valid}
    end
  end
end
