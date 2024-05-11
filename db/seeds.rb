# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: "React client development", redirect_uri: "http://localhost:3000", scopes: ["read", "write"])
end

# example url for oauth:
# http://127.0.0.1:3000/oauth/authorize?client_id=YObHzt_AH8j0D4j3LfJD82C_Dz-oy-UdYpGpaOhrG7g&response_type=code&redirect_uri=http://localhost:3000
