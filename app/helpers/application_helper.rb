module ApplicationHelper
	
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
