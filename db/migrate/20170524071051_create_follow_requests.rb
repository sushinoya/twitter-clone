class CreateFollowRequests < ActiveRecord::Migration
  def change
    create_table :follow_requests do |t|
      t.references :sender,    class: 'user',      null: false
      t.references :recipient, class: 'user',      null: false
      t.integer    :status,    default: 'pending', null: false
    end

    add_index :follow_requests, [:sender_id, :recipient_id], unique: true
    add_index :follow_requests, :sender_id
    add_index :follow_requests, :recipient_id
  end
end
