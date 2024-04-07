//
//  Recents.swift
//  Smart Expenses Tracker
//
//  Created by Khan on 06.04.2024.
//

import SwiftUI

struct Recents: View {
    @AppStorage("userName") private var userName: String = ""
    
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    var body: some View {
        GeometryReader {
            
            let size = $0.size
            
            NavigationStack {
                ScrollView(.vertical) {
                    
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            
                            Button {
                                
                            } label: {
                                
                                Text("\(format(date: startDate, format: "dd - MM yy")) to \(format(date: endDate, format: "dd - MM yy"))").font(.caption2).foregroundStyle(.gray)
                            
                                     
                            }.hSpacing(.leading)
                            
                            
                        } header: {
                            HeaderView(size)
                        }
                    }.padding(15)
                }
            }
        }
    }
    
    @ViewBuilder
    func HeaderView(_ sie: CGSize) -> some View {
        
        HStack(spacing: 10) {
            
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Welcome!")
                    .font(.title.bold())
                
                if !userName.isEmpty {
                    Text(userName)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer(minLength: 0)
            NavigationLink {
                
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: .circle)
                    .contentShape(.circle)
            }
        }
        .padding(.bottom, 5)
        .background {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                Divider()
            }
            .padding(.horizontal, -15)
            .padding(.top, -(safeArea.top + 15))
        }
        
    }
    
}


#Preview {
    ContentView()
}
