class ClasslistController < ApplicationController
  def new
		@name = attributes[:name]
		@code = attributes[:code]
		@professors_id = attributes[:professors_id]
		@class_date_id = attributes[:class_date_id]
		@class_time_id = attributes[:class_time_id]
		@abbrebiation = attributes[:abbrebiation]
		@section_number = attributes[:section_number]
		@professor = attributes[:professor]
		@location = attributes[:location]
  end
end
