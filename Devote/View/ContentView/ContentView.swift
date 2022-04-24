//
//  ContentView.swift
//  Devote
//
//  Created by Ahmed on 24/04/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: Properties
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var task: String = ""
    @State private var showNewTaskItem: Bool = false
    
    // Fetching data
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //MARK: Functions
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    //MARK: Body
    
    var body: some View {
        NavigationView {
            ZStack {
                //            MARK: Main View
                VStack {
                    //            MARK: Header
                    HStack(spacing: 10){
                        //Title
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading, 4 )
                        Spacer()
                        //Button
                        EditButton()
                            .font(.system(size: 24, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth: 70, minHeight: 24)
                            .background(
                                Capsule().stroke(Color.white, lineWidth: 2)
                            )
                        //Appearnce Button
                        Button(action: {
                            //Tougle Appearce
                            isDarkMode.toggle()
                        }, label: {
                            Image(systemName: isDarkMode ?  "moon.circle.fill" : "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24, alignment: .center)
                                .font(.system(.title, design: .rounded))
                        })
                    }//: HSTACK
                    .padding()
                    .foregroundColor(.white)
                    Spacer(minLength: 80)
                    //            MARK: New Task Button
                    Button(action: {
                        showNewTaskItem = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    })
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 15)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
                                .clipShape(Capsule())
                        )
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 8, x: 0, y: 4)
                        
                    //            MARK: Tasks
                    List {
                        ForEach(items) { item in
                            ListRowItemView(item: item)
                        }
                        .onDelete(perform: deleteItems)
                    }//:List
                    .listStyle(InsetGroupedListStyle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 12)
                    .padding(.vertical, 0)
                    .frame(maxWidth: 640)
                }//: VStack
                //            MARK: New Task Item
                if showNewTaskItem{
                    BlankView()
                        .onTapGesture {
                            withAnimation {
                                showNewTaskItem = false
                            }
                        }
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
            }//: ZStack
            .onAppear(perform: {
                UITableView.appearance().backgroundColor = UIColor.clear
            })
            .navigationTitle("Daily Task")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(true)
            .background(
                BackgroundImageView()
            )
            .background(
                backgroundGradient.ignoresSafeArea(.all)
            )
        }//: Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
