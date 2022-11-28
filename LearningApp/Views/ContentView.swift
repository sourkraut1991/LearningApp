//
//  ContentView.swift
//  LearningApp
//
//  Created by ed on 11/28/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        ScrollView {
            LazyVStack {
                
                //Confirm the currentModule is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) {index in
                        ContentViewRow(index: index)
                  
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}
