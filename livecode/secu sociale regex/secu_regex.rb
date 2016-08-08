require 'date'

def french_ssn_info(code)
  match_data = code.gsub!(" ", "").match(/(?<gender>[1-2])(?<year>\d{2})(?<month>0[1-9]|1[0-2])(?<department>0[1-9]|[1-9]\d)(?<random>\d{6})(?<last>\d{2})/)
  if match_data
    genders = ["man", "woman"]
    departments = ["Ain", "Aisne", "Allier", "Alpes-de-Haute-Provence", "Hautes-Alpes", "Alpes-Maritimes", "Ardèche", "Ardennes", "Ariège", "Aube", "Aude", "Aveyron", "Bouches-du-Rhône", "Calvados", "Cantal", "Charente", "Charente-Maritime", "Cher", "Corrèze", "Côte-d'Or", "Côtes-d'Armor", "Creuse", "Dordogne", "Doubs", "Drôme", "Eure", "Eure-et-Loir", "Finistère", "Corse-du-Sud", "Haute-Corse", "Gard", "Haute-Garonne", "Gers", "Gironde", "Hérault", "Ille-et-Vilaine", "Indre", "Indre-et-Loire", "Isère", "Jura", "Landes", "Loir-et-Cher", "Loire", "Haute-Loire", "Loire-Atlantique", "Loiret", "Lot", "Lot-et-Garonne", "Lozère", "Maine-et-Loire", "Manche", "Marne", "Haute-Marne", "Mayenne", "Meurthe-et-Moselle", "Meuse", "Morbihan", "Moselle", "Nièvre", "Nord", "Oise", "Orne", "Pas-de-Calais", "Puy-de-Dôme", "Pyrénées-Atlantiques", "Hautes-Pyrénées", "Pyrénées-Orientales", "Bas-Rhin", "Haut-Rhin", "Rhône", "Haute-Saône", "Saône-et-Loire", "Sarthe", "Savoie", "Haute-Savoie", "Paris", "Seine-Maritime", "Seine-et-Marne", "Yvelines", "Deux-Sèvres", "Somme", "Tarn", "Tarn-et-Garonne", "Var", "Vaucluse", "Vendée", "Vienne", "Haute-Vienne", "Vosges", "Yonne", "Territoire de Belfort", "Essonne", "Hauts-de-Seine", "Seine-Saint-Denis", "Val-de-Marne", "Val-d'Oise"]
    century = match_data[:year].to_i > 16 ? "#{19}" : "#{20}"
    return "A #{genders[match_data[:gender].to_i - 1]}, born in #{name_month(match_data[:month].to_i)}, #{century}#{match_data[:year]} in #{departments[match_data[:department].to_i - 1]}."
  else
    return "The number is invalid"
  end
end

def name_month(code)
  Date::MONTHNAMES[code]
end

puts french_ssn_info("2 84 12 76 451 089 46")

