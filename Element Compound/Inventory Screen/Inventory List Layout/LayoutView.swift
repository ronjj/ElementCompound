import SwiftUI

struct LayoutView: View {

    var items = Item.stubs
    
    @State var selectedLayout: LayoutType = .single
    @State var searchText = ""
  
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.ruby.edgesIgnoringSafeArea(.all)
                
        VStack {
            HStack {
                Text("Equipment List")
                    .font(.largeTitle)
                    .foregroundColor(.bginv)
                    .fontWeight(.bold)
                
                Image("spaceMan")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 64, height: 64)
                    
                
                Spacer()
            }
            .padding(.top, 30)
            .padding(.bottom, 20)
            .padding(.leading, 20)
            
            
            Picker("Layout Style", selection: $selectedLayout) {
                ForEach(LayoutType.allCases, id: \.self) { type in
                    switch type {
                    case .single:
                        Image(systemName: "list.bullet")
                    case .double:
                        Image(systemName: "square.grid.2x2")
                    }
                }
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.all, 10)
            
           
            SearchBar(text: $searchText)
                .padding(.top, 15)
                .padding(.bottom, 5)
           
            ScrollView {
                LazyVGrid(columns: selectedLayout.columns, spacing: 1, content: {
                    switch selectedLayout {
                    case .single:
                        
                        InventoryLazyVStackView(searchText: $searchText)


                    default:
                        
                        Group{
                            ForEach(MockData.cameras.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { camera in
                                NavigationLink(destination: CameraItemDetailedView5(camera: camera)) {
                                    InventoryIconCellView(images: camera.imageURL, title: camera.name, description: camera.shortDescription, color: Color.nyanza)
     
                                }
                                .padding(5)
                            }
                            
                            
                            ForEach(MockData.lenses.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { lense in
                                NavigationLink(destination: LenseItemDetailedView(lense: lense)) {
                                    InventoryIconCellView(images: lense.imageURL, title: lense.name, description: lense.shortDescription, color: Color.nyanza)
     
                                }
                                .padding(5)
                            }
                            
                            
                            ForEach(MockData.computers.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { computer in
                                NavigationLink(destination: ComputerItemDetailedView(computer: computer)) {
                                    InventoryIconCellView(images: computer.imageURL, title: computer.name, description: computer.shortDescription, color: Color.ruby)
                                }
                            }
                            
                            
                            ForEach(MockData.audios.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { audio in
                                NavigationLink(destination: AudioItemDetailedView(audio: audio)) {
                                    InventoryIconCellView(images: audio.imageURL, title: audio.name, description: audio.shortDescription, color: Color.yellow2)
     
                                }
                                .padding(5)
                            }
                            
                            ForEach(MockData.miscs.filter({ searchText.isEmpty ? true : $0.name.range(of: searchText, options: .caseInsensitive) != nil })) { misc in
                                NavigationLink(destination: MiscItemDetailedView(misc: misc)) {
                                    InventoryIconCellView(images: misc.imageURL, title: misc.name, description: misc.shortDescription, color: Color.independence)
                                }
                                .padding(5)
                            }
                        }
//                        Image("spaceMan")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
                    }
                   
                })
               // .animation(.default)
                .navigationBarHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
            }
            .padding(.top, 1)
                }
            }
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//need case .single: and default: case


//try with one section
