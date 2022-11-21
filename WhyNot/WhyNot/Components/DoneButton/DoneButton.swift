//
//  DoneButton.swift
//  WhyNot
//
//  Created by Ercília Regina Silva Dantas on 21/11/22.
//

import SwiftUI

struct DoneButton: View {
    
    @State private var showingConfirmAlert: Bool = false
    @Binding var isExperienceDone: Bool
    @Binding var isIconEnabled: Bool
    @Binding var experienceTitle: String
    let buttonHeight = 44.0
    
    var body: some View {
        
        Button(action: {
            showingConfirmAlert = true
        }) {
            Label(isExperienceDone ? "doneButtonDisabled" : "doneButton",
                  systemImage: isExperienceDone ? "flag.2.crossed.fill" : "flag.fill")
            .font(Font.body.bold())
            .frame(height: buttonHeight, alignment: .center)
            .frame(maxWidth: .infinity)
        }
        .foregroundColor(.white)
        .background(isExperienceDone ? Color.CustomColors.doneDisabledBtn : Color( UIColor.systemOrange))
        .cornerRadius(Radius.halfRadius)
        .disabled(isExperienceDone)
        .alert(isPresented: $showingConfirmAlert) {
            Alert(title: Text(experienceTitle),
                  message: Text("alertConfirmationMessage"),
                  primaryButton: .default(Text("yesButton")){
                // TODO: add done request here
                isExperienceDone = !isExperienceDone
                isIconEnabled = !isIconEnabled
            },
                  secondaryButton: .cancel())
        }
        
    }
    
}

private struct DoneButtonPreviewHelper: View {
    
    @State var isExperienceDone: Bool
    @State var isIconEnabled: Bool
    @State var experienceTitle: String
    
    var body: some View {
        DoneButton(isExperienceDone: $isExperienceDone, isIconEnabled:$isIconEnabled, experienceTitle: $experienceTitle)
    }
    
}

struct DoneButton_Previews: PreviewProvider {
    
    static var previews: some View {
        DoneButtonPreviewHelper(isExperienceDone: false, isIconEnabled: true, experienceTitle: "Jump Jump")
    }
    
}
