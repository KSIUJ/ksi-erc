class AddAcademicYearToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :academic_year, :string
  end
end
