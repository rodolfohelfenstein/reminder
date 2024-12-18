//
// Service.swift
// BuilderInterface
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

@propertyWrapper
public final class Service<T> {

  public var resolvedValue: T?

  public var wrappedValue: T {

    guard let resolvedValue else { preconditionFailure() }

    return resolvedValue

  }

  public init(
    resolvedValue: T? = nil
  ) {
    self.resolvedValue = resolvedValue
  }

}
