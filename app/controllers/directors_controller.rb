class DirectorsController < ApplicationController
  def index
    render({ template: "director_templates/list" })
  end

  def youngest
    list_of_directors = Director.all
    directors_with_dob = list_of_directors.where.not({ dob: nil })
    ordered_directors = directors_with_dob.order({ dob: :desc })
    @youngest = ordered_directors.at(0)

    render({ template: "director_templates/youngest"})
  end

  def eldest
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ template: "director_templates/eldest"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ id: the_id })

    @the_director = matching_records.at(0)

    render({ template: "director_templates/details" })
  end

end
