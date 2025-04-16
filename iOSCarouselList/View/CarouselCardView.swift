import SwiftUI

struct CarouselCardView: View {
    var imageName: String = ""
    var body: some View{
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(.rect(cornerRadius: 25))
            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
    }
}

#Preview {
    CarouselCardView(imageName: "water1")
}
