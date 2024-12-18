//
// Builder.swift
// BuilderInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import SwiftUI

public protocol Builder {

  @MainActor
  func build(
    forRoute route: Route
  ) -> AnyView

}
