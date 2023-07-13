#Solve expression

def resoudre_expression(expression)
    # Étape 1 : Supprimez les espaces de l'expression
    expression = expression.gsub(" ", "")
    operateurs = ['+', '-', '*', '/', '%']
  
    # Étape 2 : Trouvez et résolvez les parenthèses les plus internes
    while expression.include?('(')
      parenthese_ouverte_index = expression.rindex('(')
      parenthese_fermee_index = expression.index(')', parenthese_ouverte_index)
      sous_expression = expression[(parenthese_ouverte_index + 1)...parenthese_fermee_index]
      p sous_expression
      resultat_sous_expression = resoudre_expression(sous_expression)
  
      expression.sub!(sous_expression, resultat_sous_expression.to_s)
    end
  
    # Étape 3 : Résolvez les opérations de multiplication et de division de gauche à droite
    while expression.include?('*') || expression.include?('/')      
      pattern = /(\d+[*\/]\d+)/
      match = expression.match(pattern)
      short_expression = match[1] if match
      multiplicatif_index = short_expression.index('*') || short_expression.index('/')
      nombre1 = short_expression[0...multiplicatif_index].to_i
      operateur = short_expression.slice(multiplicatif_index)
      nombre2 = short_expression[(multiplicatif_index + 1)...short_expression.length].to_i
  
      resultat = case operateur
                 when '*'
                   nombre1 * nombre2
                 when '/'
                   nombre1 / nombre2
                 end

      expression.sub!(short_expression, resultat.to_s)
    end
  
    # Étape 4 : Résolvez les opérations d'addition et de soustraction de gauche à droite
    while expression.include?('+') || expression.include?('-')
      pattern = /(\d+[+\-]\d+)/
      match = expression.match(pattern)
      short_expression = match[1] if match
      operator_index = short_expression.index('+') || short_expression.index('-')
      nombre1 = short_expression[0...operator_index].to_i
      operateur = short_expression.slice(operator_index)
      nombre2 = short_expression[(operator_index + 1)...short_expression.length].to_i
  
      resultat = case operateur
                 when '+'
                   nombre1 + nombre2
                 when '-'
                   nombre1 - nombre2
                 end
      expression.sub!(short_expression, resultat.to_s)
    end
  
    # Étape 5 : Le résultat final est le seul élément restant dans l'expression
    resultat_final = expression.to_i
    puts "Le résultat est : #{resultat_final}"
end

# Appel de la fonction avec l'expression à résoudre
resoudre_expression("4 + 21 * 38 + (1+1)")  # Exemple avec priorité de multiplication
  

def resoudre_operation(number1, operator, number2)
    # Étape 1 : Séparez les différents éléments de l'opération

    # elements = operation.split(" ") #!!!!ATTENTION!!!!!
  
    # Étape 2 : Vérifiez l'opérateur et effectuez l'opération appropriée
    resultat = case operator
               when "+"
                 number1.to_i + number2.to_i
               when "-"
                 number1.to_i - number2.to_i
               when "*"
                 number1.to_i * number2.to_i
               when "/"
                 number1.to_i / number2.to_i
               when "%"
                 number1.to_i % number2.to_i
               else
                 puts "Opérateur invalide"
                 return
               end
  
    # Étape 3 : Affichez le résultat
    puts "Le résultat est : #{resultat}"
end

# resoudre_operation(ARGV[0], ARGV[1], ARGV[2])
# resoudre_operation("2","*","10")

def test (expression)
  pattern = /(\d+\*\d+)/
  match = expression.match(pattern)
  result = match[1] if match
  puts result
end

# test("2+4*60+5")
