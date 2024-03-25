//
//  NoteEditingView.swift
//  ToDoList
//
//  Created by Mert Ozan Lislas on 3/19/24.
//

import SwiftUI

struct NoteEditingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var title = ""
    @State var description = ""
    @State var showingDeleteAlert = false
    let contentView : ContentView
    @State var note : Note
    var body: some View {
        NavigationView {
            VStack {
                TextInput(placeholder: "Title", text: $title)
                TextInput(placeholder: "Description", text: $description)
                Spacer()
                Button("Edit") {
                    if !title.isEmpty {
                        contentView.noteManager.updateNote( id: note.id, title: title, description: description)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .disabled(title.isEmpty)
                Button("Delete",role: .destructive){
                    showingDeleteAlert=true
                }
                .alert("Are you sure to delete this note?", isPresented: $showingDeleteAlert, actions: {
                    Button("Delete",role: .destructive){
                        contentView.noteManager.deleteNote(id: note.id)
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                
                .padding()
                }
            }
            .padding()
            .navigationBarTitle("Edit Note")
            .onAppear(perform: {
                title = note.title
                description = note.description ?? ""
            })
        }
        
}

#Preview {
    NoteEditingView( contentView: ContentView(), note: Note(title: "note", description: "desc"))
}
