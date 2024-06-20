
namespace :fetch do
    desc "Fetch albums and photos from JSONPlaceholder and save to database"
    task albums_photos: :environment do
      require 'net/http'
      require 'json'
  
      albums_url = 'https://jsonplaceholder.typicode.com/albums'
      albums_uri = URI(albums_url)
      albums_response = Net::HTTP.get(albums_uri)
      albums_data = JSON.parse(albums_response)
  
      albums_data.each do |album_data|
        album = Album.find_or_initialize_by(id: album_data['id'])
        album.title = album_data['title']
        album.user_id = album_data['userId']  
  

        photos_url = "https://jsonplaceholder.typicode.com/albums/#{album_data['id']}/photos"
        photos_uri = URI(photos_url)
        photos_response = Net::HTTP.get(photos_uri)
        photos_data = JSON.parse(photos_response)
  
        photos_data.each do |photo_data|
          photo = Photo.find_or_initialize_by(id: photo_data['id'])
          photo.title = photo_data['title']
          photo.url = photo_data['url']
          photo.thumbnail_url = photo_data['thumbnailUrl']
          photo.album = album  
  
          photo.save
        end
  
        album.save
      end
  
      puts "Albums and photos fetched and saved to database successfully!"
    end
  end
  