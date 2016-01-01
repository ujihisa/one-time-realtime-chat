class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.text :body
      t.string :ip

      t.timestamps
    end
  end
end
