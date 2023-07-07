(0..10).each do
  User.create(email: Faker::Internet.email, password_digest: "password")
end

Notes.create(user_id rand(1..10), child_category_id: rand(1..10), title: Faker::Hacker.noun.capitalize, description: Faker::Hacker.noun.capitalize)

Images.create(notes_id: rand(1..10), link_name: Faker::Hacker.noun.capitalize, image_path: Faker::Hacker.noun.capitalize)

Links.create(notes_id: rand(1..10), link_name: Faker::Hacker.noun.capitalize, link: Faker::Hacker.noun.capitalize)

ChildCategory.create(notes_id: rand(1..10), title: Faker::Hacker.noun.capitalize)

ParentCategory.create(user_id: rand(1..10), title: Faker::Hacker.noun.capitalize)
