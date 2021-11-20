class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.boolean :released, default: false
      t.datetime :released_at
      t.time :length
      t.text :kind, array: true

      t.text :cover_art_url

      t.timestamps
    end
  end
end
