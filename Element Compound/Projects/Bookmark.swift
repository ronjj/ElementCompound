//
//  Favorites.swift
//  Element Compound
//
//  Created by Ronald Jabouin on 6/27/21.
//

import SwiftUI

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

//import SwiftUI
//
//@MainActor
//class ProjectBookmarkViewModel: ObservableObject {
//
//    @Published private(set) var bookmarks: [Project] = []
//     let bookmarkStore = PlistDataStore<[Project]>(filename: "bookmarks")
//    
//    static let shared = ProjectBookmarkViewModel()
//     init() {
//        async {
//            await load()
//        }
//    }
//    
//     func load() async {
//        bookmarks = await bookmarkStore.load() ?? []
//    }
//    
//    func isBookmarked(for project: Project) -> Bool {
//        bookmarks.first { project.id == $0.id } != nil
//    }
//    
//    func addBookmark(for project: Project) {
//        guard !isBookmarked(for: project) else {
//            return
//        }
//
//        bookmarks.insert(project, at: 0)
//        bookmarkUpdated()
//    }
//    
//    func removeBookmark(for project: Project) {
//        guard let index = bookmarks.firstIndex(where: { $0.id == project.id }) else {
//            return
//        }
//        bookmarks.remove(at: index)
//        bookmarkUpdated()
//    }
//    
//     func bookmarkUpdated() {
//        let bookmarks = self.bookmarks
//        async {
//            await bookmarkStore.save(bookmarks)
//        }
//    }
//}
