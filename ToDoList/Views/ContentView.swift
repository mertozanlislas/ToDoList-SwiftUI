//
//  ContentView.swift
//  ToDoList
//
//  Created by Mert Ozan Lislas on 3/17/24.
//

    import SwiftUI

    struct ContentView: View {
        
        @State var noteManager = NoteManager()
        var body: some View {
            NavigationView {
                ZStack {
                    VStack(){
                        HStack {
                            Text("My Notes")
                            Spacer()
                            NavigationLink(destination: NoteAddingView( contentView: self)) {
                                Image(systemName: "plus.square")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            }
                        if noteManager.notes.isEmpty{
                            Spacer()
                            Text("There is no task")
                        }else{
                            List (noteManager.notes) {note in
                                HStack {
                                    NavigationLink(destination: NoteEditingView(contentView: self, note: note)) {
                                        Text(note.title)
                                    }

                                    
                                }
                            }
                        }
                        
                        Spacer()
                            
                    }
                    
                    .padding()
                }
            }
            .onAppear(perform: {
                print(noteManager.notes)
            })
        }
    }

    #Preview {
        ContentView()
    }
