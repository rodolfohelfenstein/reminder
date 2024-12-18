//
// ServiceStore.swift
// Builder
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import Foundation

final class ServiceStore {

  typealias ServiceFactory	= () -> AnyObject
  typealias Factories				= Dictionary<String, ServiceFactory>
  typealias Services				= NSMapTable<NSString, AnyObject>

  var factories: Factories
  var services: Services

  init(
    factories: Factories = [:],
    services: Services = NSMapTable(
      keyOptions: .strongMemory,
      valueOptions: .weakMemory
    )
  ) {
    self.factories = factories
    self.services = services
  }

  func store<S>(
    _ serviceType: S.Type,
    _ serviceFactory: @escaping ServiceFactory
  ) {

    let key = String(describing: serviceType)

    factories[key] = serviceFactory

  }

  func restore<S>(
    _ serviceType: S.Type
  ) -> S? {

    let key = String(describing: serviceType)

    let instance = services.object(forKey: key as NSString)

    guard let instance else {

      let newInstance = factories[key]?()

      services.setObject(newInstance, forKey: key as NSString)

      return newInstance as? S

    }

    return instance as? S

  }

}
