require 'faker'
user = User.first

5.times {
  user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)
  user.password = "password"
  user.save
}

deck_sets = {
deck_1: [["What is the medical term for a nosebleed", "Epistaxis"], ["Captain Matthew Webb was the first person to do what", "Swim the Channel"], ["What is the oldest University in Britain", "Oxford"], ["Which person has won the most Oscars", ""], ["What is the chemical name for table salt", "Sodium Chloride"], ["Hippophobia is the fear of which creatures", "Horses"], ["What name was given to the original Space Shuttle", "Columbia"], ["Who said \"Genius is 1% inspiration and 99% persperation\"", "Thomas Edison"]],
deck_2: [["Which writer lived from 1564-1616", "William Shakespeare"], ["Which airship infamously exploded over New York State in 1937", "Hindenburg"], ["What is the biggest selling car of all time", "Toyota Corolla"], ["What was the first UK No1 single for Elvis Presley", "All Shook Up"], ["How many time zones are there in China", "One"], ["How many spots are there on a pair of dice", "42"], ["The first stretch of motorway in Britain bypassed which town", "Preston"], ["The art of paper folding is known correctly as what", "Oregami"], ["What is the longest river in the British Isles", "Shannon"], ["What was the name of Sherlock Holmes' housekeeper", "Mrs Hudson"]],
deck_3: [["Who is Britain longest reigning Monarch", "Victoria"], ["On what street is the Bank of England", "Threadneedle Street"], ["Who was the 2nd man to step foot on the Moon", "Buzz Aldrin"], ["Who was the first ever DJ on Radio 1", "Tony Blackburn"], ["Who was the oldest man in the Bible", "Methuselah"], ["Which country has the worlds only non-rectangular flag", "Nepal"], ["Mozzarella cheese is made from which animal", "Buffalo"], ["Jorn Utzon designed which famous building", "Sydney Opera House"], ["Kathmandu is the capital of which country", "Nepal"], ["Sabena is the national airline of which country", "Belgium"]],
deck_4: [["In computing what does ROM stand for", "Read Only Memory"], ["Tanks were first used in which Battle", "Battle of the Somme"], ["In what year did the Titanic sink", "1912"], ["Which King was the target of the Gunpowder Plot", "James I"], ["WWI spy Mata Hari was what nationality", "Dutch"], ["The Tulip originated in which modern day country", "Turkey"], ["Which ancient region translates as 'Land Between Two Rivers'", "Mesopotamia"], ["The Ugli fruit is a cross between which 3 fruits", "Tangerine, Seville Orange and Grapefruit"], ["In what year was the first FA Cup Final", "1872"], ["From which Flower is the spice Saffron obtained", "Crocus"]],
deck_5_doable: [["question1","answer1"],["question2","answer2"],["question3","answer3"]],
deck_6: [["A peanut is not a nut at all, what type of food is it", "Legume"], ["Which company featured in the Wile E Coyote and Roadrunner cartoons", "Acme"], ["Who was the 16th President of the USA", "Abraham Lincoln"], ["Who designed the Mini car", "Alec Issigonis"], ["Apart from the Sun, what is the nearest star to Earth", "Proxima Centauri"], ["Who was Britain's first Prime Minster", "Robert Walpole"], ["In which year was the Russian Revolution", "1917"], ["Where does the famous Passion Play take place in Germany every 10 Years", "Oberammagau"], ["Who wrote the book The Godfather", "Mario Puzo"], ["Bulls Blood Wine is from which country", "Hungary"]],
deck_7: [["Juniper is a key ingredient of which spirit", "Gin"], ["Who composed the Planet Suite", "Gustav Holst"], ["Which jazz musician was nicknamed 'Bird'", "Charlie Parker"], ["How many bones are there in the adult human body", "206"], ["In which TV show does Santa's Little Helper appear", "The Simpsons"], ["What is the collective noun for a group of Rhino", "Crash"], ["What is the name of Christopher Columbus' Flagship", "Santa Maria"], ["The Australian slang word 'Cobber' is translated as what in English", "Friend"], ["Which Alfred Hitchcock movie ends with a scene on Mount Rushmore", "North by Northwest"], ["Which tiny country is found nestled between France and Spain", "Andorra"]],
deck_8: [["Which musician's real name is Marshal Mathers", "Eminem"], ["Which artist painted Sun Flowers", "Van Gogh"], ["Who invented the Miners safety lamp and discovered the chemical element Sodium", "Humphry Davy"], ["How many Bits are there in a Byte", "8"], ["Which band had a famous album cover featuring Battersea Power Station", "Pink Floyd"], ["In which part of the body is the Stirrup Bone", "In the Ear"], ["What is the highest mountain in the USA", "Mount McKinley"], ["All but two of the moons of Uranus are named after what", "Shakespearean Characters"], ["How many pieces make up a Domino set", "28"], ["The Company 'Steiff' famously make what", "Teddy Bears"]],
deck_9: [["What was the popular nickname for the Model T Ford", "Tin Lizzie"], ["Who infamously lived at 25 Cromwell Street, Gloucester", "Fred and Rose West"], ["What was the first James Bond novel", "Casino Royale"], ["Who broke into the Queen's bedroom in 1982", "Michael Fagin"], ["Who invented the Polaroid camera", "Edwin Land"], ["What is the motto of the SAS", "Who Dares Wins"], ["Which alcoholic drink once advertised itself as 'Being Good for You'", "Guinness"], ["What are the three main types of Greek architecture", "Doric, Ionic and Corinthian"], ["Which French brothers' are credited with early developments in film and photography", "Lumiere"], ["The song 'You'll Never Walk Alone' comes from which musical", "Carousel"]],
deck_10: [["What is the first name of Agatha Christie's detective Miss Marple", "Jane"], ["What type of wood did Thomas Chippendale mostly work with", "Mahogany"], ["An Isobar on a weather map links places with equal what", "Pressure"], ["Halleys Comet is visible from Earth in a cycle of how many years", "76"], ["London Zoo is situated in which park", "Regents"], ["Who was the first man to break the four minute mile", "Roger Bannister"], ["In which year did Concorde make its maiden commercial flight", "1976"], ["What is the Jewish Festival of New Year called", "Rosh Hashanaah"], ["What is the national religion of Japan", "Shintoism"], ["What was the name of the aircraft which dropped the atom bomb on Hiroshima", "Enola Gay"]]
}

count = 0
user = 1
deck_sets.each do |deck_name, cards|
  if count == 2
    user += 1
    count = 0
  end
    deck = Deck.create(name: deck_name.to_s, user_id: user)
    cards.each {|card| deck.cards << Card.create(question: card[0], answer: card[1]) }
  count += 1
end

