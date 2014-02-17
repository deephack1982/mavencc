namespace :db do
	desc "Deletes all users and seeds the DB with users"
	task :seed_users => :environment do
		User.delete_all
		for n in 6667..6706
			User.create!(user: n, pass: 'Fulltestpass', full_name: 'Mark Dickie', user_level: 9, user_group: 'Admins')
		end
	end
end

