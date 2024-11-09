class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows, id: :bigint do |t|
      t.bigint :follower_id, null: false, index: true
      t.bigint :following_id, null: false, index: true

      t.timestamps
    end

    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :following_id
  end
end
