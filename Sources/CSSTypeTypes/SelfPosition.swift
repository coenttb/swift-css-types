import Foundation

/// Represents a CSS self-position value.
///
/// The `SelfPosition` type is used by alignment properties like `justify-self`, `align-self`,
/// `place-self`, `justify-items`, and `align-items` to align a box within its alignment container.
///
/// Example:
/// ```swift
/// .alignSelf(.center)         // align-self: center
/// .justifySelf(.flexEnd)      // justify-self: flex-end
/// .placeSelf(.start, .end)    // place-self: start end
/// ```
///
/// - SeeAlso: [MDN Web Docs on self-position](https://developer.mozilla.org/en-US/docs/Web/CSS/self-position)
public enum SelfPosition: String, Sendable, Hashable, CaseIterable {
    /// Centers the alignment subject within its alignment container
    case center

    /// Aligns the alignment subject flush with the alignment container's start edge
    case start

    /// Aligns the alignment subject flush with the alignment container's end edge
    case end

    /// Aligns the alignment subject flush with the edge of the alignment container
    /// corresponding to the alignment subject's start side
    case selfStart = "self-start"

    /// Aligns the alignment subject flush with the edge of the alignment container
    /// corresponding to the alignment subject's end side
    case selfEnd = "self-end"

    /// In flex layout, aligns the alignment subject flush with the edge of the alignment container
    /// corresponding to the flex container's main-start or cross-start side.
    /// Identical to `start` for other layout modes.
    case flexStart = "flex-start"

    /// In flex layout, aligns the alignment subject flush with the edge of the alignment container
    /// corresponding to the flex container's main-end or cross-end side.
    /// Identical to `end` for other layout modes.
    case flexEnd = "flex-end"

    /// The values that can be used in both axes
    public static let allPositions: [SelfPosition] = [
        .center, .start, .end, .selfStart, .selfEnd, .flexStart, .flexEnd,
    ]
}

/// Provides string conversion for CSS output
extension SelfPosition: CustomStringConvertible {
    /// Converts the self-position to its CSS string representation
    public var description: String {
        rawValue
    }
}

public protocol SelfPositionConvertible {
    static func position(_: OverflowPosition?, _: SelfPosition) -> Self
}

extension SelfPositionConvertible {

    public static var center: Self { .center() }

    /// Creates a center position
    public static func center(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .center)
    }

    public static var start: Self { .start() }

    /// Creates a start position
    public static func start(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .start)
    }

    public static var end: Self { .end() }

    /// Creates an end position
    public static func end(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .end)
    }

    public static var selfStart: Self { .selfStart() }

    /// Creates a self-start position
    public static func selfStart(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .selfStart)
    }

    public static var selfEnd: Self { .selfEnd() }

    /// Creates a self-end position
    public static func selfEnd(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .selfEnd)
    }

    public static var flexStart: Self { .flexStart() }

    /// Creates a flex-start position
    public static func flexStart(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .flexStart)
    }

    public static var flexEnd: Self { .flexEnd() }

    /// Creates a flex-end position
    public static func flexEnd(_ value: OverflowPosition? = nil) -> Self {
        return .position(value, .flexEnd)
    }

    /// Creates a safe position alignment
    public static func safe(_ position: SelfPosition) -> Self {
        return .position(.safe, position)
    }

    /// Creates an unsafe position alignment
    public static func unsafe(_ position: SelfPosition) -> Self {
        return .position(.unsafe, position)
    }
}
