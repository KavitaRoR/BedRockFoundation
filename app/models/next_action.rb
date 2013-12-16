class NextAction < ActiveRecord::Base
  def self.for_todo
    where(:shows_on_todo_list => true)
  end
end
