//
//  Favorites.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/27/21.
//

//import SwiftUI
//
//class Favorites: ObservableObject {
//    private var projects: Set<String>
//
//    private var saveKey = "Favorites"
//
//    init() {
//        self.projects = []
//    }
//
//    func contains(_ project: Project) -> Bool {
//        projects.contains(project.id!)
//    }
//
//    func add(_ project: Project) {
//        objectWillChange.send()
//        projects.insert(project.id!)
//        save()
//    }
//
//    func remove (_ project: Project) {
//        objectWillChange.send()
//        projects.remove(project.id!)
//        save()
//    }
//
//    func save() {
//
//    }
//}
