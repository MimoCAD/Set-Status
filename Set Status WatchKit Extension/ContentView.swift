//
//  ContentView.swift
//  Set Status WatchKit Extension
//
//  Created by Mark Tomlin on 4/10/20.
//  Copyright © 2020 MimoCAD Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var CallRecdText = "CALL REC'D"
    @State var EnrouteText = "ENROUTE"
    @State var AtSceneText = "AT SCENE"
    @State var FromSceneText = "FROM SCENE"
    @State var AtDestinationText = "AT DESTINATION"
    @State var InServiceText = "IN SERVICE"
    @State var InQuartersText = "IN QUARTERS"
    
    let Statuses = [
        ("CALL REC'D",     Color(red: 215 / 255, green:  10 / 255, blue: 213 / 255), Color.white),
        ("ENROUTE",        Color(red: 220 / 255, green:  53 / 255, blue:  69 / 255), Color.white),
        ("AT SCENE",       Color(red: 255 / 255, green: 193 / 255, blue:   7 / 255), Color.black),
        ("FROM SCENE",     Color(red:  40 / 255, green: 167 / 255, blue:  69 / 255), Color.white),
        ("AT DESTINATION", Color(red:   0 / 255, green: 123 / 255, blue: 255 / 255), Color.white),
        ("IN SERVICE",     Color(red:  23 / 255, green: 162 / 255, blue: 184 / 255), Color.white),
        ("IN QUARTERS",    Color(red: 108 / 255, green: 117 / 255, blue: 125 / 255), Color.white),
    ];
    
    var body: some View {
        List {
            Button(action: {
                self.CallRecdText = getCurrentTime()
            }) {
                Text(CallRecdText)
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 215 / 255, green: 10 / 255, blue: 213 / 255), fgColor: .white))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.EnrouteText = getCurrentTime()
            }) {
                Text(EnrouteText)
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 220 / 255, green: 53 / 255, blue: 69 / 255), fgColor: .white))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.AtSceneText = getCurrentTime()
            }) {
                Text(AtSceneText)
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 255 / 255, green: 193 / 255, blue: 7 / 255), fgColor: .black))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.FromSceneText = getCurrentTime()
            }) {
                Text(FromSceneText)
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 40 / 255, green: 167 / 255, blue: 69 / 255), fgColor: .white))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.AtDestinationText = getCurrentTime()
            }) {
                Text(AtDestinationText)
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 0 / 255, green: 123 / 255, blue: 255 / 255), fgColor: .white))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.InServiceText = getCurrentTime()
            }) {
                Text(InServiceText)
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 23 / 255, green: 162 / 255, blue: 184 / 255), fgColor: .white))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.InQuartersText = getCurrentTime()
            }) {
                Text(InQuartersText)
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 108 / 255, green: 117 / 255, blue: 125 / 255), fgColor: .white))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

            Button(action: {
                self.CallRecdText = "CALL REC'D"
                self.EnrouteText = "ENROUTE"
                self.AtSceneText = "AT SCENE"
                self.FromSceneText = "FROM SCENE"
                self.AtDestinationText = "AT DESTINATION"
                self.InServiceText = "IN SERVICE"
                self.InQuartersText = "IN QUARTERS"
            }) {
                Text("Reset")
            }
            .buttonStyle(BtnStyle(bgColor: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255), fgColor: .black))
            .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowPlatterColor(.clear)

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
            .padding(8)
            .foregroundColor(fgColor)
            .background(bgColor)
            .cornerRadius(8)
    }
}
