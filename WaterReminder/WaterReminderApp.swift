//
// WaterReminderApp.swift
// WaterReminder
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import SwiftUI

import Builder
import BuilderInterface

@main
struct WaterReminderApp: App {

  let builder: WaterReminderBuilder

  init() {

    self.builder = WaterReminderBuilder()

    self.registerServices()

    self.registerFeatures()

  }

  var body: some Scene {

    WindowGroup { appView }

  }

}
