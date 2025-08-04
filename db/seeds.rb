# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Idempotency
OrderItem.destroy_all
Order.destroy_all
CartItem.destroy_all
Cart.destroy_all
Address.destroy_all
User.destroy_all
Categorization.destroy_all
Product.destroy_all
Category.destroy_all
Province.destroy_all

# Seed the provinces
# https://www.canada.ca/en/revenue-agency/services/tax/businesses/topics/gst-hst-businesses/charge-collect-which-rate/calculator.html
provinces = [
  { name: 'Alberta', code: 'AB', gst: 0.05, pst: 0.0 },
  { name: 'British Columbia', code: 'BC', gst: 0.05, pst: 0.07 },
  { name: 'Manitoba', code: 'MB', gst: 0.05, pst: 0.07 },
  { name: 'New Brunswick', code: 'NB', gst: 0.15, pst: 0.0 },
  { name: 'Newfoundland and Labrador', code: 'NL', gst: 0.15, pst: 0.0 },
  { name: 'Northwest Territories', code: 'NT', gst: 0.05, pst: 0.0 },
  { name: 'Nova Scotia', code: 'NS', gst: 0.14, pst: 0.0 },
  { name: 'Nunavut', code: 'NU', gst: 0.05, pst: 0.0 },
  { name: 'Ontario', code: 'ON', gst: 0.13, pst: 0.0 },
  { name: 'Quebec', code: 'QC', gst: 0.05, pst: 0.09975 },
  { name: 'Prince Edward Island', code: 'PE', gst: 0.15, pst: 0.0 },
  { name: 'Saskatchewan', code: 'SK', gst: 0.05, pst: 0.06 },
  { name: 'Yukon', code: 'YT', gst: 0.05, pst: 0.0 }
]

provinces.each do |province|
  Province.create!(province)
end

# Seed the categories
categories = [
  "Single Board Computers",
  "Power Supplies",
  "Cases",
  "Keyboards",
  "Cooling",
  "Kits",
  "Expansions"
]

categories.each do |name|
  Category.create!(name: name)
end