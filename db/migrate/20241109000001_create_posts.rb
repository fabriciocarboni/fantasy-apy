class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: :bigint do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.string :images
      t.string :status

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :user_id
  end
end
