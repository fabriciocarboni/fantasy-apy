class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :bigint do |t|
      t.string :name, null: false
      t.string :phone
      t.string :email, null: false
      t.string :type
      t.boolean :approved, null: false
      t.string :upload_1
      t.string :upload_2
      t.string :upload_3

      t.timestamps
    end
  end
end