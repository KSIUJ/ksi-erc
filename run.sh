dropdb -U ksi_erc ksi_erc_development
createdb -U ksi_erc ksi_erc_development
rake db:migrate
psql -U ksi_erc -d ksi_erc_development -f ksi_erc_data.sql
