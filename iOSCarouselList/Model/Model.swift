import Foundation

struct ListModel: Identifiable, Hashable {
    var id = UUID()
    var title:String
    var subtitle: String
    var imageName: String
}

