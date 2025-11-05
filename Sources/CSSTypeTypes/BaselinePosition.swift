import Foundation

/// Represents a CSS baseline position value for alignment properties.
///
/// The `BaselinePosition` data type is used in various CSS alignment properties to
/// align elements relative to a baseline. It can specify whether to use the first or last
/// baseline as the reference point.
///
/// Example:
/// ```swift
/// .alignItems(.firstBaseline)  // Aligns items to the first baseline
/// .alignSelf(.lastBaseline)    // Aligns the element to the last baseline
/// ```
///
/// - Note: If an element doesn't have a baseline context, a fallback alignment is used.
///         For first baseline, the fallback is typically "safe self-start" or "safe start";
///         for last baseline, the fallback is typically "safe self-end" or "safe end".
///
/// - SeeAlso: [MDN Web Docs on baseline-position values](https://developer.mozilla.org/en-US/docs/Web/CSS/baseline-position)
public struct BaselinePosition: Sendable, Hashable {
    public enum FirstLast: String, Sendable, Hashable, CustomStringConvertible {
        /// Aligns to the first baseline (default if just "baseline" is specified)
        ///
        /// Aligns the alignment baseline of the box's first baseline set with the corresponding
        /// baseline of its baseline-sharing group.
        /// ```css
        /// align-items: first baseline;
        /// /* or simply */
        /// align-items: baseline;
        /// ```
        case first = "first"

        /// Aligns to the last baseline
        ///
        /// Aligns the alignment baseline of the box's last baseline set with the corresponding
        /// baseline of its baseline-sharing group.
        /// ```css
        /// align-items: last baseline;
        /// ```
        case last = "last"

        public var description: String { rawValue }
    }

    let firstLast: FirstLast?

    public init(firstLast: FirstLast?) {
        self.firstLast = firstLast
    }

    public static let first: Self = .init(firstLast: .first)
    public static let last: Self = .init(firstLast: .last)
    public static let firstBaseline: Self = .init(firstLast: .first)
    public static let lastBaseline: Self = .init(firstLast: .last)
    public static let baseline: Self = .init(firstLast: nil)
    public static func baseline(_ firstLast: FirstLast) -> Self { .init(firstLast: firstLast) }
}

/// Provides string conversion for CSS output
extension BaselinePosition: CustomStringConvertible {
    /// Converts the baseline position value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return firstLast.map { "\($0) baseline" } ?? "baseline"
    }
}

public protocol BaselinePositionConvertible {
    static func baseline(_: BaselinePosition) -> Self
}

extension BaselinePositionConvertible {
    /// Creates a baseline alignment
    public static var firstBaseline: Self { .baseline(.firstBaseline) }

    /// Creates a baseline alignment
    public static var lastBaseline: Self { .baseline(.lastBaseline) }

    /// Creates a simple baseline alignment
    public static var baseline: Self { .baseline(.baseline) }
}
