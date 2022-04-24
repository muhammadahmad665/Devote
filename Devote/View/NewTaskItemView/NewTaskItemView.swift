//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Ahmed on 25/04/2022.
//

import SwiftUI

struct NewTaskItemView: View {
    //MARK: Property
    @State private var task: String = ""
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    private var isButtonDisabled: Bool{
        task.isEmpty
    }
    @Binding var isShowing: Bool
    @Environment(\.managedObjectContext) private var viewContext
    //MARK: Function
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.id = UUID()
            newItem.completion = true
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    //MARK: Body
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing: 16){
                TextField("New Task", text: $task)
                    .padding()
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                Button (action: {
                    addItem()
                }, label: {
                    Spacer()
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                    .disabled(isButtonDisabled)
                    .padding()
                    .foregroundColor(.white)
                    .background(isButtonDisabled ? Color.blue : Color.pink)
                    .cornerRadius(10)
                
            }//: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(20)
            .shadow(color: Color( red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24 )
            .frame(maxWidth: 640)
        }//: VSTACK
        .padding()
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(
                Color.gray.ignoresSafeArea(.all, edges: .all)
            )
    }
}
