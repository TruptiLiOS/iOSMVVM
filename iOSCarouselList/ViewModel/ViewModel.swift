
import Foundation

enum ListType: Int, Hashable, CaseIterable {
    case flower
    case waterfall
    case animals
}

class ViewModel: ObservableObject {
    
    @Published var searchText = ""
    var listDataModel: [ListModel] = []
    
    var itemsSearched: [ListModel] {
        if searchText.isEmpty {
            return listDataModel
        } else {
            return listDataModel.filter({$0.title.localizedCaseInsensitiveContains(searchText) || $0.subtitle.localizedCaseInsensitiveContains(searchText)})
        }
    }
    
    var flowersData =  [
        ListModel(title: "Rose", subtitle: "aa", imageName: "a"),
        ListModel(title: "Turlip", subtitle: "bb", imageName: "b"),
        ListModel(title: "Lily", subtitle: "cc", imageName: "c"),
        ListModel(title: "Orchid", subtitle: "dd", imageName: "d"),
        ListModel(title: "Daisy", subtitle: "ee", imageName: "e"),
        ListModel(title: "Jasmine", subtitle: "ff", imageName: "f"),
        ListModel(title: "Iris", subtitle: "gg", imageName: "g"),
        ListModel(title: "Rose child", subtitle: "aa", imageName: "a"),
        ListModel(title: "Turlip child", subtitle: "bb", imageName: "b"),
        ListModel(title: "Lirly child", subtitle: "cc", imageName: "c"),
        ListModel(title: "Orrchid child", subtitle: "dd", imageName: "d"),
        ListModel(title: "Daisy child", subtitle: "ee", imageName: "e"),
        ListModel(title: "Jasrmine child", subtitle: "ff", imageName: "f"),
        ListModel(title: "Iris child", subtitle: "gg", imageName: "g")
    ]
    
    var waterfallsData =  [
        ListModel(title: "Dudhsagar", subtitle: "aa", imageName: "water1"),
        ListModel(title: "Goa", subtitle: "bb", imageName: "water2"),
        ListModel(title: "Nohkalikai", subtitle: "cc", imageName: "water3"),
        ListModel(title: "Jog", subtitle: "dd", imageName: "water4"),
        ListModel(title: "Chachai", subtitle: "ee", imageName: "water5"),
        ListModel(title: "Rudra Nag", subtitle: "ff", imageName: "water6"),
        ListModel(title: "Hogenakkal", subtitle: "gg", imageName: "water7")
    ]
    
    var animalsData =  [
        ListModel(title: "Giraffe", subtitle: "aa", imageName: "animals1"),
        ListModel(title: "Tiger", subtitle: "bb", imageName: "animals2"),
        ListModel(title: "Bear", subtitle: "cc", imageName: "animals3"),
        ListModel(title: "Chimpanzee", subtitle: "dd", imageName: "animals4"),
        ListModel(title: "Crocodile", subtitle: "ee", imageName: "animals5"),
        ListModel(title: "Elephant", subtitle: "ff", imageName: "animals6"),
        ListModel(title: "Lion", subtitle: "gg", imageName: "animals7")
    ]
    
    var carouselImages: [[ListModel]] {
        return [flowersData, waterfallsData, animalsData]
    }
    
    var listModelDataCount: Int {
        return listDataModel.count
    }
    
    func setDataModel (type: ListType) {
        switch type {
        case .flower:
            listDataModel  = flowersData
        case .animals:
            listDataModel  = animalsData
        case .waterfall:
            listDataModel  = waterfallsData
        }
    }

    func dataFirstImageInlist(_ list: [ListModel]) -> String {
        list.first?.imageName  ?? ""
    }
    
    func topChars(list: [ListModel]) -> [(character: Character, count: Int)] {
        Utility.topCharacterTobeReturn(modelArray: listDataModel)
    }
}
