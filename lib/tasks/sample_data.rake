# coding:utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Администратор",
                         email: "example@example.com",
                         password: "123123",
                         password_confirmation: "123123")
    admin.toggle!(:admin)
    5.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
		name = "БИПЕК АВТО"
		address = "Набережная Славского 100500"
		contact_name = "Петров"
		contact_phone = "123-321"
		contact_email = "contact@mail.com"
		users.each { |user| user.partners.create!(name: name, address: address, contact_name: contact_name, contact_phone: contact_phone, contact_email: contact_email) }
    end
  end
  task admin: :environment do
  admin = User.create!(name: "Администратор",
                       email: "example@example.com",
                       password: "123123",
                       password_confirmation: "123123")
  end
end
