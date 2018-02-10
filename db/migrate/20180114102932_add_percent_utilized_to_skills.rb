class AddPercentUtilizedToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :percent_utilized, :integer
  end
end
