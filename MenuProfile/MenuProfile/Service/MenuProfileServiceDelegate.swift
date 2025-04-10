import UIKit
import Alamofire

protocol MenuProfileServiceDelegate: GenericService {
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>)
}

class MenuProfileService: MenuProfileServiceDelegate {
    func getMenu(completion: @escaping completion<MenuProfileGroup?>) {
        let url: String = "https://run.mocky.io/v3/9ab8bb0b-4cc0-4bd5-8520-de94a0153b8c"
        
        AF.request(url, method: .get).validate().responseDecodable(of: MenuProfileGroup.self) { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>) {
        if let url = Bundle.main.url(forResource: "menuProfileMock", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let menu: MenuProfileGroup = try JSONDecoder().decode(MenuProfileGroup.self, from: data)
                
                completion(menu, nil)
            } catch {
                completion(nil, Error.fileDecodingfailed(name: "menuProfileMock", error))
            }
        }
    }
}
