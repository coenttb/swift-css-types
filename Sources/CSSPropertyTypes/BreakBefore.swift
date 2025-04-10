import Foundation
import CSSTypeTypes

/// The CSS `break-before` property sets how page, column, or region breaks should behave before a generated box.
/// If there is no generated box, the property is ignored.
///
/// Example:
/// ```swift
/// .breakBefore(.auto)         // break-before: auto
/// .breakBefore(.avoid)        // break-before: avoid
/// .breakBefore(.always)       // break-before: always
/// .breakBefore(.all)          // break-before: all
/// .breakBefore(.avoidPage)    // break-before: avoid-page
/// .breakBefore(.page)         // break-before: page
/// .breakBefore(.left)         // break-before: left
/// .breakBefore(.right)        // break-before: right
/// .breakBefore(.recto)        // break-before: recto
/// .breakBefore(.verso)        // break-before: verso
/// .breakBefore(.avoidColumn)  // break-before: avoid-column
/// .breakBefore(.column)       // break-before: column
/// .breakBefore(.avoidRegion)  // break-before: avoid-region
/// .breakBefore(.region)       // break-before: region
/// ```
///
/// This property affects how breaks behave before the element:
/// - If any of the break values is a forced break value (always, left, right, page, column, or region), it takes precedence.
/// - If any of the values is an avoid break value (avoid, avoid-page, avoid-region, or avoid-column), no break will be applied.
/// - Once forced breaks have been applied, soft breaks may be added if needed, but not where there are corresponding avoid values.
///
/// - Note: The `break-before` value has precedence over the `break-after` value of the previous element,
///         which in turn has precedence over the `break-inside` value of the containing element.
///
/// - SeeAlso: [MDN Web Docs on break-before](https://developer.mozilla.org/en-US/docs/Web/CSS/break-before)
public enum BreakBefore: Property {
    public static let property: String = "break-before"
    // Generic break values
    /// Allows, but does not force, any break (page, column, or region) to be inserted right before the element.
    case auto
    
    /// Avoids any break (page, column, or region) from being inserted right before the element.
    case avoid
    
    /// Forces a page break right before the element. The type of this break depends on the containing context
    /// (column break in a multicol container, page break in paged media).
    case always
    
    /// Forces a page break right before the element, breaking through all possible fragmentation contexts.
    /// For example, a break inside a multicol container within a page would force both a column and page break.
    case all
    
    // Page break values
    /// Avoids any page break right before the element.
    case avoidPage
    
    /// Forces a page break right before the element.
    case page
    
    /// Forces one or two page breaks right before the element, to make the next page into a left page.
    case left
    
    /// Forces one or two page breaks right before the element, to make the next page into a right page.
    case right
    
    /// Forces one or two page breaks right before the element, to make the next page into a recto page
    /// (right page in left-to-right spread or left page in right-to-left spread).
    case recto
    
    /// Forces one or two page breaks right before the element, to make the next page into a verso page
    /// (left page in left-to-right spread or right page in right-to-left spread).
    case verso
    
    // Column break values
    /// Avoids any column break right before the element.
    case avoidColumn
    
    /// Forces a column break right before the element.
    case column
    
    // Region break values
    /// Avoids any region break right before the element.
    case avoidRegion
    
    /// Forces a region break right before the element.
    case region
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .avoid: return "avoid"
        case .always: return "always"
        case .all: return "all"
        case .avoidPage: return "avoid-page"
        case .page: return "page"
        case .left: return "left"
        case .right: return "right"
        case .recto: return "recto"
        case .verso: return "verso"
        case .avoidColumn: return "avoid-column"
        case .column: return "column"
        case .avoidRegion: return "avoid-region"
        case .region: return "region"
        case .global(let global): return global.description
        }
    }
}
