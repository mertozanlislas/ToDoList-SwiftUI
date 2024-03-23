//
//  NoteManager.swift
//  ToDoList
//
//  Created by Mert Ozan Lislas on 3/17/24.
//

import Foundation

struct NoteManager{
    var notes:[Note] = []
    mutating func addNote(title:String,description:String?){
        let newNote = Note( title: title, description: description)
        notes.append(newNote)
    }
    mutating func deleteNote(id:UUID){
        if let index = notes.firstIndex(where: { $0.id == id }) {
            notes.remove(at: index)
        }
    }
    mutating func updateNote(id:UUID,title:String,description:String?){
        if let index = notes.firstIndex(where: { $0.id == id }) {
            notes[index].title = title
            notes[index].description = description
        }
    }

    
}
