class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|

      t.string :title
      t.text :details
      t.string :image
      t.string :region
      t.date :date
      t.timestamps
    end
  end
end
