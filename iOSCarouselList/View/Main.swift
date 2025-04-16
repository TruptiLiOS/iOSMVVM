import SwiftUI

struct MainView: View {
    @State private var index: ListType = .flower
    @State private var showingCredits = false
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    carouselView
                    listDataView
                }
                .navigationTitle(StringValue.navigationTitle)
                
                floatingButton
            }
        }
    }
    
    var carouselView: some View {
        VStack  {
            TabView(selection: $index) {
                ForEach((ListType.allCases), id: \.self) { value in
                    CarouselCardView(imageName: viewModel.dataFirstImageInlist(viewModel.carouselImages[value.rawValue]))
                        .tag(value)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            HStack(spacing: 2) {
                ForEach((viewModel.carouselImages.indices), id: \.self) { index in
                    Circle()
                        .fill(index == self.index.rawValue ? Color.purple : Color.purple.opacity(0.5))
                        .frame(width: 20, height: 20)
                }
            }
        }
        .frame(height: 200)
    }
    
    var listDataView: some View {
        viewModel.setDataModel(type: self.index)
        return ListSearchDataView(viewmodel: viewModel)
    }
    
    var floatingButton: some View {
        Button {
            showingCredits.toggle()
        } label: {
            Image(systemName: Images.plus)
                .font(.title.weight(.semibold))
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .clipShape(Circle())
        }
        .padding()
        .sheet(isPresented: $showingCredits) {
            VStack(content: {
                modelStatistic()
            })
            .presentationDetents([.height(300)])
        }
    }
    
    @ViewBuilder
    func modelStatistic() -> some View {
        let topChars = viewModel.topChars(list: viewModel.listDataModel)
        ModelStatistic(value: topChars, followerCount: viewModel.listModelDataCount)
    }
}

#Preview {
    MainView()
}
