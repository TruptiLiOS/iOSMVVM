struct Utility {
    static func topCharacterTobeReturn(modelArray: [ListModel], characterCountTobeReturn: Int = 3) -> [(character: Character, count: Int)] {
        let allCharacters = modelArray.map(\.title).joined().lowercased()
        var charCount: [Character: Int] = [:]
        
        for char in allCharacters where char.isLetter {
            charCount[char, default: 0] += 1
        }
        
        let topCharacters = charCount
            .sorted { $0.value > $1.value }
            .prefix(characterCountTobeReturn)
            .map { (character: $0.key, count: $0.value) }
        return topCharacters
    }
}
