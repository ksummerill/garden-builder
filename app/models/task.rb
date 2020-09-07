class Task < ApplicationRecord
  belongs_to :garden

  # Could use this method to remove the options listed in _form.html.erb for tasks
  # def self.alphabetize
  #   # binding.pry
  #   order(:id)
  # end
end
