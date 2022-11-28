//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by ed on 11/28/22.
//

// This allows you to reuse the rectangular button for different types of text at once. For instance, a Lesson and Test rectangle can use the same viewing model

import SwiftUI

struct HomeViewRow: View {
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                //Image
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                
                Spacer()
                
                //Text
                VStack(alignment: .leading, spacing: 10) {
                    //Headline
                    Text(title)
                        .font(.caption)
                    //Description
                    Text(description)
                        .padding(.bottom, 20)
                    // Icons
                    HStack {
                        //Number of lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 10))
                        
                        Spacer()
                        // Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(.caption)
                    }
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Some Description", count: "10 Lessons", time: "2 Hours")
    }
}
