class Event < ApplicationRecord

	def self.check_type(type)
		["PushEvent", "ReleaseEvent", "WatchEvent"].include?(type) ? true : false
	end
end
