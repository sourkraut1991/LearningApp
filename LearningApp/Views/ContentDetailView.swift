//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by ed on 11/28/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        // Only show video if we get a valid URL
        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // TODO: Description
            CodeTextView()
            // Next Lesson button
            if model.hasNextLesson() {
                Button {
                    
                    //Advance the lesson
                    model.nextLesson()
                    
                } label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                    .padding()
                    
                }
            }
            else {
                //Show complete button instead
                
                Button(action: {
                    
                    //Take the user back to homeview
                    model.currentContentSelected = nil
                    
                }, label: {
                    ZStack {
                        RectangleCard(color: Color.green)
                            .frame(height: 48)
                        Text("Complete")
                            .bold()
                            .foregroundColor(Color.white)
                    }
                })
            }
            
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
}
struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
