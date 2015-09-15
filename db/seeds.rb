

user1 = User.create!(username: "Sophie3232")
user2 = User.create!(username: "Brookemagicpony")
user3 = User.create!(username: "mickeymousefan")

contact1 = user1.contacts.create!(email: "blahblah@example.com", name: "Mom")
contact2 = user2.contacts.create!(email: "fanperson@example.com", name: "Ian")
contact3 = user3.contacts.create!(email: "yetanotheremail@example.com", name: "Minnie Mouse")

contactshare1 = contact1.contact_shares.create!(user_id: user2.id)
contactshare2 = contact2.contact_shares.create!(user_id: user3.id)
contactshare3 = contact3.contact_shares.create!(user_id: user1.id)

comment1 = Comment.create!(commentable_id: user1.id, commentable_type: "User", content: "The best user")
comment2 = Comment.create!(commentable_id: contact2.id, commentable_type: "Contact", content: "Brooke's boyfriend")
