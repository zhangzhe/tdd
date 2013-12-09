require 'spec_helper'

describe Show do
  it { should validate_presence_of(:name).with_message("Please specify a name.") }
  it { should validate_presence_of(:picture).with_message("Please specify a picture.") }

  it "should be valid" do
    show = Show.new
    show.valid?
  end
end

describe "like!" do
  it "should plus like_count by 1 when called" do
    show = FactoryGirl.create(:show)
    expect{show.like!}.to change{show.liked_count}.from(0).to(1)
    expect{show.like!}.to change{show.liked_count}.by(1)
  end
end

describe "unlike!" do
  it "should plus unlike_count by 1 when called" do
    show = FactoryGirl.create(:show)
    expect{show.unlike!}.to change{show.unliked_count}.from(0).to(1)
    expect{show.unlike!}.to change{show.unliked_count}.by(1)
  end
end