class CreateBests < ActiveRecord::Migration[6.0]
  def change
    create_table :bests do |t|
      t.references :user, foreign_key:true
      t.references :tweet, foreign_key:true
      t.timestamps
    end
  end
end
