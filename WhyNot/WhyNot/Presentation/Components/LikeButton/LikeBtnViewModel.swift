//
//  LikeBtnViewModel.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 22/11/22.
//

import SwiftUI

class LikeBtnViewModel: ObservableObject {
    @Published var isLiked: Bool

    var btnIcon: String { isLiked ? Icons.heartFill : Icons.heart }

    init(isLiked: Bool) {
        self.isLiked = isLiked
    }

    func onLikeSuccess() {
        // TODO: add like request here
        self.isLiked = !isLiked
    }
}
