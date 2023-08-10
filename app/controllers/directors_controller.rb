class DirectorsController < ApplicationController
  def index
    render({ template: "director_templates/list" })
  end

  def youngest
    list_of_directors = Director.all
    directors_with_dob = list_of_directors.where.not({ director_dob: "nil" })
    ordered_directors = directors_with_dob.order({ director_dob: :asc })
    @youngest_director = ordered_directors.at(0)

    render({ template: "director_templates/youngest"})
  end

  def eldest
    render({ template: "director_templates/eldest"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ id: the_id })

    @the_director = matching_records.at(0)

    render({ template: "director_templates/details" })
  end

end
