dropdb -U ksi_erc ksi_erc_development
createdb -U ksi_erc ksi_erc_development
rake db:migrate
psql -U ksi_erc ksi_erc_development < ~/Downloads/ksi_erc.sql
