class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :service_request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
