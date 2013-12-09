class Show < ActiveRecord::Base
  validates_presence_of :name, :message => "Please specify a name."
  validates_presence_of :picture, :message => "Please specify a picture."

  def like!
    self.liked_count += 1
    self.save!
  end

  def unlike!
    self.unliked_count += 1
    self.save!
  end
end