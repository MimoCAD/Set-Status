//
//  ContentView.swift
//  Set Status WatchKit Extension
//
//  Created by Mark Tomlin on 4/10/20.
//  Copyright © 2020 MimoCAD Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var CallRecd      = Status(Text: "CALL REC'D",     bgColor: Colors.Magenta, fgColor: Colors.White)
    @State var Enroute       = Status(Text: "ENROUTE",        bgColor: Colors.Red,     fgColor: Colors.White)
    @State var AtScene       = Status(Text: "AT SCENE",       bgColor: Colors.Yellow,  fgColor: Colors.Black)
    @State var FromScene     = Status(Text: "FROM SCENE",     bgColor: Colors.Green,   fgColor: Colors.White)
    @State var AtDestination = Status(Text: "AT DESTINATION", bgColor: Colors.Blue,    fgColor: Colors.White)
    @State var InService     = Status(Text: "IN SERVICE",     bgColor: Colors.Cyan,    fgColor: Colors.White)
    @State var InQuarters    = Status(Text: "IN QUARTERS",    bgColor: Colors.Gray,    fgColor: Colors.White)
           var Reset         = Status(Text: "Reset",          bgColor: Colors.White,   fgColor: Colors.Black)

    var body: some View {
        List {
            statusButton(Status: CallRecd) {
                     CallRecd = Status(Text: "TOA: " + getCurrentTime(), bgColor: Colors.Black, fgColor: Colors.Magenta)
            }

            statusButton(Status: Enroute) {
                      Enroute = Status(Text: "  2: " + getCurrentTime(), bgColor: Colors.Black, fgColor: Colors.Red)
            }

            statusButton(Status: AtScene) {
                      AtScene = Status(Text: " 21: " + getCurrentTime(), bgColor: Colors.Black, fgColor: Colors.Yellow)
            }

            statusButton(Status: FromScene) {
                    FromScene = Status(Text: " 18: " + getCurrentTime(), bgColor: Colors.Black, fgColor: Colors.Green)
            }

            statusButton(Status: AtDestination) {
                AtDestination = Status(Text: "  6: " + getCurrentTime(), bgColor: Colors.Black, fgColor: Colors.Blue)
            }

            statusButton(Status: InService) {
                    InService = Status(Text: " 28: " + getCurrentTime(), bgColor: Colors.Black, fgColor: Colors.Cyan)
            }

            statusButton(Status: InQuarters) {
                   InQuarters = Status(Text: "  5: " + getCurrentTime(), bgColor: Colors.Black, fgColor: Colors.Gray)
            }

            statusButton(Status: Reset) {
                     CallRecd = Status(Text: "CALL REC'D",     bgColor: Colors.Magenta, fgColor: Colors.White)
                      Enroute = Status(Text: "ENROUTE",        bgColor: Colors.Red,     fgColor: Colors.White)
                      AtScene = Status(Text: "AT SCENE",       bgColor: Colors.Yellow,  fgColor: Colors.Black)
                    FromScene = Status(Text: "FROM SCENE",     bgColor: Colors.Green,   fgColor: Colors.White)
                AtDestination = Status(Text: "AT DESTINATION", bgColor: Colors.Blue,    fgColor: Colors.White)
                    InService = Status(Text: "IN SERVICE",     bgColor: Colors.Cyan,    fgColor: Colors.White)
                   InQuarters = Status(Text: "IN QUARTERS",    bgColor: Colors.Gray,    fgColor: Colors.White)
            }
        
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

struct Status: Identifiable {
    let id = UUID()
    var Text: String
    var bgColor: Color
    var fgColor: Color
}

struct statusButton: View {
    var Status: Status
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(Status.Text)
        }
        .buttonStyle(BtnStyle(bgColor: Status.bgColor, fgColor: Status.fgColor))
        .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowPlatterColor(.clear)
    }
}

enum Colors {
    static let Black    = Color(red:   0 / 255, green:   0 / 255, blue:   0 / 255) // 30 | 40
    static let Red      = Color(red: 220 / 255, green:  53 / 255, blue:  69 / 255) // 31 | 41
    static let Green    = Color(red:  40 / 255, green: 167 / 255, blue:  69 / 255) // 32 | 42
    static let Yellow   = Color(red: 255 / 255, green: 193 / 255, blue:   7 / 255) // 33 | 43
    static let Blue     = Color(red:   0 / 255, green: 123 / 255, blue: 255 / 255) // 34 | 44
    static let Magenta  = Color(red: 215 / 255, green:  10 / 255, blue: 213 / 255) // 35 | 45
    static let Cyan     = Color(red:  23 / 255, green: 162 / 255, blue: 184 / 255) // 36 | 46
    static let White    = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255) // 37 | 47
    static let Gray     = Color(red: 108 / 255, green: 117 / 255, blue: 125 / 255) // 90 | 100
}
