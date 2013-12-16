class AddTodoToStatuses < ActiveRecord::Migration
  def change
    add_column :next_actions, :shows_on_todo_list, :boolean, default: true
    NextAction.where("id IN (?)",[5,7]).all.each{|s| s.update_attribute(:shows_on_todo_list, false) }
  end
end
