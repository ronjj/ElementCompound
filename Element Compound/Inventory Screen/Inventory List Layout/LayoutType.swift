import SwiftUI

enum LayoutType:  CaseIterable {
    case single
    case double
   
}

extension LayoutType {
    
    var columns: [GridItem] {
        switch self {
        case .single:
            return [
                GridItem(.flexible(), spacing: 0)
            ]
            
        case .double:
            return [
                GridItem(.flexible(), spacing: 1),
                GridItem(.flexible(), spacing: 1)
            ]
            
        }
    }
    
}
