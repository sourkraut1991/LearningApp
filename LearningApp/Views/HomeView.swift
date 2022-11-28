//
//  ContentView.swift
//  LearningApp
//
//  Created by Christopher Ching on 2021-03-03.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("What would you like to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            VStack(spacing: 20) {
                                NavigationLink(destination: ContentView()
                                    .onAppear(perform: {
                                        model.beginModule(module.id)
                                    }),
                                label: {
                                    // Learning Card
                                    HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                })
                             
                                // Test Card
                                HomeViewRow(image: module.test.image, title: "Learn \(module.category)", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                            }
                        }
                    }
                    .accentColor(.black)
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
