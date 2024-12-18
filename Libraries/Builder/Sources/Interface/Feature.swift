//
// Feature.swift
// BuilderInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

@_exported import SwiftUI

public protocol Feature {

  associatedtype Body : View

  @MainActor
  func build(fromRoute route: Route) -> Self.Body

  init()

}
