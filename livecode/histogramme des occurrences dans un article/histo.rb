article = "test test test test bonjour test bonjour hello bonjour test hello hello bonjour hello hello"

# Spliter la string de l'article par word
# Grouper by en tableau les mots équivalents

array_words = article.split(' ')
hash_words = {}

array_words.each_with_index do |valeur, index|
  hash_words[valeur] = array_words.count(valeur)
end

p hash_words
p hash_words.sort_by {|key, value| value}

