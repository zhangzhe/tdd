require 'spec_helper'

describe "shows" do
  it "should route the root to shows#index" do
    {:get => "/"}.should route_to(:controller => "shows", :action => "index")
  end

  it "should route /shows to shows#index" do
    {:get => '/shows'}.should route_to(:controller => "shows", :action => "index")
  end

  it "should route /shows/new to shows#new" do
    {:get => '/shows/new'}.should route_to(:controller => "shows", :action => "new")
  end

  it "should route /shows to shows#create" do
    {:post => '/shows'}.should route_to(:controller => "shows", :action => "create")
  end

  it "should route /like to shows#like" do
    {:post => '/shows/1/like'}.should route_to(:controller => "shows", :action => "like", :id => "1")
  end

  it "should route /unlike to shows#unlike" do
    {:post => '/shows/1/unlike'}.should route_to(:controller => "shows", :action => "unlike", :id => "1")
  end
end