class Target < ActiveRecord::Base
	belongs_to :puzzle

	def is_at_coord?(x,y)
		x = x.to_i
		y = y.to_i
		in_x = x.between?(self.x, self.x+self.width)
		in_y = y.between?(self.y, self.y+self.height)
		in_x && in_y
	end

	def position_data
		{ cid: 	self.id,
		  name: self.name,
		  x: 	self.x,
		  y: 	self.y,
		  width:  self.width,
		  height: self.height
		}
	end

end
