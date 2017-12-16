#Helps the application
module ApplicationHelper
	
	#Checks if user is admin and returns true if so.
	def isAdmin
		if session[:logged_in]
			if current_user.admin
				return true
			end
		else
			return false
		end
	end
end
