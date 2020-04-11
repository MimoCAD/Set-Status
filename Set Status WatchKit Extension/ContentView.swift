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
            .foregroundColor(.red)

            Button(action: {
                self.OnSceneText = getCurrentTime()
            }) {
                Text(OnSceneText)
            }.foregroundColor(.yellow)

            Button(action: {
                self.LeaveSceneText = getCurrentTime()
            }) {
                Text(LeaveSceneText)
            }.foregroundColor(.green)

            Button(action: {
                self.AtHospitalText = getCurrentTime()
            }) {
                Text(AtHospitalText)
            }.foregroundColor(.blue)

            Button(action: {
                self.InServiceText = getCurrentTime()
            }) {
                Text(InServiceText)
            }.foregroundColor(.gray)

            Button(action: {
                self.EnrouteText = "Enroute"
                self.OnSceneText = "On Scene"
                self.LeaveSceneText = "Leave Scene"
                self.AtHospitalText = "At Hospital"
                self.InServiceText = "In Service"
            }) {
                Text("Reset")
            }
        }
        .navigationBarTitle("Times")
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
