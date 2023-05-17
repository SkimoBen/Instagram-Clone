//
//  HomeFeedView.swift
//  Instagram
//
//  Created by Ben Pearman on 2023-01-27.
//

import SwiftUI

//the stacks which hold the modules for different view components.
struct HomeFeedView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    StoriesView()
                        
                    ForEach(1...5, id: \.self) {num in
                        PostView(userImageName: "user\(num)", imageName: "image\(num)")
                            .padding(.bottom, 20)
                    }
                }
            }
            .navigationTitle("Instagram")
        }
    }
}

//postview struct defines the style of the posts
struct PostView: View {
    let userImageName: String
    let imageName: String
    
    var body: some View {
        VStack {
            PostHeaderView(userImageName: userImageName)
                .padding()
                
            //image that people post
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 430, height: 430, alignment: .center)
                .clipped() //stopps the image from overflowing the frame
                .background(Color(.secondarySystemBackground))
            
            PostActionButtonsView()
            
            HStack{
                //like count
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(Color.red)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                Text("32 likes")
                    .font(.system(size: 20))
                    .foregroundColor(Color(.link))
                Spacer()
            }
            .padding()
            .padding(.top, -20)
            
            // Caption
            Text("Oh man I hope 2021 is better than 2020! #newYear #trending #swiftUI")
                .font(.headline)
                .padding(.top, -15)
            
            // Comments
            
            HStack {
                //Date
                Text("1 hour ago")
                    .foregroundColor(Color(.secondaryLabel))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.leading, 12)
        }
    }
}

//structure which does styling for the persons profile header, baasically their name and profile picture in the home feed.
struct PostHeaderView: View {
    var userImageName: String
    
    var body: some View {
        HStack {
            //user profile picture and user name
            Image(userImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20) //half of w & h makes a circle.
            
            Text("Kanye West") //user name
                .foregroundColor(Color.blue)
                .bold()
            
            Spacer() //pushes everything to the left
        }
        
    }
}

//Structure which does all the styling for the action buttons
struct PostActionButtonsView: View {
    var body: some View {
        HStack{
            //Action buttons: like comment share
            Button(action: {
                //like
            }, label: {
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            })
            .padding(.trailing, 10) //padding between btns
            
            Button(action: {
                //comment
            }, label: {
                Image(systemName: "message")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            })
            .padding(.trailing,10) //padding between btns
            
            Button(action: {
                //like
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(Color(.label))
            })
            .padding(.trailing, 10) //padding between btns
            
            Spacer() //spacer pushes buttons to the left
        }
        .padding()
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView()
    }
}
