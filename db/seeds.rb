# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
Unit.delete_all

#---------------clases--------------
# CSV.foreach("/home/fran/Documents/desafios/desarrollo_rails/api-uf/db/uf2019.csv", headers: true, col_sep: ";") do |row|
    # jan = row.fetch("Ene")
    # feb = row.fetch("Feb")
    # day = row.fetch(row.headers[0])
    # 
    # jan_wdecimals = jan.gsub(".", "").gsub ",", "."
    # if feb != nil
        # feb_wdecimals = feb.gsub(".", "").gsub ",", "."
    # end
# 
    # Unit.create(date: "2019-01-" + day, value: jan_wdecimals)
# 
    # Unit.create(date: "2019-02-" + day, value: feb_wdecimals) if feb != nil
# end

#---------------tutoria--------------
YEAR = '2019'
MONTHS = {
    "Ene": '01',
    "Feb": '02'
}

CSV.foreach("#{Rails.root}/db/uf2019.csv", headers: true, col_sep: ";") do |row|
    date_hash = row.to_h
    day = date_hash[date_hash.keys.first]
    months = date_hash.keys[1..2]  #Ene-Feb

    months.each do |m|
        month = MONTHS[m.to_sym] #cambia Ene a :Ene y busca el valor asignado en línea 31
        date = "#{YEAR}-#{month}-#{day}" 
        value = date_hash[m]
        value.gsub!('.','').gsub!(',','.') unless value.nil?
        
        Unit.create(date: date, value: value)
    end
end

#usamos símbolos porque es más rápido de procesar que string; los símbolos tienen un solo token