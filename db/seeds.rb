#Create two users
kazumi = User.create(username: "Kazumi", email: "kazumi@gmail.com", password: "1234")	
john = User.create(username: "John", email: "john@gmail.com", password: "1234")	

#Create three trails

panhandle = Trail.create(name:  "Pan handle", length: 1.5, bathroom: "Yes", cell_reception: "Yes", user_id: kazumi.id)	
frick = Trail.create(name:  "Frick", length: 1, bathroom: "No", cell_reception: "Unknown", user_id: kazumi.id)
scrubgrass = Trail.create(name:  "Scrubgrass", length: 1.7, bathroom: "Yes", cell_reception: "No", user_id: john.id)

#Create four categories

stroller_friendly = Category.create(name: "Stroller friendly")
carrier_only = Category.create(name: "Carrier Only")
near_water = Category.create(name: "Near Water")
park_and_play = Category.create(name: "Park and Play")