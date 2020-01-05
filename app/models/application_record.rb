class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.column_names_excluded(*excluded_columns)
    excluded_columns = %i[id created_at updated_at] if excluded_columns.empty?
    (self.column_names.map(&:to_sym) - excluded_columns.map(&:to_sym))
  end

end
