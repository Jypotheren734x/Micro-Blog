#These Settings Establish the Proper Database Connection for Heroku Postgres
#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
#This is automatically configured on Heroku, you only need to worry if you also
#want to run your app locally
configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://egxuymljkrmkde:2ae62d8dd5520103286b31a5955ef12f576f235adf4588091dd72a7f04b34905@ec2-107-22-162-158.compute-1.amazonaws.com:5432/dffe37v92mjfrd')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)
end