# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

User.destroy_all
UserSoftware.destroy_all
Software.destroy_all

softwaresList = [
	{name: 'Contexts',tag: 'Productivity'},
	{name: 'Sublime Text',tag: 'Programming'},
	{name: 'Adobe Photoshop',tag: 'Design'},
	{name: 'SizeUp',tag: 'Utility'},
	{name: 'Stay',tag: 'Utility'},
	{name: 'Slack',tag: 'Communication'},
	{name: 'Telegram',tag: 'Communication'},
	{name: 'Adobe InDesign',tag: 'Design'},
	{name: 'Microsoft Word',tag: 'Productivity'},
	{name: 'Microsoft PowerPoint',tag: 'Productivity'},
	{name: 'Microsoft Excel',tag: 'Productivity'},
	{name: 'Google Docs',tag: 'Productivity'},
	{name: 'Google Sheets',tag: 'Productivity'},
	{name: 'Google Slides',tag: 'Productivity'},
	{name: 'Atom',tag: 'Programming'},
	{name: 'Robo 3T',tag: 'Programming'}
]

Software.create(softwaresList)


10.times do |f|
	first_n = FFaker::Name.first_name
	last_n = FFaker::Name.last_name
	email = FFaker::Internet.free_email
	username = FFaker::Internet.user_name
	pass = FFaker::Internet.password
	job = FFaker::Job.title
	blurb = FFaker::Lorem.paragraph

	User.create({first_name: first_n, last_name: last_n, email: email, username: username, password: pass, job_title:job, job_field: 'Tech', blurb: blurb})
end

User.all.each do |user|
	telegram = Software.find_by_name('Telegram')
	contexts = Software.find_by_name('Contexts')
	sublime = Software.find_by_name('Sublime Text')

	user.user_softwares << UserSoftware.new({:software => telegram,:description => FFaker::Lorem.paragraph })
	user.user_softwares << UserSoftware.new({:software => contexts,:description => FFaker::Lorem.paragraph })
	user.user_softwares << UserSoftware.new({:software => sublime,:description => FFaker::Lorem.paragraph })
end