# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.destroy_all
User.destroy_all
Activity.destroy_all
Collection.destroy_all


Category.create(name:"Leer",past:"leyó",sustantivo:"Libros",participio:"leído",futuro:"leerá")
Category.create(name:"Ver Películas",past:"vió",sustantivo:"Películas",participio:"vista",futuro:"verá")
Category.create(name:"Hacer Trekking",past:"realizó",sustantivo:"Trekkings",participio:"realizado",futuro:"realizará")


User.create(name:"Oso",email:"oso@oso.oso",password:'123456')
User.create(name:"Ganso",email:"ganso@ganso.ganso",password:'123456')
User.create(name:"Gato",email:"gato@gato.gato",password:'123456')


Collection.create(name:"Trekkings Valle del Mapocho",remote_photo_url:"http://www.wkndheroes.com/wp-content/uploads/2017/11/travesia-los-azules-15-1200x640.jpg",owner_id:1)
Collection.create(name:"Mejores Películas año 1991, Taschen",remote_photo_url:"https://cdn.taschen.com/media/images/1640/25_fav_movies_of_the_90s_ju_gb_open_0036_0037_44944_1412291520_id_676321.jpg",owner_id:1)


@user = User.first.id
@category = Category.first.id


require 'csv'


def abrir_seed(seed, base)
	archivo = File.open(Rails.root.join('lib',seed), 'r:iso-8859-1')
	notas = archivo.readlines
	archivo.close

	noti = []
	notas.each do |i|
		noti << i.split(",")
	end

	noti.each do |i|
		i[6].delete!("\n")
	end


	noti.each do |i|
		if i[3].to_i == 1
		base.create(name:i[0].to_s,author:i[1].to_s,owner_id:i[2].to_i,category_id:i[3].to_i,remote_photo_url:i[4].to_s)
		else
		base.create(name:i[0].to_s,owner_id:i[2].to_i,category_id:i[3].to_i,remote_photo_url:i[4].to_s,latitude:i[5].to_f,longitude:i[6].to_f)
		end
	end

end



abrir_seed('activity_seed.csv',Activity)



#el siguiente código carga las actvidades

# archivo = File.open(Rails.root.join('lib','activity_seed.csv'), 'r:iso-8859-1')
# notas = archivo.readlines
# archivo.close

# noti = []
# notas.each do |i|
# 	noti << i.split(",")
# end

# noti.each do |i|
# 	i[6].delete!("\n")
# end

# noti.each do |i|
# 	if i[3].to_i == 1
# 	Activity.create(name:i[0].to_s,author:i[1].to_s,owner_id:i[2].to_i,category_id:i[3].to_i,remote_photo_url:i[4].to_s)
# 	else
# 	Activity.create(name:i[0].to_s,owner_id:i[2].to_i,category_id:i[3].to_i,remote_photo_url:i[4].to_s,latitude:i[5].to_f,longitude:i[6].to_f)
# 	end
# end

# fin código carga actividades

ActivityCollection.create(activity_id: 14 , collection_id: 1)
ActivityCollection.create(activity_id: 15 , collection_id: 1)
ActivityCollection.create(activity_id: 16 , collection_id: 1)
ActivityCollection.create(activity_id: 17 , collection_id: 1)
ActivityCollection.create(activity_id: 18 , collection_id: 1)
ActivityCollection.create(activity_id: 19 , collection_id: 1)

ActivityCollection.create(activity_id: 1 , collection_id: 2)
ActivityCollection.create(activity_id: 2 , collection_id: 2)
ActivityCollection.create(activity_id: 3 , collection_id: 2)
ActivityCollection.create(activity_id: 4 , collection_id: 2)
ActivityCollection.create(activity_id: 5 , collection_id: 2)
ActivityCollection.create(activity_id: 6 , collection_id: 2)
ActivityCollection.create(activity_id: 7 , collection_id: 2)
ActivityCollection.create(activity_id: 8 , collection_id: 2)
ActivityCollection.create(activity_id: 9 , collection_id: 2)
ActivityCollection.create(activity_id: 10 , collection_id: 2)
ActivityCollection.create(activity_id: 11 , collection_id: 2)
ActivityCollection.create(activity_id: 12 , collection_id: 2)
ActivityCollection.create(activity_id: 13 , collection_id: 2)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

