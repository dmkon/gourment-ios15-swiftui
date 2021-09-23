//
//  ContentView.swift
//  gourment-ios15-swiftui
//
//  Created by Dmitri Kondramachine on 2021-09-23.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var gourmentVM = GourmentViewModel()
    
    private var buttonRow: GridItem {
        GridItem(.flexible(minimum: 0, maximum: 80))
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    Group {
                        Button("Alpha") {
                            if (!gourmentVM.sortByAlpha) {
                                gourmentVM.fetchData(sortByAlpha: true)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            gourmentVM.sortByAlpha
                            ? Color.blue
                            : Color.gray
                        )
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        Button("Creation Time") {
                            if (gourmentVM.sortByAlpha) {
                                gourmentVM.fetchData(sortByAlpha: false)
                            }
                        }
                        .frame(maxWidth: .infinity).padding()
                        .background(
                            gourmentVM.sortByAlpha
                            ? Color.gray
                            : Color.blue
                        )
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    }
                }
                .padding(.horizontal, 10)
                ScrollView {
                    ForEach(gourmentVM.gourments) { gourment in
                        VStack (alignment: .leading) {
                            Text(gourment.gourmentName)
                                .fontWeight(.semibold)
                                .font(Font.system(size:30))
                            Divider()
                        }
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            
            .navigationTitle("Gourments")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {gourmentVM.openNewPage.toggle()}) {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $gourmentVM.openNewPage) {
                AddView()
                    .environmentObject(gourmentVM)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
