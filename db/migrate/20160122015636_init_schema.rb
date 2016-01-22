class InitSchema < ActiveRecord::Migration
  def up
    
    # These are extensions that must be enabled in order to support this database
    enable_extension "plpgsql"
    sql_file = File.open("./db/migrate/erc.sql", "rb")
    sql = sql_file.read
    execute sql
  end

  def down
    raise "Can not revert initial migration"
  end
end
