class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :bigint do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :post_id, null: false, foreign_key: true  # Update this line for referencing a Post
      t.text :comment
      t.boolean :like

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
