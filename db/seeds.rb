User.destroy_all
Sub.destroy_all
Post.destroy_all
PostSub.destroy_all

user1 = User.create!(username: 'kevin', password: '123456')
user2 = User.create!(username: 'adam', password: '123456')

sub1 = Sub.create!(title: "Kevin's Sub", moderator_id: user1.id)
sub2 = Sub.create!(title: "Adam's Sub", moderator_id: user2.id)

# debugger

Post.create!(title: "First Post.", author_id: user1.id, sub_ids: [sub1.id, sub2.id])
Post.create!(title: "Second Post.", author_id: user1.id, sub_ids: [sub2.id])
