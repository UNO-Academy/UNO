//
//  SearchView.swift
//  WhyNot
//
//  Created by Larissa Gomes de Stefano Escaliante on 31/10/22.
//

import SwiftUI

var getLikedStateFromExp = false

struct ExperiencesView: View {
    var body: some View {
        List {
                    Text("cardCell")
                        .swipeActions(edge: .trailing) {
                            Button {
                                print("call done function")
                            } label: {
                                Label("doneActionLabel", systemImage: "flag.fill")
                            } .tint(Color.CustomColor.orangeSwipe)
                        }
                        .swipeActions(edge: .leading) {
                            if(!getLikedStateFromExp){
                                Button {
                                    print("call like function")
                                } label: {
                                    Label("likedActionLabel", systemImage: "heart.fill")
                                } .tint(Color.CustomColor.purpleSwipe)
                            } else{
                                Button {
                                    print("call unlike function")
                                } label: {
                                    Label("uikedActionLabel", systemImage: "heart.slash")
                                } .tint(Color.CustomColor.redSwipe)
                            }
                            
                        }
                }
    }
}

