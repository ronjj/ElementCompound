
import SwiftUI
import AVKit

struct AudioItemDetailedView: View {
    
    let audio: AudioItem
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ZStack{
                GeometryReader{ reader in
                    if  reader.frame(in: .global).minY > -480 {
                        AsyncImage(url: URL(string: "\(audio.bigImageURL)" ) ?? URL(string: "www.apple.com")!,
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
                Text(audio.name)
                    .font(.system(size: 35, weight: .bold))
                    .padding(10)
                    .foregroundColor(.white)

                Text(audio.longDescription)
                    .padding(10)
                    .padding(.horizontal, 10)
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                
                VStack(alignment: .center){
                    Link(destination: URL(string: "https://www.google.com")!, label: {
                        Label(title: {
                            Text("Rent on Reftab")
                                .bold()
                        },
                              icon: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 22, weight: .bold, design: .default))
                        })
                            .frame(width: 250,
                                   height: 50,
                                   alignment: .center)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    
                    })
                }
                
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

