# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

mike = User.create!(username: "Mike")
jason = User.create!(username: "Jason")
sam = User.create!(username: "Sam")


a1 = Artwork.create!(title: "t1", image_url: "1", artist_id: User.find_by(username: "Mike").id)
a2 = Artwork.create!(title: "t1", image_url: "2", artist_id: User.find_by(username: "Jason").id)
a3 = Artwork.create!(title: "t2", image_url: "3", artist_id: User.find_by(username: "Mike").id)


s1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: mike.id)
s2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: mike.id)
s3 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: jason.id)
s4 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: sam.id)
s5 = ArtworkShare.create!(artwork_id: a3.id, viewer_id: sam.id)