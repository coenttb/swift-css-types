import CSSTypeTypes
import Foundation

/// The CSS `text-kashida-space` property controls how kashida elongation is used
/// for text justification in Arabic script.
///
/// Kashida is a typographic method used in Arabic and some other scripts that involves
/// extending certain characters by elongating the connection between them, rather than
/// adding spaces between words (as in Latin-based scripts).
///
/// - Note: This is a non-standard property primarily supported in Microsoft browsers,
///         but it's important for proper Arabic typography.
///
/// Example:
/// ```swift
/// .textKashidaSpace(.inherit)             // text-kashida-space: inherit
/// .textKashidaSpace(.percentage(75))      // text-kashida-space: 75%
/// ```
///
/// - SeeAlso: [Microsoft Docs on text-kashida-space](https://docs.microsoft.com/en-us/previous-versions/ms531174(v=vs.85))
public enum TextKashidaSpace: Property {
    public static let property: String = "text-kashida-space"

    /// No kashida expansion is used.
    case none

    /// Percentage of the total justification space that can be filled with kashida expansions.
    /// A value of 100% means that kashida expansions fill all of the justification space,
    /// and no additional white space is used for justification.
    case percentage(Percentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TextKashidaSpace: CustomStringConvertible {
    /// Converts the text-kashida-space value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return 0.percent.description

        case .percentage(let percentage):
            return percentage.description

        case .global(let global):
            return global.description
        }
    }
}

// Convenience properties for common kashida values
extension TextKashidaSpace {
    /// No kashida expansion
    public static let off = TextKashidaSpace.none

    /// Default kashida expansion (typically 50%)
    public static let normal = TextKashidaSpace.percentage(50)

    /// Full kashida expansion (100%) - use only kashida for justification
    public static let full = TextKashidaSpace.percentage(100)
}
