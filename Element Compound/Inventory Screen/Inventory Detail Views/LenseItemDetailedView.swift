
import SwiftUI
import AVKit

struct LenseItemDetailedView: View {
    
    let lense: LenseItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ZStack{
                GeometryReader{ reader in
                    if  reader.frame(in: .global).minY > -480 {
                        AsyncImage(url: URL(string: "\(lense.bigImageURL)" ) ?? URL(string: "www.apple.com")!,
                                       placeholder: {
                            LoadingView()
                        },
                                       image: {
                                Image(uiImage: $0).resizable() })
                                    .aspectRatio(contentMode: .fill)
                                    .offset(y: -reader.frame(in: .global).minY)
                                    .frame(width: UIScreen.screenWidth*1.07, height:
                                            reader.frame(in: .global).minY > 0 ?
                                            reader.frame(in: .global).minY + 480 : 480)
     
                    }
                    HStack {
                        Button(action: { self.presentationMode.wrappedValue.dismiss() },
                               label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width:30, height: 30)
                              Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                            }
                        })
                    }
                    .padding(.horizontal, 24).padding(.top, 46)
                }
                .frame(height:480)
            }
            
            VStack {
                Text(lense.name)
                    .font(.system(size: 35, weight: .bold))
                    .padding(10)
                    .foregroundColor(.white)

                Text(lense.longDescription)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                
                Rectangle()
                    .frame(width: UIScreen.screenWidth, height: 150 )
                    .foregroundColor(Color.black)
            }
            .padding(.top,25)
            .background(Color.black)
            .cornerRadius(30)
            .frame(maxWidth: .infinity)
            .offset(y: -30)
        })
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

