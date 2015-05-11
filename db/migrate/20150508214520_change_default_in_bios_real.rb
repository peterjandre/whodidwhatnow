class ChangeDefaultInBiosReal < ActiveRecord::Migration
  def change
    change_column_default :bios, :real, false
  end
end
