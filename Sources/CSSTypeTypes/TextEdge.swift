import Foundation

/// Represents CSS text-edge keywords that specify font metrics for block edges.
///
/// The `TextEdge` type defines keywords that specify font metrics representing specific regions
/// on a font's block-start edge and block-end edge. These keywords are used in properties
/// like `text-box-edge` to specify the amount of space to trim from the block edges
/// of a text element's container.
///
/// Example:
/// ```swift
/// .textBoxEdge(.text)                  // text-box-edge: text
/// .textBoxEdge(.cap, .alphabetic)      // text-box-edge: cap alphabetic
/// ```
///
/// - Note: When one value is specified, the position of both the font's over edge and under edge
///         are specified using that same keyword. When two values are specified, the first value
///         specifies the position of the font's over edge, and the second value specifies the
///         position of the font's under edge.
///
/// - SeeAlso: [MDN Web Docs on text-edge](https://developer.mozilla.org/en-US/docs/Web/CSS/text-edge)
public enum TextEdge: Sendable, Hashable {
    /// A single value for both over and under edges
    case single(Value)

    /// Separate values for over and under edges
    case pair(OverValue, UnderValue)

    /// Values for both over and under edges
    public enum Value: String, Sendable, Hashable, CaseIterable {
        /// Both font edges are at text baseline (includes font's ascenders/descenders but excludes half-leading)
        case text

        /// Both font edges are at the ideographic baseline
        case ideographic

        /// Both font edges are at the ideographic ink baseline
        case ideographicInk = "ideographic-ink"
    }

    /// Values for the over edge (top of text)
    public enum OverValue: String, Sendable, Hashable, CaseIterable {
        /// The font's over edge is at text-over baseline (includes ascenders but excludes half-leading)
        case text

        /// The font's over edge is at the ideographic baseline
        case ideographic

        /// The font's over edge is at the ideographic ink baseline
        case ideographicInk = "ideographic-ink"

        /// The font's over edge is at cap-height baseline (top of capital letters)
        case cap

        /// The font's over edge is at x-height baseline (top of short lowercase letters)
        case ex
    }

    /// Values for the under edge (bottom of text)
    public enum UnderValue: String, Sendable, Hashable, CaseIterable {
        /// The font's under edge is at text-under baseline (includes descenders but excludes half-leading)
        case text

        /// The font's under edge is at the ideographic baseline
        case ideographic

        /// The font's under edge is at the ideographic ink baseline
        case ideographicInk = "ideographic-ink"

        /// The font's under edge is at alphabetic baseline (bottom of short lowercase letters)
        case alphabetic
    }

    /// Both font edges are set to 'text' baseline
    public static let text = TextEdge.single(.text)

    /// Both font edges are set to 'ideographic' baseline
    public static let ideographic = TextEdge.single(.ideographic)

    /// Both font edges are set to 'ideographic-ink' baseline
    public static let ideographicInk = TextEdge.single(.ideographicInk)

    /// Over edge at cap height, under edge at alphabetic baseline (common for Latin text)
    public static let capAlphabetic = TextEdge.pair(.cap, .alphabetic)

    /// Over edge at x-height, under edge at alphabetic baseline
    public static let exAlphabetic = TextEdge.pair(.ex, .alphabetic)
}

/// Provides string conversion for CSS output
extension TextEdge: CustomStringConvertible {
    /// Converts the text edge value to its CSS string representation
    public var description: String {
        switch self {
        case .single(let value):
            return value.rawValue
        case .pair(let overValue, let underValue):
            return "\(overValue.rawValue) \(underValue.rawValue)"
        }
    }
}
