import Foundation

/// Represents a CSS easing function that describes the rate at which a value changes.
///
/// Easing functions are used to describe how fast values change during animations and transitions,
/// allowing you to vary the animation's speed over the course of its duration.
///
/// Example:
/// ```swift
/// .transitionTimingFunction(.ease)              // Predefined easing
/// .transitionTimingFunction(.cubicBezier(0.42, 0, 0.58, 1))  // Custom cubic Bezier
/// .transitionTimingFunction(.steps(4, .end))    // Stepped animation
/// ```
///
/// - SeeAlso: [MDN Web Docs on easing functions](https://developer.mozilla.org/en-US/docs/Web/CSS/easing-function)
public enum EasingFunction: Sendable, Hashable {
    /// Linear easing - constant rate with no acceleration or deceleration
    case linear

    /// Custom linear easing function with multiple progress points
    case linearPoints([LinearPoint])

    /// Slow start, then fast, then slow finish (cubic-bezier(0.25, 0.1, 0.25, 1))
    case ease

    /// Slow start, then fast finish (cubic-bezier(0.42, 0, 1, 1))
    case easeIn

    /// Fast start, then slow finish (cubic-bezier(0, 0, 0.58, 1))
    case easeOut

    /// Slow start, fast middle, slow finish (cubic-bezier(0.42, 0, 0.58, 1))
    case easeInOut

    /// Custom cubic Bezier curve with two control points
    case cubicBezier(Double, Double, Double, Double)

    /// Jump immediately to final state (steps(1, jump-start))
    case stepStart

    /// Stay in initial state until end, then jump to final state (steps(1, jump-end))
    case stepEnd

    /// Custom stepped animation
    case steps(Int, StepPosition?)
}

/// Represents a point in a linear easing function with an optional timing percentage
public struct LinearPoint: Sendable, Hashable {
    /// The progress value (typically between 0 and 1)
    public let value: Double

    /// Optional timing percentage for when this point is reached
    public let percentage: Percentage?

    /// Creates a linear easing point with an optional timing percentage
    ///
    /// - Parameters:
    ///   - value: The progress value (typically between 0 and 1)
    ///   - percentage: Optional timing percentage (0-100) for when this point is reached
    public init(value: Double, percentage: Percentage? = nil) {
        self.value = value
        self.percentage = percentage
    }
}

/// Represents the position of steps in a stepped easing function
public enum StepPosition: String, Sendable, Hashable, CustomStringConvertible {
    /// Equivalent to jump-start; the first jump happens at the start
    case start

    /// Equivalent to jump-end; the last jump happens at the end
    case end

    /// The first jump happens at the start position
    case jumpStart = "jump-start"

    /// The last jump happens at the end position
    case jumpEnd = "jump-end"

    /// No jump occurs at the start or end positions
    case jumpNone = "jump-none"

    /// Jumps occur at both the start and end positions
    case jumpBoth = "jump-both"

    public var description: String {
        rawValue
    }
}

/// Provides string conversion for CSS output
extension EasingFunction: CustomStringConvertible {
    /// Converts the easing function to its CSS string representation
    public var description: String {
        switch self {
        case .linear:
            return "linear"

        case .linearPoints(let points):
            let pointsString = points.map { point in
                if let percentage = point.percentage {
                    return "\(point.value.truncatingRemainder()) \(percentage.description)"
                } else {
                    return point.value.truncatingRemainder()
                }
            }.joined(separator: ", ")
            return "linear(\(pointsString))"

        case .ease:
            return "ease"

        case .easeIn:
            return "ease-in"

        case .easeOut:
            return "ease-out"

        case .easeInOut:
            return "ease-in-out"

        case .cubicBezier(let x1, let y1, let x2, let y2):
            return
                "cubic-bezier(\(x1.truncatingRemainder()), \(y1.truncatingRemainder()), \(x2.truncatingRemainder()), \(y2.truncatingRemainder()))"

        case .stepStart:
            return "step-start"

        case .stepEnd:
            return "step-end"

        case .steps(let steps, let position):
            if let position = position {
                return "steps(\(steps), \(position))"
            } else {
                return "steps(\(steps))"
            }
        }
    }
}
