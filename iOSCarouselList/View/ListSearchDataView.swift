import SwiftUI

struct ListSearchDataView: View {
    @StateObject var viewmodel: ViewModel
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            lazyVStackList
        }
    }
    
    var lazyVStackList: some View {
        VStack {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Section(header: pinnedSearchBar) {
                    rowView
                }
            }
        }
        .padding()
    }
    
    
    @ViewBuilder
    var rowView: some View {
        ForEach(viewmodel.itemsSearched, id: \.self) { value in
            HStack {
                Image(value.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(.all, 5)
                VStack(alignment: .leading) {
                    Text(value.title)
                        .fontWeight(.bold)
                    Text(value.subtitle)
                }
                Spacer()
                
            }
            .frame( maxWidth: .infinity)
            .background(.green.opacity(0.3))
            .clipShape(.rect(cornerRadius: 15))
        }
    }
    
    var pinnedSearchBar: some View {
        ZStack {
            Color.white
            HStack {
                Image(systemName: Images.magnifyingglass)
                TextField(StringValue.search, text: $viewmodel.searchText)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}
