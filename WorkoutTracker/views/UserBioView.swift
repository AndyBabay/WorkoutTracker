//
//  UserBioView.swift
//  WorkoutTracker
//
//  Created by Andy Babay on 4/2/21.
//

import SwiftUI

struct UserBioView: View{
    
    
    @State var feet: Int
    @State var name: String
    @State var inches: Int
    @State var age: String
    @State var weight: String
    
    @State private var toggle = false
    
    var feetArr = [1,2,3,4,5,6,7]
    var inchesArr = [1,2,3,4,5,6,7,8,9,10,11]
    
   @EnvironmentObject var userBio: UserBio
    
    
    var body: some View {
    VStack{
        //TextField("Inches", text:$height).textFieldStyle(RoundedBorderTextFieldStyle()).padding().keyboardType(.numberPad)
        Text("User Info").padding()
        
        NavigationView{
        Form{
            
            Section(){
                Text("Name: \(self.name)")
                TextField("Name", text:$name).textFieldStyle(RoundedBorderTextFieldStyle()).padding().keyboardType(.numberPad)
                
            }
            Section(){
                Text("Age: \(self.age)")
                TextField("Age", text:$age).textFieldStyle(RoundedBorderTextFieldStyle()).padding().keyboardType(.numberPad)
                
            }
            Section() {
                
                Text("Height: \(feet) ' \(inches)")
                
                Picker(selection: $feet,label: Text(" "))
            {
                    ForEach(feetArr, id:\.self){
                        Text("\($0) ft")
                }
            }.padding()
                
                
                Picker(selection: $inches, label: Text(""))
                {
                    ForEach(inchesArr, id: \.self){
                            Text("\($0) inches")
                    }
            }.padding()
                
        }
            Section(){
                Text("Weight: \(self.weight)")
                
            TextField("Weightn in lbs: ", text:$weight).textFieldStyle(RoundedBorderTextFieldStyle()).padding().keyboardType(.numberPad)
        }
            
            
            
      
            
            Button(action:{
                
                if(age == "" || feet == 0 || inches == 0 || weight == "" || name == ""){
                    toggle = true
                }
                else {
                userBio.age = Int(self.age) ?? 0
                userBio.name = self.name
                userBio.weight = Int(self.weight) ?? 0
                userBio.height.0 = Int(self.feet)
                userBio.height.1 = Int(self.inches)
                userBio.update()
                }
                    
                
                
               
           
                  }) { Text("Save") }.alert(isPresented: $toggle) {
                    
                    return Alert(title: Text("Missing entries"), message: Text("Please fill out all entries to save data"))
                }
    }
            

            
            
            
            
         
    }
        
        // Ran into some issues trying to pass data into UserBio Object
        
        
    //
      //  userBio = UserBio(age: self.age, height: (Int(self.feet),Int(self.inches)), weight: self.weight))
    }
    }
    
}



