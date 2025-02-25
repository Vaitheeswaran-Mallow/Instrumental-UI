class CreateInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :invitations do |t|
      t.references :account, null: false, foreign_key: true
      t.references :created_by_user, foreign_key: { to_table: :users }, null: false
      t.string :email
      t.string :token
      t.string :role, null: false, default: 'pending'
      t.string :status

      t.timestamps
    end
  end
end
