class AddContactIdToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :contact_id, :integer
    Status.all.each do |s|
      if s.job
        s.contact_id = s.job.contact_id
        s.save
      end
    end
  end

  def self.down
    remove_column :statuses, :contact_id
  end
end
