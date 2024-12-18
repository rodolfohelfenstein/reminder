//
// FeatureStore.swift
// Builder
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface
import Foundation

final class FeatureStore {

  var handlers: Dictionary<String, RouteHandler>

  public init(
    handlers: Dictionary<String, RouteHandler> = [:]
  ) {
    self.handlers = handlers
  }

  func store(
    _ routeHandler: RouteHandler
  ) {

    routeHandler
      .routes
      .forEach { handlers[$0.identifier] = routeHandler }

  }

  func restore(
    forRoute route: Route
  ) -> (any Feature)? {

    let featureIdentifier = type(of: route).identifier

    let featureHandler = handlers[featureIdentifier]

    let featureType = featureHandler?.destination(forRoute: route)

    let feature = featureType?.init()

    return feature

  }

}
