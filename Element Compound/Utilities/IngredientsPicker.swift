import SwiftUI

//struct IngredientsPickerView: View {
//        @State var ingredients: [Ingredient] = [Ingredient(name: "Salt"),
//                                                                                        Ingredient(name: "Pepper"),
//                                                                                        Ingredient(name: "Chili"),
//                                                                                        Ingredient(name: "Milk")]
//
//        var body: some View{
//                List{
//                        ForEach(0..<ingredients.count){ index in
//                                HStack {
//                                        Button(action: {
//                                                ingredients[index].isSelected = ingredients[index].isSelected ? false : true
//                                        }) {
//                                                HStack{
//                                                        if ingredients[index].isSelected {
//                                                                Image(systemName: "checkmark.circle.fill")
//                                                                        .foregroundColor(.green)
//                                                                        .animation(.easeIn)
//                                                        } else {
//                                                                Image(systemName: "circle")
//                                                                        .foregroundColor(.primary)
//                                                                        .animation(.easeOut)
//                                                        }
//                                                        Text(ingredients[index].name)
//                                                }
//                                        }.buttonStyle(BorderlessButtonStyle())
//                                }
//                        }
//                }
//        }
//}
//struct Ingredient{
//        var id = UUID()
//        var name: String
//        var isSelected: Bool = false
//}


struct MemberPickerView: View {
        @ObservedObject var viewModel = ProjectViewModel2()
        @State var member: [Member] = [Member(name: "Mr. Luo",
                                              email: "sluo@chaminade-hs.org" ),
                                       
                                       Member(name: "Ronald",
                                       email: "22420rj@chaminade-hs.org" )
                                       
                                       ]
                                                                                      
        
        var body: some View{
                List{
                        ForEach(0..<member.count){ index in
                                HStack {
                                        Button(action: {
                                                member[index].isSelected = member[index].isSelected ? false : true
                                            viewModel.project.assignedStudents.append(member[index].name)
                                        }) {
                                                HStack{
                                                        if member[index].isSelected {
                                                                Image(systemName: "checkmark.circle.fill")
                                                                        .foregroundColor(.green)
                                                                        .animation(.easeIn)
                                                           
                                                        } else {
                                                                Image(systemName: "circle")
                                                                        .foregroundColor(.primary)
                                                                        .animation(.easeOut)
                                                        }
                                                        Text(member[index].name)
                                                }
                                        }.buttonStyle(BorderlessButtonStyle())
                                }
                        }
                }
        }
}
struct Member{
        var id = UUID()
        var name: String
        var email: String
        var isSelected: Bool = false
}

