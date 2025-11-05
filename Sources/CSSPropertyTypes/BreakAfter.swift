import CSSTypeTypes
import Foundation

/// The CSS `break-after` property sets how page, column, or region breaks should behave after a generated box.
/// If there is no generated box, the property is ignored.
///
/// Example:
/// ```swift
/// .breakAfter(.auto)         // break-after: auto
/// .breakAfter(.avoid)        // break-after: avoid
/// .breakAfter(.always)       // break-after: always
/// .breakAfter(.all)          // break-after: all
/// .breakAfter(.avoidPage)    // break-after: avoid-page
/// .breakAfter(.page)         // break-after: page
/// .breakAfter(.left)         // break-after: left
/// .breakAfter(.right)        // break-after: right
/// .breakAfter(.recto)        // break-after: recto
/// .breakAfter(.verso)        // break-after: verso
/// .breakAfter(.avoidColumn)  // break-after: avoid-column
/// .breakAfter(.column)       // break-after: column
/// .breakAfter(.avoidRegion)  // break-after: avoid-region
/// .breakAfter(.region)       // break-after: region
/// ```
///
/// This property affects how breaks behave after the element:
/// - If any of the break values is a forced break value (always, left, right, page, column, or region), it takes precedence.
/// - If any of the values is an avoid break value (avoid, avoid-page, avoid-region, or avoid-column), no break will be applied.
/// - Once forced breaks have been applied, soft breaks may be added if needed, but not where there are corresponding avoid values.
///
/// - SeeAlso: [MDN Web Docs on break-after](https://developer.mozilla.org/en-US/docs/Web/CSS/break-after)
public enum BreakAfter: Property {
    public static let property: String = "break-after"
    // Generic break values
    /// Allows, but does not force, any break (page, column, or region) to be inserted right after the element.
    case auto

    /// Avoids any break (page, column, or region) from being inserted right after the element.
    case avoid

    /// Forces a page break right after the element. The type of this break depends on the containing context
    /// (column break in a multicol container, page break in paged media).
    case always

    /// Forces a page break right after the element, breaking through all possible fragmentation contexts.
    /// For example, a break inside a multicol container within a page would force both a column and page break.
    case all

    // Page break values
    /// Avoids any page break right after the element.
    case avoidPage

    /// Forces a page break right after the element.
    case page

    /// Forces one or two page breaks right after the element, to make the next page into a left page.
    case left

    /// Forces one or two page breaks right after the element, to make the next page into a right page.
    case right

    /// Forces one or two page breaks right after the element, to make the next page into a recto page
    /// (right page in left-to-right spread or left page in right-to-left spread).
    case recto

    /// Forces one or two page breaks right after the element, to make the next page into a verso page
    /// (left page in left-to-right spread or right page in right-to-left spread).
    case verso

    // Column break values
    /// Avoids any column break right after the element.
    case avoidColumn

    /// Forces a column break right after the element.
    case column

    // Region break values
    /// Avoids any region break right after the element.
    case avoidRegion

    /// Forces a region break right after the element.
    case region

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .avoid:
            return "avoid"
        case .always:
            return "always"
        case .all:
            return "all"
        case .avoidPage:
            return "avoid-page"
        case .page:
            return "page"
        case .left:
            return "left"
        case .right:
            return "right"
        case .recto:
            return "recto"
        case .verso:
            return "verso"
        case .avoidColumn:
            return "avoid-column"
        case .column:
            return "column"
        case .avoidRegion:
            return "avoid-region"
        case .region:
            return "region"
        case .global(let global):
            return global.description
        }
    }
}
