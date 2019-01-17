#Create two users

kazumi = User.create(username: "Kazumi", email: "kazumi@gmail.com", password: "1234")
john = User.create(username: "John", email: "john@gmail.com", password: "1234")

#Create two trails

panhandle = Trail.create(name:  "Pan handle", length: 1.5, bathroom:)