class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :plan_id
      t.timestamps
    end
  end
end
