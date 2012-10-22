class Delivered < ActiveRecord::Base
  attr_accessible :lastdelivered, :reminder_id, :status, :task_id
end
