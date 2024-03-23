//
//  TextInput.swift
//  ToDoList
//
//  Created by Mert Ozan Lislas on 3/20/24.
//

import SwiftUI

struct TextInput: View {
    var placeholder:String
    var text:Binding<String>
    //var isFocused:FocusState<Bool>.Binding
    
    var body: some View {
        TextField(placeholder, text: text)
            //.focused(isFocused)
            .foregroundStyle(.white)
            .keyboardType(.default)
            .padding()
            .background(Color(red: 0.58, green: 0.69, blue: 0.75))
            .cornerRadius(8.0)
            .padding()
        
    }
}

#Preview(traits:.sizeThatFitsLayout) {
    TextInput(placeholder: "Text", text: Binding.constant("Value"))
}


