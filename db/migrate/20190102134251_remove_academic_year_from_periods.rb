class RemoveAcademicYearFromPeriods < ActiveRecord::Migration[5.2]
  def change
    remove_column :periods, :academic_year, :string
  end
end
