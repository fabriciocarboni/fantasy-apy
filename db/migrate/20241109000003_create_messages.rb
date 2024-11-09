class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, id: :bigint do |t|
      t.bigint :from_id, null: false, index: true
      t.bigint :to_id, null: false, index: true
      t.binary :status
      t.text :text

      t.timestamps
    end

    add_foreign_key :messages, :users, column: :from_id
    add_foreign_key :messages, :users, column: :to_id
  end
end
