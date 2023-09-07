//
//  FavoriteListView.swift
//  BinGongGan_User
//
//  Created by LJh on 2023/09/07.
//

import SwiftUI

enum FavoriteListConstant {
    static let rectangleWidth =     CGFloat(150)
    static let rectangleHeight =    CGFloat(200)
    static let tabViewWidth =       CGFloat(10)
    static let tabViewHeight =      CGFloat(200)
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct FavoriteListView: View {
    @ObservedObject var homeStore: HomeStore = HomeStore()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.width
    var body: some View {
        
        TabView {
            ForEach(homeStore.places) { place in
                ZStack {
                    AsyncImage(url: place.imageURL ) { image in
                        image
                            .renderingMode(.original)
                            .resizable()
                        
                    } placeholder: {
                        ProgressView()
                        
                    }
                    .cornerRadius(8)
                    
                    VStack {
                        Spacer()
                        Rectangle()
                            .frame( height: 92)
                            .foregroundColor(.myBlack)
                        .opacity(0.5)
                        .overlay(alignment: .topLeading) {
                            VStack(alignment: .leading) {
                                
                                Text("\(place.placeName)")
                                    .font(.head1Bold)
                                    .padding(.bottom, 0.5)
                                Text("\(place.placeLocation)")
                                    .font(.body1Regular)
                            }
                            .foregroundColor(.myWhite)
                            .padding()
                        }
                    }
                    .cornerRadius(8, corners: .bottomLeft)
                    .cornerRadius(8, corners: .bottomRight)
                    
                }
                    
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        .frame( height: screenHeight * 0.5)
        
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            FavoriteListView()
        }
    }
}
/*
 
 
 
 ForEach(homeStore.places) { place in
//                    AsyncImage(url: place.imageURL ) { image in
//                        image
//
//                            .renderingMode(.original)
//                            .resizable()
//                            .frame(
//                                minWidth: screenWidth * 0.89,
//                                maxWidth: screenWidth * 0.8,
//                                minHeight: FavoriteListConstant.rectangleWidth,
//                                maxHeight: FavoriteListConstant.rectangleHeight
//
//                                ,alignment: .center
//                            )
//                    } placeholder: {
//                        ProgressView()
//                            .frame(
//                                minWidth: FavoriteListConstant.rectangleWidth,
//                                maxWidth: FavoriteListConstant.rectangleHeight,
//                                minHeight: FavoriteListConstant.rectangleWidth,
//                                maxHeight: FavoriteListConstant.rectangleHeight
//                            )
//                    }
//                    .cornerRadius(15, corners: .topLeft)
//                    .cornerRadius(15, corners: .topRight)
     VStack {
         VStack(alignment: .leading) {
             HStack {
                 Spacer()
                 Text("\(place.placeName)")
                     .font(.head1Bold)
                     .foregroundColor(.myWhite)
                 Spacer()
             }
             HStack {
                 Spacer()
                 Text("\(place.placeLocation)")
                     .font(.body1Regular)
                     .foregroundColor(.myWhite)
                 Spacer()
             }
             
             HStack {
                 Spacer()
                 Text("\(place.placePrice)")
                     .font(.body1Regular)
                     .foregroundColor(.myWhite)
                 Spacer()
             }
             
         }.padding([.leading, .trailing], 20)
         Spacer()
     }
     .background(
         RoundedRectangle(cornerRadius: 15)
         .frame(
             width: screenWidth * 0.89, height: 80
         )
         .foregroundColor(.myPrimary)
//                        .opacity(0.7)
     )
 }
 */
