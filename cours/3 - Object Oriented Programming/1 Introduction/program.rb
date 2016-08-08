require "pry-byebug"

def normalize(word)
  return word.strip.capitalize
end

def full_name(first_name, last_name)
  binding.pry
  normalized_first_name = normalize(first_name)
  normalized_last_name = normalize(last_name)
  return "#{normalize_first_name} #{normalize_last_name}"
end

puts full_name("            John", "Lennon")
