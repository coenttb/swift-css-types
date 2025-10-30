import CSSTypeTypes
import Foundation

/// The CSS animation shorthand property applies an animation between styles.
///
/// It is a shorthand for animation-name, animation-duration, animation-timing-function,
/// animation-delay, animation-iteration-count, animation-direction, animation-fill-mode,
/// and animation-play-state.
///
/// Example:
/// ```swift
/// .animation(.name("slide-in"))  // Simple animation with just a name
///
/// // Animation with multiple properties
/// .animation(
///   .duration(.s(3)),
///   .timingFunction(.easeIn),
///   .delay(.s(1)),
///   .iterationCount(.infinite),
///   .direction(.reverse),
///   .fillMode(.both),
///   .playState(.running),
///   .name("slide-in")
/// )
///
/// // Multiple animations
/// .animation([
///   .single(
///     .duration(.s(3)),
///     .timingFunction(.linear),
///     .name("slide-in")
///   ),
///   .single(
///     .duration(.s(3)),
///     .timingFunction(.easeOut),
///     .delay(.s(5)),
///     .name("slide-out")
///   )
/// ])
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation](https://developer.mozilla.org/en-US/docs/Web/CSS/animation)
public enum Animation: Property {

  public static let property: String = "animation"

  /// A single animation with multiple properties
  case single(AnimationProperties)

  /// Multiple animations
  case multiple([AnimationProperties])

  /// No animation
  case none

  /// Global value
  case global(CSSTypeTypes.Global)

  /// Convenience initializer for creating an animation with properties
  public init(_ properties: AnimationProperty...) {
    if properties.isEmpty {
      self = .none
    } else {
      self = .single(AnimationProperties(properties: properties))
    }
  }

  /// Convenience initializer for creating an animation with a name only
  public static func name(_ name: CSSString) -> Animation {
    return .single(AnimationProperties(properties: [.name(.keyframes(.string(name)))]))
  }
}

/// Properties that can be applied to an animation
public enum AnimationProperty: Sendable, Hashable {
  /// The name of the keyframes rule
  case name(AnimationName)

  /// The duration of the animation
  case duration(Time)

  /// The timing function used
  case timingFunction(EasingFunction)

  /// The delay before starting the animation
  case delay(Time)

  /// The number of times the animation should repeat
  case iterationCount(AnimationIterationCount)

  /// The direction of the animation
  case direction(AnimationDirection)

  /// The fill mode of the animation
  case fillMode(AnimationFillMode)

  /// The play state of the animation
  case playState(AnimationPlayState)
}

/// Collection of animation properties for a single animation
public struct AnimationProperties: Sendable, Hashable {
  /// Optional name of the animation
  public var name: AnimationName?

  /// Optional duration of the animation
  public var duration: Time?

  /// Optional timing function for the animation
  public var timingFunction: EasingFunction?

  /// Optional delay before the animation starts
  public var delay: Time?

  /// Optional number of times the animation should repeat
  public var iterationCount: AnimationIterationCount?

  /// Optional direction of the animation
  public var direction: AnimationDirection?

  /// Optional fill mode for the animation
  public var fillMode: AnimationFillMode?

  /// Optional play state for the animation
  public var playState: AnimationPlayState?

  /// Creates a new animation properties collection
  public init(
    name: AnimationName? = nil,
    duration: Time? = nil,
    timingFunction: EasingFunction? = nil,
    delay: Time? = nil,
    iterationCount: AnimationIterationCount? = nil,
    direction: AnimationDirection? = nil,
    fillMode: AnimationFillMode? = nil,
    playState: AnimationPlayState? = nil
  ) {
    self.name = name
    self.duration = duration
    self.timingFunction = timingFunction
    self.delay = delay
    self.iterationCount = iterationCount
    self.direction = direction
    self.fillMode = fillMode
    self.playState = playState
  }

  /// Creates animation properties from an array of animation property values
  public init(properties: [AnimationProperty]) {
    for property in properties {
      switch property {
      case .name(let value): name = value
      case .duration(let value): duration = value
      case .timingFunction(let value): timingFunction = value
      case .delay(let value): delay = value
      case .iterationCount(let value): iterationCount = value
      case .direction(let value): direction = value
      case .fillMode(let value): fillMode = value
      case .playState(let value): playState = value
      }
    }
  }
}

/// CSS Output conversion
extension Animation: CustomStringConvertible {
  /// Converts the animation to its CSS string representation
  public var description: String {
    switch self {
    case .single(let properties):
      return properties.description

    case .multiple(let animations):
      return animations.map { $0.description }.joined(separator: ", ")

    case .none:
      return "none"

    case .global(let global):
      return global.description
    }
  }
}

/// CSS Output conversion for animation properties
extension AnimationProperties: CustomStringConvertible {
  /// Converts the animation properties to their CSS string representation
  public var description: String {
    var components: [String] = []

    // The order matters for certain properties in CSS animations
    // Duration should come before delay
    if let duration = duration {
      components.append(duration.description)
    }

    if let timingFunction = timingFunction {
      components.append(timingFunction.description)
    }

    if let delay = delay {
      components.append(delay.description)
    }

    if let iterationCount = iterationCount {
      components.append(iterationCount.description)
    }

    if let direction = direction {
      components.append(direction.description)
    }

    if let fillMode = fillMode {
      components.append(fillMode.description)
    }

    if let playState = playState {
      components.append(playState.description)
    }

    // Name should be the last property for clarity
    if let name = name {
      components.append(name.description)
    }

    return components.isEmpty ? "none" : components.joined(separator: " ")
  }
}
