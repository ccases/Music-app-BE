class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :url
      t.string :name
      t.text :credits
      t.boolean :available, default: false
      t.time :length
      
      t.timestamps
    end
  end
end
