import CSSTypeTypes
import Foundation

/// Represents a CSS @page at-rule.
///
/// The @page at-rule is used to modify different aspects of printed pages such as
/// dimensions, orientation, and margins. It can target all pages in a print-out
/// or specific subsets using various pseudo-classes.
///
/// Examples:
/// ```swift
/// // Basic page rule
/// Page.all
///     .size(.a4)
///     .margin(.px(20))
///
/// // Target specific page types
/// Page.first
///     .margin(.px(50))
///
/// // Using landscape orientation
/// Page.all
///     .size(.a4, .landscape)
///
/// // Named page
/// Page.named("wide")
///     .size(.a4, .landscape)
///     .margin(.px(30))
/// ```
public struct Page: AtRule {
    public static let identifier: String = "page"

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a basic @page rule with no selectors
    public static let all = Page(rawValue: "@page {}")

    /// Creates a @page rule targeting the first page
    public static let first = Page(rawValue: "@page :first {}")

    /// Creates a @page rule targeting left (even-numbered) pages
    public static let left = Page(rawValue: "@page :left {}")

    /// Creates a @page rule targeting right (odd-numbered) pages
    public static let right = Page(rawValue: "@page :right {}")

    /// Creates a @page rule targeting blank pages
    public static let blank = Page(rawValue: "@page :blank {}")

    /// Creates a named @page rule for use with the page property
    /// @page wide { ... }
    public static func named(_ name: String) -> Page {
        Page(rawValue: "@page \(name) {}")
    }

    /// Adds a size property to the page rule
    /// @page { size: <value>; }
    public func size(_ value: PageSize) -> Page {
        let property = "size: \(value.rawValue);"
        return addProperty(property)
    }

    /// Adds a size property with orientation to the page rule
    /// @page { size: <value> <orientation>; }
    public func size(_ value: PageSize, _ orientation: PageOrientation) -> Page {
        let property = "size: \(value.rawValue) \(orientation.rawValue);"
        return addProperty(property)
    }

    /// Adds a margin property to the page rule
    /// @page { margin: <value>; }
    public func margin(_ value: LengthPercentage) -> Page {
        let property = "margin: \(value);"
        return addProperty(property)
    }

    /// Adds a margin property with multiple values to the page rule
    /// @page { margin: <top> <right> <bottom> <left>; }
    public func margin(top: LengthPercentage, right: LengthPercentage, bottom: LengthPercentage, left: LengthPercentage) -> Page {
        let property = "margin: \(top) \(right) \(bottom) \(left);"
        return addProperty(property)
    }

    /// Adds a margin-top property to the page rule
    /// @page { margin-top: <value>; }
    public func marginTop(_ value: LengthPercentage) -> Page {
        let property = "margin-top: \(value);"
        return addProperty(property)
    }

    /// Adds a margin-right property to the page rule
    /// @page { margin-right: <value>; }
    public func marginRight(_ value: LengthPercentage) -> Page {
        let property = "margin-right: \(value);"
        return addProperty(property)
    }

    /// Adds a margin-bottom property to the page rule
    /// @page { margin-bottom: <value>; }
    public func marginBottom(_ value: LengthPercentage) -> Page {
        let property = "margin-bottom: \(value);"
        return addProperty(property)
    }

    /// Adds a margin-left property to the page rule
    /// @page { margin-left: <value>; }
    public func marginLeft(_ value: LengthPercentage) -> Page {
        let property = "margin-left: \(value);"
        return addProperty(property)
    }

    /// Adds a page-orientation property to the page rule
    /// @page { page-orientation: <value>; }
    public func pageOrientation(_ value: PageOrientation) -> Page {
        let property = "page-orientation: \(value.rawValue);"
        return addProperty(property)
    }

    /// Helper method to add a CSS property to the page rule
    private func addProperty(_ property: String) -> Page {
        let currentContent = rawValue

        // Check if the rule already has properties
        if currentContent.hasSuffix("{}") {
            // No properties yet, add the first one
            let newContent = currentContent.dropLast() + property + "}"
            return Page(rawValue: String(newContent))
        } else {
            // Already has properties, add another one
            let newContent = currentContent.dropLast() + " " + property + "}"
            return Page(rawValue: String(newContent))
        }
    }
}

extension Page {
    /// Predefined page sizes for printing
    public enum PageSize: Hashable, Sendable {
        // Standard paper sizes
        case a3 /*= "A3"*/
        case a4 /*= "A4"*/
        case a5 /*= "A5"*/
        case b4 /*= "B4"*/
        case b5 /*= "B5"*/

        // US paper sizes
        case letter /*= "letter"*/
        case legal /*= "legal"*/
        case ledger /*= "ledger"*/

        // Special sizes
        case auto /*= "auto"*/

        // Custom size using length values directly
        case custom(width: LengthPercentage, height: LengthPercentage)

        public var rawValue: String {
            switch self {
            case .a3, .a4, .a5, .b4, .b5, .letter, .legal, .ledger, .auto:
                return rawValueEnum
            case .custom(let width, let height):
                return "\(width) \(height)"
            }
        }

        private var rawValueEnum: String {
            switch self {
            case .a3: return "A3"
            case .a4: return "A4"
            case .a5: return "A5"
            case .b4: return "B4"
            case .b5: return "B5"
            case .letter: return "letter"
            case .legal: return "legal"
            case .ledger: return "ledger"
            case .auto: return "auto"
            case .custom: return "" // Not used
            }
        }
    }

    /// Page orientation values
    public enum PageOrientation: String, Hashable, Sendable {
        case portrait
        case landscape
    }

    /// Represents margin box types for page rules
    public enum MarginBox: String, Hashable, Sendable {
        // Top margin boxes
        case topLeftCorner = "top-left-corner"
        case topLeft = "top-left"
        case topCenter = "top-center"
        case topRight = "top-right"
        case topRightCorner = "top-right-corner"

        // Bottom margin boxes
        case bottomLeftCorner = "bottom-left-corner"
        case bottomLeft = "bottom-left"
        case bottomCenter = "bottom-center"
        case bottomRight = "bottom-right"
        case bottomRightCorner = "bottom-right-corner"

        // Left margin boxes
        case leftTop = "left-top"
        case leftMiddle = "left-middle"
        case leftBottom = "left-bottom"

        // Right margin boxes
        case rightTop = "right-top"
        case rightMiddle = "right-middle"
        case rightBottom = "right-bottom"
    }
}
