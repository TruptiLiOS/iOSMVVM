import SwiftUI

struct ModelStatistic: View {
    var value: [(character: Character, count: Int)]
    var followerCount: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(StringValue.totalItems + "\(followerCount)")
                .font(.headline)
            Text(StringValue.topCharacters)
                .font(.headline)
            ForEach(value, id: \.character) { item in
                HStack {
                    Text("• \(item.character)")
                        .font(.title2)
                        .frame(width: 30, alignment: .leading)
                    Text(StringValue.count + "\(item.count)")
                        .font(.body)
                }
            }
            Spacer()
        }
        .padding()
    }
}
