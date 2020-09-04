class Task < ApplicationRecord
  belongs_to :garden

  # Could use this method to remove the options listed in _form.html.erb for tasks
  # def options_for_select(options, alphabetize: true)
  #   @options = ["water garden","weed garden","harvest","mulch beds","dig holes","trim plants","fertilize","sample soil"]
  #   @options.sort!{ |x, y| x[0] <=> y[0] } if alphabetize
  #   super(options, selected_items)
  # end
end
