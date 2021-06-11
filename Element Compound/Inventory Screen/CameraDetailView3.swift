//import SwiftUI
//
//struct CameraDetailView3: View {
//    
//    let camera: CameraItem
//    
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            GeometryReader { geometry in
//                ZStack {
//                    if geometry.frame(in: .global).minY <= 0 {
//                        Image(camera.bigImageURL)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: geometry.size.width, height: geometry.size.height)
//                        .offset(y: geometry.frame(in: .global).minY/9)
//                        .clipped()
//                    } else {
//                        Image(camera.bigImageURL)
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
//                            .clipped()
//                            .offset(y: -geometry.frame(in: .global).minY)
//                    }
//                }
//            }
//                .frame(height: 400)
//            VStack(alignment: .leading) {
//                HStack {
//                    Image("author")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 60, height: 60)
//                        .clipped()
//                        .cornerRadius(10)
//                    VStack(alignment: .leading) {
//                        Text("Article by")
//                            .font(.custom("AvenirNext-Regular", size: 15))
//                            .foregroundColor(.gray)
//                        Text("John Doe")
//                            .font(.custom("AvenirNext-Demibold", size: 15))
//                    }
//                    .cornerRadius(20)
//                    
//                }
//                    .padding(.top, 20)
//                Text("Lorem ipsum dolor sit amet")
//                    .font(.custom("AvenirNext-Bold", size: 30))
//                    .lineLimit(nil)
//                    .padding(.top, 10)
//                Text("3 min read • 22. November 2019")
//                    .font(.custom("AvenirNext-Regular", size: 15))
//                    .foregroundColor(.gray)
//                    .padding(.top, 10)
//                Text(camera.longDescription)
//                    .font(.custom("AvenirNext-Regular", size: 20))
//                    .lineLimit(nil)
//                    .padding(.top, 30)
//            }
//                
//                .frame(width: 350)
//                //.cornerRadius(30)
//
//        }
//            .edgesIgnoringSafeArea(.top)
//           
//    }
//}
