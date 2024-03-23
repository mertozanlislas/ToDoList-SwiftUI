//
//  NoteAddingView.swift
//  ToDoList
//
//  Created by Mert Ozan Lislas on 3/18/24.
//

import SwiftUI

struct NoteAddingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var title = ""
    @State var description = ""
    let contentView : ContentView
    
    var body: some View {
        NavigationView {
            VStack {
                TextInput(placeholder: "Title", text: $title)
                TextInput(placeholder: "Description", text: $description)
                Spacer()
                Button("Done") {
                    if !title.isEmpty {
                        contentView.noteManager.addNote(title: title, description: description)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .disabled(title.isEmpty)
                }
            }
            .padding()
            .navigationBarTitle("Add Note")
        }
    }


#Preview {
    NoteAddingView(  contentView: ContentView())
}
