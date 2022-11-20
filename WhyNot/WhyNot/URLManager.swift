//
//  URLManager.swift
//  WhyNot
//
//  Created by Fernando Santos on 17/11/22.
//

import Foundation
import SwiftUI

enum URLCases: String {
    case search
    case experience
    case profile
}

enum URLConstants: String {
    case scheme = "whynot://"
    case idSeparator = "?id="
}

class URLManager: ObservableObject {
    @Published var currentTab: Int = 1
    @Published var expirience: String?

    func checkDeepLink(url: URL) {
        // URL Tem essa estrutura: whynot://experience?id=123
        guard let host = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host else { return }

        if host == URLCases.search.rawValue {
            currentTab = 0

        } else if host == URLCases.experience.rawValue {

            currentTab = 1
            guard let query = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems else { return }
            if let value = query[0].value {
                expirience = value
            }
        } else if host == URLCases.profile.rawValue {

            currentTab = 2
        }
    }

    func createDeepLink(host: URLCases, id: String?) -> URL {
        var urlString = URLConstants.scheme.rawValue + host.rawValue
        if let id = id {
            urlString += URLConstants.idSeparator.rawValue + id
        }

        let URL = URL(string: urlString)!
        return URL
    }
}
