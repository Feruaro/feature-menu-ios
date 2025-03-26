//
//  GenericService.swift
//  MenuProfile
//
//  Created by Fernanda Ayres Ruaro on 26/03/25.
//

import UIKit

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingfailed(name: String, Swift.Error)
}
