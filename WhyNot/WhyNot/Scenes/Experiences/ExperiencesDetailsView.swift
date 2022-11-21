//
//  ExperiencesDetailsView.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 14/11/22.
//

import SwiftUI

struct ExperiencesDetailsView: View {
    @State private var experienceTitle: String = "Jump jump"
    @State private var isExperienceDone: Bool = false
    @State private var isIconEnabled: Bool = true
    @State private var isLiked: Bool = true
    let safetySpace = 36.0
    let iconBtnSize = 22.0
    let categoryIconWidth = 224.0
    
    var body: some View {
        
        VStack (alignment: .center) {
            
            HStack {
                LikeButton(isLiked: $isLiked )
                    .font(.system(size: iconBtnSize))
                
                Spacer()
                
                Text(experienceTitle)
                    .font(Font.custom(CustomFonts.SolidThemeFont, size: FontSize.title3))
                
                Spacer()
                
                // TODO: Remove this button mock and add shareButton component here
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
                .font(.system(size: iconBtnSize))
                .foregroundColor(Color.CustomColors.ClicableColor)
            }
            
            Spacer().frame( height: Space.space2x)
            
            CategoryIcon(type: .adventure, isEnable: $isIconEnabled)
                .frame(width: categoryIconWidth)
            
            Spacer().frame( height: Space.space2x)
            
            DoneButton(isExperienceDone: $isExperienceDone, isIconEnabled: $isIconEnabled, experienceTitle: $experienceTitle)
            
            Spacer()
        }
        .padding([.leading, .trailing], safetySpace)
        
    }
    
}
