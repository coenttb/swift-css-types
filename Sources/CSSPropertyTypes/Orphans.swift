import CSSTypeTypes
import Foundation

/// The CSS `orphans` property sets the minimum number of lines in a block container that
/// must be shown at the bottom of a page, region, or column.
///
/// In typography, an orphan is the first line of a paragraph that appears alone at
/// the bottom of a page. (The paragraph continues on a following page.)
///
/// Example:
/// ```swift
/// .orphans(2)     // orphans: 2
/// .orphans(3)     // orphans: 3
/// ```
///
/// - SeeAlso: [MDN Web Docs on orphans](https://developer.mozilla.org/en-US/docs/Web/CSS/orphans)
public enum Orphans: Property {
    public static let property: String = "orphans"

    /// The minimum number of lines that can stay by themselves at the bottom
    /// of a fragment before a fragmentation break.
    case value(Int)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension Orphans: CustomStringConvertible {
    /// Converts the orphans value to its CSS string representation
    public var description: String {
        switch self {
        case .value(let value):
            return "\(max(1, value))"  // Ensure value is at least 1

        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers
extension Orphans {
    /// Creates an orphans property with the specified value
    ///
    /// - Parameter value: The minimum number of orphan lines (must be at least 1)
    /// - Returns: An Orphans instance
    public static func lines(_ value: Int) -> Orphans {
        .value(max(1, value))  // Ensure value is at least 1
    }

    /// Default value (2 lines)
    public static let defaultValue: Orphans = .value(2)
}

extension Orphans: ExpressibleByIntegerLiteral {
    /// Creates an orphans value from an integer literal
    ///
    /// - Parameter value: The number of orphan lines
    public init(integerLiteral value: Int) {
        self = .value(max(1, value))  // Ensure value is at least 1
    }
}
