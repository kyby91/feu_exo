#Solve expression

# def resoudre_expression(expression)
#     # Étape 1 : Supprimez les espaces de l'expression
#     expression = expression.gsub(" ", "")
#     operateurs = ['+', '-', '*', '/', '%']
  
#     # Étape 2 : Trouvez et résolvez les parenthèses les plus internes
#     while expression.include?('(')
#       parenthese_ouverte_index = expression.rindex('(')
#       parenthese_fermee_index = expression.index(')', parenthese_ouverte_index)
#       sous_expression = expression[(parenthese_ouverte_index + 1)...parenthese_fermee_index]
#       resultat_sous_expression = resoudre_expression(sous_expression)
  
#       expression[parenthese_ouverte_index..parenthese_fermee_index] = resultat_sous_expression.to_s
#     end
  
#     # Étape 3 : Résolvez les opérations de multiplication et de division de gauche à droite
#     while expression.include?('*') || expression.include?('/')
#       multiplicatif_index = expression.index('*') || expression.index('/')
#       nombre1_index = multiplicatif_index - 1
#       nombre2_index = multiplicatif_index + 1
  
#       nombre1 = expression.slice(nombre1_index).to_i
#       operateur = expression.slice(multiplicatif_index)
#       nombre2 = expression.slice(nombre2_index).to_i
  
#       resultat = case operateur
#                  when '*'
#                    nombre1 * nombre2
#                  when '/'
#                    nombre1 / nombre2
#                  end
  
#       sous_expression = expression.slice(nombre1_index..nombre2_index)
#       expression.sub!(sous_expression, resultat.to_s)
#     end
  
#     # Étape 4 : Résolvez les opérations d'addition et de soustraction de gauche à droite
#     while expression.include?('+') || expression.include?('-')
#       additif_index = expression.index('+') || expression.index('-')
#       nombre1_index = additif_index - 1
#       nombre2_index = additif_index + 1
  
#       nombre1 = expression.slice(nombre1_index).to_i
#       operateur = expression.slice(additif_index)
#       nombre2 = expression.slice(nombre2_index).to_i
  
#       resultat = case operateur
#                  when '+'
#                    nombre1 + nombre2
#                  when '-'
#                    nombre1 - nombre2
#                  end
  
#       sous_expression = expression.slice(nombre1_index..nombre2_index)
#       expression.sub!(sous_expression, resultat.to_s)
#     end
  
#     # Étape 5 : Le résultat final est le seul élément restant dans l'expression
#     resultat_final = expression.to_i
#     puts "Le résultat de #{expression} est : #{resultat_final}"
# end

# # Appel de la fonction avec l'expression à résoudre
# resoudre_expression("5 + 3 * 2 + (4 * 4 / 2)")  # Exemple avec priorité de multiplication
  

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

resoudre_operation(ARGV[0], ARGV[1], ARGV[2])