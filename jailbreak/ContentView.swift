//
//  ContentView.swift
//  jailbreak
//
//  Created by dylan on 5/23/26.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var result = ""
    @Environment(\.openURL) private var openURL
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "haha i got you"
        content.body = "you got absolutely baited 💀"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notifications allowed")
            } else {
                print("Notifications denied")
            }
        }
    }

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack {
                Spacer()

                Text("jailbreak for ALL IOS VERSIONS!")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                HStack {
                    Button("jailbreak") {
                        sendNotification()

                        if let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ") {
                            openURL(url)
                                    }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)

                    Button("no jailbreak") {
                        result = "no"
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }


                if result == "no" {
                    Text("you're such a boring person and a party pooper and now you have bad luck unless you jailbreak")
                        .foregroundColor(.white)
                }

                Spacer()

                Text("bitetheapple")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
            }
        }
        .onAppear {
            requestNotificationPermission()
        }
    }
}
