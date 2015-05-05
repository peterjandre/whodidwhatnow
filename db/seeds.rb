# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Person.create([{full_name: "Mary Toft"}, {full_name: "Oscar the Cat"}, {full_name: "George P. Burdell"}, {full_name: "Aron Ralston"}, {full_name: "Larry Walters"}])
Bio.create([{text: "An English woman who hoaxed doctors into believing that she had given birth to rabbits.", real: true, person_id: 1}, {text: "A hospice cat who was featured in the New England Journal of Medicine for his purported ability to predict the impending death of terminally ill patients.", real: true, person_id: 2}, {text: "A fictitious student officially enrolled at Georgia Tech in 1927, and, except for his 'service' in World War II, has been continuously enrolled at the school ever since.", real: true, person_id: 3}, {text: "One tough guy who, to escape from death, cut off his own arm with a dull knife after a boulder fell on it.", real: true, person_id: 4}, {text: "Successfully piloted a lawn chair to 16,000 feet over Los Angeles.", real: true, person_id: 5}])
for i in 1..5 do 
  4.times do
    Bio.create(text: "#{i} -- This is a fake bio.", real: false, person_id: i)
  end
end