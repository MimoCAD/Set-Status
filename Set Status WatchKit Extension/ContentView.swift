//
//  ContentView.swift
//  Set Status WatchKit Extension
//
//  Created by Mark Tomlin on 4/10/20.
//  Copyright © 2020 MimoCAD Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var EnrouteText = "Enroute"
    @State var OnSceneText = "On Scene"
    @State var LeaveSceneText = "Leave Scene"
    @State var AtHospitalText = "At Hospital"
    @State var InServiceText = "In Service"

    var body: some View {
        List {
            Button(action: {
                self.EnrouteText = getCurrentTime()
            }) {
                Text(EnrouteText)
            }
            .buttonStyle(BtnStyle(bgColor: .red, fgColor: .white))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.OnSceneText = getCurrentTime()
            }) {
                Text(OnSceneText)
            }
            .buttonStyle(BtnStyle(bgColor: .yellow, fgColor: .black))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.LeaveSceneText = getCurrentTime()
            }) {
                Text(LeaveSceneText)
            }
            .buttonStyle(BtnStyle(bgColor: .green, fgColor: .black))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.AtHospitalText = getCurrentTime()
            }) {
                Text(AtHospitalText)
            }
            .buttonStyle(BtnStyle(bgColor: .blue, fgColor: .black))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.InServiceText = getCurrentTime()
            }) {
                Text(InServiceText)
            }
            .buttonStyle(BtnStyle(bgColor: .white, fgColor: .black))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.EnrouteText = "Enroute"
                self.OnSceneText = "On Scene"
                self.LeaveSceneText = "Leave Scene"
                self.AtHospitalText = "At Hospital"
                self.InServiceText = "In Service"
            }) {
                Text("Reset")
            }
            .buttonStyle(BtnStyle(bgColor: .clear, fgColor: .gray))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationBarTitle("Times")
        .environment(\.defaultMinListRowHeight, 8)
        .listRowPlatterColor(.clear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getCurrentTime() -> String {
    let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm:ss"

    return dateFormatter.string(from: Date())
}

// Button Styles
struct BtnStyle: ButtonStyle {
    var bgColor: Color
    var fgColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(4)
            .foregroundColor(fgColor)
            .background(bgColor)
            .cornerRadius(6)
    }
}
