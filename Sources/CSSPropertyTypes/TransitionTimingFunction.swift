//
//  TransitionTimingFunction.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `transition-timing-function` property sets how intermediate values are calculated
/// for CSS properties being affected by a transition effect.
///
/// This, in essence, lets you establish an acceleration curve so that the speed of the transition
/// can vary over its duration. This acceleration curve is defined using one easing function for
/// each property to be transitioned.
///
/// - SeeAlso: [MDN Web Docs on transition-timing-function](https://developer.mozilla.org/en-US/docs/Web/CSS/transition-timing-function)
public enum TransitionTimingFunction: Property {
  public static let property: String = "transition-timing-function"

  /// A list of individual easing functions to be applied to different properties
  case list([EasingFunction])

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .list(let functions):
      return functions.map { $0.description }.joined(separator: ", ")
    case .global(let global):
      return global.description
    }
  }

  /// Creates a timing function with a single easing function
  public init(_ function: EasingFunction) {
    self = .list([function])
  }

  /// Creates a timing function with multiple easing functions
  public init(_ functions: [EasingFunction]) {
    self = .list(functions)
  }

  /// Creates a timing function with multiple easing functions
  public init(_ functions: EasingFunction...) {
    self = .list(functions)
  }
}

// Convenience extensions for common easing functions
extension TransitionTimingFunction {
  /// Equal to cubic-bezier(0.25, 0.1, 0.25, 1.0), the default value,
  /// increases in velocity towards the middle of the transition, slowing back down at the end.
  public static var ease: TransitionTimingFunction {
    .init(.ease)
  }

  /// Equal to cubic-bezier(0.0, 0.0, 1.0, 1.0), transitions at an even speed.
  public static var linear: TransitionTimingFunction {
    .init(.linear)
  }

  /// Equal to cubic-bezier(0.42, 0, 1.0, 1.0), starts off slowly,
  /// with the transition speed increasing until complete.
  public static var easeIn: TransitionTimingFunction {
    .init(.easeIn)
  }

  /// Equal to cubic-bezier(0, 0, 0.58, 1.0), starts transitioning quickly,
  /// slowing down as the transition continues.
  public static var easeOut: TransitionTimingFunction {
    .init(.easeOut)
  }

  /// Equal to cubic-bezier(0.42, 0, 0.58, 1.0), starts transitioning slowly,
  /// speeds up, and then slows down again.
  public static var easeInOut: TransitionTimingFunction {
    .init(.easeInOut)
  }

  /// Equal to steps(1, jump-start)
  public static var stepStart: TransitionTimingFunction {
    .init(.stepStart)
  }

  /// Equal to steps(1, jump-end)
  public static var stepEnd: TransitionTimingFunction {
    .init(.stepEnd)
  }

  /// Creates a custom cubic-bezier timing function
  public static func cubicBezier(
    x1: Double,
    y1: Double,
    x2: Double,
    y2: Double
  ) -> TransitionTimingFunction {
    .init(EasingFunction.cubicBezier(x1, y1, x2, y2))
  }

  /// Creates a custom steps timing function
  public static func steps(count: Int, position: StepPosition = .end) -> TransitionTimingFunction {
    .init(EasingFunction.steps(count, position))
  }
}
