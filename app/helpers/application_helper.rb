module ApplicationHelper
	
	#Note: need to convert to javascript
	@@greetings = [
		"hi", 
		"hello", 
		"howdy", 
		"hey", 
		"hiya", 
		"'ello", 
		"ahoy", 
		"'sup", 
		"yo", 
		"g'day", 
		"ciao", 
		"aloha", 
		"hola", 
		"bonjour", 
		"salud", 
		"hallo", 
		226.chr("UTF-8") + "llo",
		"all" + 244.chr("UTF-8"),
		];
		
	def greeting
		@@greetings[rand(@@greetings.size)]
	end
	
	def isAdmin
		false
	end
end
