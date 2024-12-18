//
// HomeFeature.swift
// Home
//
//
// Created by Rodolfo Helfenstein Bulgam on 17/12/24.
//

import BuilderInterface

struct HomeFeature: Feature {

  @Service var builder: Builder

  func build(
    fromRoute route: any Route
  ) -> some View {

    HomePage(builder: builder)

  }
  
}
