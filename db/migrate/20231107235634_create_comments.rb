class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :user, foreign_key: true
      t.integer :post, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
