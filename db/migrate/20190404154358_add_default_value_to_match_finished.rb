class AddDefaultValueToMatchFinished < ActiveRecord::Migration[5.2]
  def change
    change_column :matches, :finished, :boolean, default: false
  end
end
