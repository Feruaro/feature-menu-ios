//
//  MenuProfileViewModel.swift
//  MenuProfile
//
//  Created by Fernanda Ayres Ruaro on 26/03/25.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

class MenuProfileViewModel {
    private let service = MenuProfileService()
    
    public func fetch(_ type: TypeFetch) {
        switch type {
         case .mock:
            self.service.getMenuFromJson {sucess, error in
                print(sucess)
            }
         case .request:
            break
        }
    }
}

