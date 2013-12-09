require 'spec_helper'

describe "Shows" do
  before :all do
    @show = FactoryGirl.create(:show)
  end

  it "should be able to add new shows" do
    visit "/"

    page.should have_content("Shows List")

    click_link("New Show")

    page.should have_content("New Show")

    fill_in "Name", :with => "Family Guy"
    fill_in "Picture", :with => "http://somephoto.com"

    click_button "Submit"

    page.should have_content "Shows List"
    page.should have_content "Family Guy"
    page.should have_content "http://somephoto.com"
  end

  context "As a user, when I go to the show list and click the 'like' button" do
    it "should add the 'liked count' by one" do
      visit "/shows"
      @show = Show.last
      liked_count = find("#liked_count_#{@show.id}").text.to_i
      click_link "like_#{@show.id}"
      page.should have_content "Liked!"
      find("#liked_count_#{@show.id}").text.to_i.should == liked_count + 1
    end
  end

  context "As a user, when I go to the show list and click the 'unlike' button" do
    it "should add the 'unliked count' by one" do
      visit "/shows"
      @show = Show.last
      unliked_count = find("#unliked_count_#{@show.id}").text.to_i
      click_link "unlike_#{@show.id}"
      page.should have_content "Unliked!"
      find("#unliked_count_#{@show.id}").text.to_i.should == unliked_count + 1
    end
  end
end
