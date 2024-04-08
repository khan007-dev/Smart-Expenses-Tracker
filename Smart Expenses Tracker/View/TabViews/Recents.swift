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
    @State private var showFilterView: Bool = false
    @State private var selectedCategory: Category = .expense
    
    
    // Animation
    
    @Namespace private var animation
    var body: some View {
        GeometryReader {
            
            let size = $0.size
            
            NavigationStack {
                ScrollView(.vertical) {
                    
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            
                            Button {
                                showFilterView = true
                            } label: {
                                
                                Text("\(format(date: startDate, format: "dd - MM yy")) to \(format(date: endDate, format: "dd - MM yy"))").font(.caption2).foregroundStyle(.gray)
                            
                                     
                            }.hSpacing(.leading)
                            
                            /// Card View
                        
                            CardView(income: 2039, expense: 4098)
                            
                            /// Custom Segmented Control
                            CustomSegmentedControl()
                                .padding(.bottom,10)
                            
                            ForEach(sampleTransactions.filter({ $0.category == selectedCategory.rawValue })) { transaction in
                            
                                TransactionCardView(transaction: transaction)
                            }
                            
                        } header: {
                            HeaderView(size)
                        }
                    }.padding(15)
                }
                .background(.gray.opacity(0.15))
                .blur(radius: showFilterView ? 8 : 0)
                .disabled(showFilterView)
            }
            .overlay {
                if showFilterView {
                    DataFilterView(start: startDate, end: endDate) { start, end in
                        startDate = start
                        endDate = end
                        showFilterView = false
                    } onClose: {
                        showFilterView = false
                    }

                }
            }.animation(.snappy, value: showFilterView)
            
          
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
    
    @ViewBuilder
    func CustomSegmentedControl() -> some View {
        
        HStack(spacing: 0) {
            ForEach(Category.allCases, id: \.rawValue) { category in
                Text(category.rawValue)
                    .hSpacing()
                    .padding(.vertical, 10)
                    .background {
                        if category == selectedCategory {
                            Capsule()
                                .fill(.background)
                                .matchedGeometryEffect(id: "ACTUVETAB", in: animation)
                        }
                    }.contentShape(.capsule)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selectedCategory = category
                        }
                    }
                    .background(.gray.opacity(0.15), in: .capsule)
                    .padding(.top, 5)
            }
        }
    }
    

    
}


#Preview {
    ContentView()
}
