class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|

      t.timestamps
    end
  end
end
