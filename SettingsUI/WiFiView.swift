//
//  WiFiView.swift
//  SettingsUI
//
//  Created by Vladyslav Dikhtiaruk on 15/02/2024.
//

import SwiftUI

struct WiFiView: View {
    @State private var isWiFiOn = false
    
    let joiningTypes = ["Never", "Ask to Join", "Automatic"]
    @State private var currentJoiningType = "Never"
    
    let joiningNetworks = ["Off", "Notify", "Ask"]
    @State private var currentJoiningNetwork = "Notify"
    
    var body: some View {
        
        NavigationStack{
            
            List{
                Toggle("Wi-Fi", isOn: $isWiFiOn)
                    .padding(.leading)
                
                Section("Networks"){
                    ForEach(1..<6) {
                        WifiOptionsView(networkNum: "\($0)")
                    }
                    .padding(.leading)
                    Text("Other...")
                        .padding(.leading)
                }
                Section{
                    Picker("Ask to Join Networks", selection: $currentJoiningNetwork) {
                        ForEach(joiningNetworks, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                
                //                Text("Known networks will be joined automatically. If no known networks are available, you will be notified of available networks.")
//                                    .font(.caption)
//                                    .foregroundStyle(.gray)
                
                
                Section{
                    Picker("Auto-Join Hotspot", selection: $currentJoiningType) {
                        ForEach(joiningTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Text("Allow this device to automatically discover nearby personal hotspots when no Wi-Fi network is available.")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    
            }
            
            .navigationTitle("Wi-Fi")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button("Edit"){
                    
                }
            })
            
            
            //            List(0..<5){
            //                Text("Dynamic row num: \($0)")
            //            }
            
        }

    }
}

struct WifiOptionsView: View {
    var networkNum: String
    
    var body: some View{
        HStack{
            Text("Network num \(networkNum)")
            Spacer()
            
            Image(systemName: "lock.fill")
            Image(systemName: "wifi")
            Image(systemName: "info.circle")
                .foregroundStyle(.blue)
                .font(.title2)
        }
        
    }
}

//struct AutoJoin: View {
//    let joiningTypes = ["Never", "Ask to Join", "Automatic"]
//    @State private var currentType = "Never"
//    var body: some View{
//        Picker("Auto-Join Hotspot", selection: $currentType) {
//            VStack{
//                ForEach(joiningTypes, id: \.self){
//
//                    Text("\($0)")
//                }
//            }
//
//        }
//        //        .pickerStyle(.inline)
//    }
//}


#Preview {
    WiFiView()
}
