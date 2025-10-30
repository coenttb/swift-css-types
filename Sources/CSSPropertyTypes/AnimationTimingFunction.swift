import CSSTypeTypes
import Foundation

/// The CSS animation-timing-function property sets how an animation progresses through the duration of each cycle.
///
/// Example:
/// ```swift
/// .animationTimingFunction(.linear)             // animation-timing-function: linear
/// .animationTimingFunction(.easeInOut)          // animation-timing-function: ease-in-out
/// .animationTimingFunction(.steps(5, .end))     // animation-timing-function: steps(5, end)
/// .animationTimingFunction(.cubicBezier(0.1, -0.6, 0.2, 0))  // animation-timing-function: cubic-bezier(0.1, -0.6, 0.2, 0)
/// ```
///
/// - SeeAlso: [MDN Web Docs on animation-timing-function](https://developer.mozilla.org/en-US/docs/Web/CSS/animation-timing-function)
public enum AnimationTimingFunction: Property {

  public static let property: String = "animation-timing-function"

  /// The easing function for the animation
  case function(EasingFunction)

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Linear easing function (constant speed)
  public static let linear = AnimationTimingFunction.function(.linear)

  /// Ease easing function (default, slow start and end)
  public static let ease = AnimationTimingFunction.function(.ease)

  /// Ease-in easing function (slow start)
  public static let easeIn = AnimationTimingFunction.function(.easeIn)

  /// Ease-out easing function (slow end)
  public static let easeOut = AnimationTimingFunction.function(.easeOut)

  /// Ease-in-out easing function (slow start and end)
  public static let easeInOut = AnimationTimingFunction.function(.easeInOut)

  /// Step-start easing function (immediate jump to end state)
  public static let stepStart = AnimationTimingFunction.function(.stepStart)

  /// Step-end easing function (jump to end state at the end)
  public static let stepEnd = AnimationTimingFunction.function(.stepEnd)

  /// Custom cubic bezier easing function
  public static func cubicBezier(
    _ x1: Double,
    _ y1: Double,
    _ x2: Double,
    _ y2: Double
  ) -> AnimationTimingFunction {
    return .function(.cubicBezier(x1, y1, x2, y2))
  }

  /// Custom steps easing function
  public static func steps(_ count: Int, _ position: StepPosition? = nil) -> AnimationTimingFunction
  {
    return .function(.steps(count, position))
  }
}

/// CSS Output conversion
extension AnimationTimingFunction: CustomStringConvertible {
  /// Converts the animation timing function to its CSS string representation
  public var description: String {
    switch self {
    case .function(let function):
      return function.description
    case .global(let global):
      return global.description
    }
  }
}
