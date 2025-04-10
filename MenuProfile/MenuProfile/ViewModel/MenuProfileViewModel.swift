import UIKit

enum TypeFetch {
    case mock
    case request
}
protocol MenuProfileViewModelDelegate {
    func sucess()
    func error(_ message: String)
}

class MenuProfileViewModel {
    private let service = MenuProfileService()
    private var delegate: MenuProfileViewModelDelegate?
    private var data: [MenuProfile] = []
    
    public func delegate(delegate: MenuProfileViewModelDelegate) {
        self.delegate = delegate
    }
    
    public func fetch(_ type: TypeFetch) {
        switch type {
         case .mock:
            self.service.getMenuFromJson {sucess, error in
                if let sucess = sucess {
                    self.data = sucess.group ?? []
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
         case .request:
            service.getMenu {sucess, error in
                if let sucess = sucess {
                    self.data = sucess.group ?? []
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
}

