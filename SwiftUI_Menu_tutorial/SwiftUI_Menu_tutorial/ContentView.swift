//
//  ContentView.swift
//  SwiftUI_Menu_tutorial
//
//  Created by SHIN YOON AH on 2021/05/03.
//

import SwiftUI

let myPets = ["λ©λ©μ΄ πΆ", "μΌμΉμ΄ π±", "μΉμΉ λΌ πΉ"]

struct ContentView: View {
    
    @State private var shouldShowAlert: Bool = false
    @State private var myText: String = ""
    @State private var selected : Int = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Spacer()
                Text("\(myPets[selected])")
                    .font(.system(size: 60))
                    .bold()
                Text("μ°μΈ‘ μλ¨μ λ‘λ‘λ‘μ λλ¬μ£ΌμΈμ!")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Spacer()
            }
                .padding()
                .navigationTitle("νμ΄μ")
                .toolbar(content: {
                    ToolbarItem(placement: .primaryAction, content:  {
                        Menu {
                            // λ©ν° ν΄λ‘μ§ κ°λ₯(SwiftUI update)
                            Button(action: {
                                // μ‘μ
                                shouldShowAlert = true
                                myText = "μ€λλ λΉ‘μ½λ©!"
                            }, label: {
                                // λΌλ²¨
                                Label("μ€λλ λΉ‘μ½λ©!", systemImage: "flame.fill")
                            })
                            
                            Button {
                                shouldShowAlert = true
                                myText = "μ§μμ μ¬λ λ !"
                            } label : {
                                Label("μ§μμ μ¬λ λ !", systemImage: "house.fill")
                            }
                            
                            Section {
                                Button {
                                } label: {
                                    Label("μ νμΌ λ§λ€κΈ°", systemImage: "doc")
                                }
                                
                                Button {
                                } label: {
                                    Label("μ ν΄λ λ§λ€κΈ°", systemImage: "folder")
                                }
                            }
                            
                            Section {
                                Button {
                                } label: {
                                    Label("νμΌ λͺ¨λ μ­μ ", systemImage: "trash")
                                }
                            }
                            
                            Picker(selection: $selected, label:
                                    Text("μ μλλ¬Ό μ ν")) {
                                ForEach(myPets.indices, id: \.self, content: { id in
                                    Text("\(myPets[id])").tag(id)
                                })
                            }
                        } label: {
                            Circle()
                                .foregroundColor(Color.init(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Label("λλ³΄κΈ°", systemImage: "ellipsis")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                )
                        } // λ©λ΄
                    })
                }) // toolbar
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("μλ¦Ό"), message: Text(myText), dismissButton: .default(Text("νμΈ")))
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
