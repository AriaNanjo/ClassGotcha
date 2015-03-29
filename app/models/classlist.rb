class Classlist < ActiveRecord::Base
	attr_accessor :name.:code,:professors_id,:class_date_id,:class_time_id,:abbrebiation,:section_number,:professor,:location,
			:room_number,:classify

	def initilize(attribute={})
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

	

	validate: name, presence:true, length:{maximun:50}
	validate: code, presence:true, length:{maximun:11}
	validate: professors_id, presence:true, length:{maximun:11}
	validate: class_date_id, presence:true, length:{maximun:11}
	validate: class_time_id, presence:true, length:{maximun:11}
	validate: abbrebiation, presence:true, length:{maximun:50}
	validate: section_number, presence:true, length:{maximun:11}, uniqueness:true

	validate: professor, presence:true, length:{maximun:50}
	validate: location, presence:true, length:{maximun:50}
	validate: room_number, presence:true, length:{maximun:50}
	validate: classify, presence:true, length:{maximun:50}
	

end
