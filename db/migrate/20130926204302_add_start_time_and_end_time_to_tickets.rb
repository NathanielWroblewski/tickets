class AddStartTimeAndEndTimeToTickets < ActiveRecord::Migration
  def change
  	add_column :tickets, :start_time, :datetime
  	add_column :tickets, :end_time, :datetime
  	remove_column :tickets, :when
  end
end
