//
//  Endpoint.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation

enum Endpoint {
    case bongoDisclaimer
}

extension Endpoint {
    var url: URL {
        switch self {
        case .bongoDisclaimer:
            return .makeEndpointFor("/disclaimer")
        }
    }
}

private extension URL {
    static func makeEndpointFor(_ endpoint: String) -> URL {
        return URL(string: "https://bongobd.com\(endpoint)")!
    }
}
