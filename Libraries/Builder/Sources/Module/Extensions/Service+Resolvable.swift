//
// Resolvable.swift
// BuilderInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface

protocol Resolvable {

  func resolve(
    withServiceStore serviceStore: ServiceStore
  )

}

extension Service: Resolvable {

  func resolve(
    withServiceStore serviceStore: ServiceStore
  ) {

    guard resolvedValue == nil else { return }

    guard let value = serviceStore.restore(T.self) else { return }

    resolvedValue = value

  }

}
