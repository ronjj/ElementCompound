//
//  AnnounceAddView.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 4/23/21.
//

import SwiftUI

struct AnnounceAddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var announcements: Announcements
    @State var text = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter Message", text: $text)
            }
            .navigationTitle("Create Announcement")
                .font(.body)
            .navigationBarItems(trailing:
                Button(action: {
                    let item = AnnouncementItem(text: self.text)
                    self.announcements.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            )
        }
    }
    
    struct AnnounceAddView_Previews: PreviewProvider {
        static var previews: some View {
            AnnounceAddView( announcements: Announcements())
        }
    }
}
