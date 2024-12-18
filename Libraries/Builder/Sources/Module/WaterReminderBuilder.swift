//
// Builder.swift
// BuilderInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface

public final class WaterReminderBuilder {

  let serviceStore: ServiceStore
  let featureStore: FeatureStore

  init(
    serviceStore: ServiceStore,
    featureStore: FeatureStore
  ) {
    self.serviceStore = serviceStore
    self.featureStore = featureStore
  }

  public init() {
    self.serviceStore = ServiceStore()
    self.featureStore = FeatureStore()
  }

}

extension WaterReminderBuilder {

  public func register<T>(
    _ serviceType: T.Type,
    _ serviceFactory: @escaping () -> AnyObject
  ) {

    serviceStore.store(serviceType, serviceFactory)

  }

  public func register<T>(
    _ serviceType: T.Type,
    _ service: AnyObject
  ) {

    serviceStore.store(serviceType, { service })

  }

}

extension WaterReminderBuilder {

  public func register(
    _ routeHandler: RouteHandler
  ) {

    featureStore.store(routeHandler)

  }

}

extension WaterReminderBuilder: Builder {

  public func build(
    forRoute route: any Route
  ) -> AnyView {

    let feature = featureStore.restore(forRoute: route)

    guard let feature else {
      preconditionFailure("Missing Route: \(route.self)")
    }

    Mirror(
      reflecting: feature
    )
    .children
    .compactMap { $0.value as? Resolvable }
    .forEach { $0.resolve(withServiceStore: serviceStore) }

    return AnyView(feature.build(fromRoute: route))

  }

}
