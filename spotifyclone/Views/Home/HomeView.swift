//
//  HomeView.swift
//  spotifyclone
//
//  Created by Raffaele Morlando on 29/03/23.
//

import SwiftUI

struct HomeView: View {
    let data = Array(1...6)
    let url = URL(string: "https://i.scdn.co/image/ab6761610000e5eb09526bad494b6625976c9319")!;
    
    var body: some View {
        ZStack {
            ScrollView() {
                VStack {
                    Group {
                        HStack {
                            Text("Good evening").font(.system(size: 30)).fontWeight(Font.Weight.bold).foregroundColor(Color.white)
                            Spacer(minLength: 5)
                        }.frame(minHeight:50)
                        HStack{
                            Text("Music").padding(8).background(Color.gray).cornerRadius(10)
                            Text("Podcasts & Shows").padding(8).background(Color.gray).cornerRadius(10)
                            Spacer(minLength: 5)
                        }.frame(minHeight:50)
                    }
                    Group {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                            ForEach(data, id: \.self) { item in
                                
                                HStack {
                                    AsyncImage(url: url, scale: 10)
                                    Text("Item \(item)")
                                    Spacer()
                                } .frame(maxWidth: .infinity, minHeight: 50)
                                    .background(.gray)
                                    .cornerRadius(4)
                                
                            }
                        }
                    }
                    Group {
                        VStack {
                            Text("New Releases")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 25))
                                .fontWeight(Font.Weight.bold)
                                .foregroundColor(.white)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack (spacing: 10) {
                                    ForEach(data, id: \.self) { item in
                                        Rectangle().frame(width: 160, height: 140).foregroundColor(.green)
                                    }
                                }
                            }.padding(.top,5).padding(.bottom,30)
                        }.padding(.top,30)
                        
                        VStack {
                            Text("Recently Played")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 25))
                                .fontWeight(Font.Weight.bold)
                                .foregroundColor(.white)
                            ScrollView(.horizontal,showsIndicators: false) {
                                LazyHStack(spacing: 10) {
                                    ForEach(data, id: \.self) { item in
                                        Rectangle()
                                            .frame(width: 160, height: 140)
                                            .foregroundColor(Color.blue)
                                            .cornerRadius(8)
                                    }
                                }
                            }.padding(.top,5)
                        }.padding(.top,30).padding(.bottom,30)
                        
                        VStack {
                            Text("Popular Albums")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 25))
                                .fontWeight(Font.Weight.bold)
                                .foregroundColor(.white)
                            ScrollView(.horizontal,showsIndicators: false) {
                                LazyHStack(spacing: 10) {
                                    ForEach(data, id: \.self) { item in
                                        Rectangle()
                                            .frame(width: 160, height: 140)
                                            .foregroundColor(.red)
                                            .cornerRadius(8)
                                    }
                                }
                            }.padding(.top,5)
                        }.padding(.top,30).padding(.bottom,30)
                        
                    }
                }
            }
        }.background(Color.black)
    }
}
