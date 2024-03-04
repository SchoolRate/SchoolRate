//
//  SchoolRanksView.swift
//  SchoolRate Core
//
//  Copyright (c) 2024 SchoolRate. All rights reserved
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import SwiftUI

struct SchoolsRankView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Classement")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                    
                    LiveAnimation()
                        .padding()
                }
                
                LazyVStack(alignment: .leading) {
                    ForEach(0...10, id: \.self) { /*user*/ _ in
                        HStack {
                            Image(systemName: "number")
                            
                            Text("1")
                            
                            /*Image("montpellierNevers")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())*/
                            
                            VStack {
                                Text("Lycée Privé Nevers")
                                    .font(.footnote)
                                    .padding(.leading)
                                Text("200 votes")
                                    .padding(.trailing)
                                    .font(.headline)
                            }
                            .padding(.leading)
                            .padding(.horizontal, -25)
                            
                            Spacer()
                            
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "arrow.up.square.fill")
                                        .foregroundStyle(.green)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "arrow.down.square.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                    }
                } 
                .padding()
            }
        }
    }
}

#Preview {
    SchoolsRankView()
}
