struct WordGenerator {
    static let vowels = ["a", "e", "i", "o", "u"]
    static let consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    
    static func generate() -> String {
        // a e i o u
        // b c d e f g...
        // No vowels togethers
            // V2. (exceptions oo, ee)
        // No more than 3 consonants together
        // Lenght 2 to 10
            // V2. Random start (vowel or consonant)
        
        // -----
        // Set a random lenght
        
        // Grab one random vowel
        // Add to the array
        // Grab one random consonant
        // Add to the array
        
        // If it fits the lenght
            // Return

        let lenght = Int.random(in: 2..<10)
        var word = ""
        
        while word.count < lenght {
            let randomConsonantIndex = Int.random(in: 0..<WordGenerator.vowels.count)
            let randomConsonant = WordGenerator.consonants[randomConsonantIndex]
            let randomVowelIndex = Int.random(in: 0..<WordGenerator.vowels.count)
            let randomVowel = WordGenerator.vowels[randomVowelIndex]
            word = word + randomConsonant + randomVowel
        }

        return word
    }
}
