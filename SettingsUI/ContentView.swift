//
//  ContentView.swift
//  SettingsUI
//
//  Created by Vladyslav Dikhtiaruk on 15/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var searchText: String = ""
    @State private var isAirplaneMode = false
    
    @State private var isBluetoothOn = false
    let bluetoothTypes = ["Off", "On"]
    @State private var currentBluetooth = "Off"
    
    var body: some View {
        NavigationStack{
            List{
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $searchText)
                }
                .foregroundColor(.gray)
                
                Section{
                    HStack{
                        ZStack{
                            Circle()
                                .frame(maxWidth: 64, maxHeight: 64)
                                .foregroundStyle(.linearGradient(colors: [.secondary.opacity(0.5), .secondary], startPoint: .top, endPoint: .bottom))
                            Text("V")
                                .foregroundStyle(.white)
                                .font(.title).bold()
                                .fontDesign(.rounded)
                        }
                        
                        NavigationLink(destination: EmptyView()) {
                            VStack(alignment: .leading/*, spacing: 4*/) {
                                Text("Vladyslav")
                                    .font(.title2)
                                Text("Apple ID, iCloud, Media & Purchases")
                                    .font(.footnote)
                                
                            }
                        }
                    }
                    
                    NavigationLink("Apple ID Suggestions", destination: EmptyView())
                }
                
                
                Section{
                    // AirPlane mode finished
                    HStack(spacing: 12){
                        Icon(imageName: "airplane", backgroundColour: Color.orange)
                        
                        Toggle("Airplane Mode",  isOn: $isAirplaneMode)
                    }
                    HStack(spacing: 10){
                        Icon(imageName: "wifi", backgroundColour: .blue)
                        
                        NavigationLink("Wi-Fi", destination: WiFiView())
                    }
                    
                    // bluetooth to finish
                    HStack(spacing: 12){
                        Icon(imageName: "square", backgroundColour: .blue)
                        
                        Picker("Bluetooth", selection: $currentBluetooth) {
                            
                            Text("Off").tag("Off")
                            Text("On").tag("On")
                            
                            Toggle("Bluetooth", isOn: $isBluetoothOn)
                                .onChange(of: isBluetoothOn, changeBluetooth)
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    // mobile service to finish
                    Item(isSomethingOn: isBluetoothOn, name: "Mobile Service", icon: Icon(imageName: "antenna.radiowaves.left.and.right", backgroundColour: .green))
                    
                    
                    
                    Item(isSomethingOn: isBluetoothOn, name: "Personal Hotspot", icon: Icon(imageName: "personalhotspot", backgroundColour: .green))
                }
                
                Section {
                    
                    Item(isSomethingOn: isBluetoothOn, name: "Notifications", icon: Icon(imageName: "bell.badge.fill", backgroundColour: .red))
                    
                    Item(isSomethingOn: isBluetoothOn, name: "Sounds & Haptics", icon: .init(imageName: "speaker.wave.3.fill", backgroundColour: .pink))
                    
                    Item(isSomethingOn: isBluetoothOn, name: "Focus", icon: .init(imageName: "moon.fill", backgroundColour: .indigo))
                    
                    Item(isSomethingOn: isBluetoothOn, name: "Screen Time", icon: .init(imageName: "hourglass", backgroundColour: .indigo))
                    
                }
                Section("Section 2") {
                    ForEach(1..<5){
                        NavigationLink("Row number \($0)", destination: WiFiView())
                    }
                }
                
                
                Section("Section 4") {
                    Text("Static Row 4!")
                    Text("Static Row 5!")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    func changeBluetooth() -> Void {
        if(isBluetoothOn) {
            currentBluetooth = "On"
        } else {
            currentBluetooth = "Off"
        }
    }
    struct Icon : View {
        var imageName: String
        var backgroundColour: Color
        var body: some View {
            Image(systemName: imageName)
                .frame(width: 20, height: 20, alignment: .center)
                .padding(.all, 5)
                .foregroundStyle(.white)
                .background(backgroundColour)
                .clipShape(.buttonBorder)
        }
    }
    struct Item: View {
        var isSomethingOn: Bool
        var name: String
        var icon: Icon
        
        var body: some View {
            HStack(spacing: 12){
                Icon(imageName: icon.imageName, backgroundColour: icon.backgroundColour)
                
                NavigationLink(name) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
