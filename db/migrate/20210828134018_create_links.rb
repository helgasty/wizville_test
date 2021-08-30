class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :base_url
      t.string :identifier
      t.timestamps
    end
  end
end
