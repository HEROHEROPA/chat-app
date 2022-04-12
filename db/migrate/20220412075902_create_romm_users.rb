class CreateRommUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :romm_users do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
