//
//  LikeButton.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 21/11/22.
//

import SwiftUI

struct LikeButton: View {
    
    @Binding var isLiked: Bool
    
    var body: some View {
        Button(action: {
            // TODO: add like request here
            isLiked = !isLiked
        }) {
            Image(systemName: isLiked ? "heart.fill" : "heart")
        }
        .foregroundColor(Color.CustomColors.ClicableColor)
    }
    
}

private struct LikeButtonPreviewHelper: View {
    
    @State var isLiked: Bool
    
    var body: some View {
        LikeButton(isLiked: $isLiked)
    }
    
}

struct LikeButton_Previews: PreviewProvider {
    
    static var previews: some View {
        LikeButtonPreviewHelper(isLiked: true)
    }
    
}
