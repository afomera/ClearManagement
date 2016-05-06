class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.string :status
      t.string :direction
      t.string :sid
      t.string :messaging_service_sid
      t.string :from
      t.string :to
      t.references :conversation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
