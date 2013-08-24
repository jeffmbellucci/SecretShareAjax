class Friendship < ActiveRecord::Base
  belongs_to :out_user, :class_name => "User"
  belongs_to :in_user, :class_name => "User"
end
