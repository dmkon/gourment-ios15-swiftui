//
//  AddView.swift
//  gourment-ios15-swiftui
//
//  Created by Dmitri Kondramachine on 2021-09-23.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var gourmentVM: GourmentViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Gourment Name:")
                TextField(
                    "Enter gourment...",
                    text: $gourmentVM.currentGourmentName
                )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
            }
            .padding()
            .navigationTitle("Add Gourment")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(
                        action: {
                        gourmentVM.addData(presentation: presentation)
                    }
                    ) {
                        Text("Done")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {presentation.wrappedValue.dismiss()}) {
                        Text("Cancel")
                    }
                }
            }
        }
        .onDisappear(perform: gourmentVM.deinitData)
    }
}

struct AddView_Previews: PreviewProvider {
    
    static let gourmentVM = GourmentViewModel()
    
    static var previews: some View {
        AddView()
            .environmentObject(gourmentVM)
    }
}
