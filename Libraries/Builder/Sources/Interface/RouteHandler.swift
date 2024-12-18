//
// RouteHandler.swift
// BuilderInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

public protocol RouteHandler {

  var routes: [Route.Type] { get }

  func destination(forRoute route: Route) -> any Feature.Type

}
