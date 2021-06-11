////
////  CameraDetailView2.swift
////  Element Compound
////
////  Created by Ronald Jabouin on 5/11/21.
////
//
////Deprecated
//
//import SwiftUI
//
//struct CameraDetailView2: View {
//    
//    let camera: CameraItem
//    
//    var body: some View {
//        NavigationView{
//                ZStack{
//                    Color(.black)
//                        .edgesIgnoringSafeArea(.all)
//         
//                    ScrollView(showsIndicators: false){
//                        ProductView(camera: camera)
//                        Spacer()
//                        CardView(camera: camera)
//                            .offset(y:-30)
//           }
//                .edgesIgnoringSafeArea(.all)
//        }
//        .navigationBarTitle("", displayMode: .inline)
//        .navigationBarHidden(true)
//        .edgesIgnoringSafeArea(.all)
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//
////Make into seperate file
//struct ProductView: View {
//    let camera: CameraItem
//    var body: some View {
//        VStack{
//           
//            VStack(alignment: .center, spacing: 20) {
//                Image(camera.bigImageURL)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(maxWidth: .infinity)
//                    .edgesIgnoringSafeArea(.all)
//            
//        }
//        .frame(width: UIScreen.main.bounds.width)
//        .edgesIgnoringSafeArea(.all)
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct CardView: View {
//    let camera: CameraItem
//    @State private var quantity = 1
//
//    var body: some View {
//        
//        VStack{
//            VStack(alignment: .leading, spacing: 20) {
//                Text(camera.name)
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                
//                Text(camera.longDescription)
//                    .lineLimit(nil)
//                    .fixedSize(horizontal: false, vertical: true)
//                    .font(.body)
//                    .multilineTextAlignment(.leading)
//                    .padding(.bottom, 20)
//                 
//                Text("Tutorials for \(camera.name)")
//                Rectangle()
//                Rectangle()
//            
//        }
//        .frame(maxWidth: .infinity,  alignment: .leading)
//        .frame(height: UIScreen.main.bounds.height)
//        .padding()
//        .background(Color(.systemBackground))
//        .cornerRadius(30)
//        }
//    }
//}
//
////it's probably one of the paddings. if not, need to make them overlay each other
//
