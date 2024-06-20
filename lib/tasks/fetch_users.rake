namespace :fetch do
    desc "Fetch users from JSONPlaceholder and save to database"
    task users: :environment do
      require 'net/http'
      require 'json'
  
      url = 'https://jsonplaceholder.typicode.com/users'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      users = JSON.parse(response)
  
      users.each do |user_data|
        # Find or create the company
        company_data = user_data['company']
        company = Company.find_or_create_by(name: company_data['name']) do |c|
          c.catch_phrase = company_data['catchPhrase']
          c.bs = company_data['bs']
        end
  
        # Find or create the geolocation
        geo_data = user_data['address']['geo']
        geolocation = Geolocation.find_or_create_by(
          lat: geo_data['lat'],
          lng: geo_data['lng']
        )
  
        # Find or create the address
        address_data = user_data['address']
        address = Address.find_or_create_by(
          geolocation_id: geolocation.id,
          street: address_data['street'],
          suite: address_data['suite'],
          city: address_data['city'],
          zipcode: address_data['zipcode']
        )
  
        # Create the user
        User.find_or_create_by(username: user_data['username']) do |user|
          user.name = user_data['name']
          user.email = user_data['email']
          user.phone = user_data['phone']
          user.website = user_data['website']
          user.company = company
          user.address = address
        end
      end
      puts "Users fetched and saved to database successfully!"
    end
  end
  