class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
