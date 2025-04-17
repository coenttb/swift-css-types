//
//  PageBreak.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 15/09/2024.
//

import Foundation
import CSSTypeTypes

/// Represents the CSS page break properties that control how printed content is split across pages.
///
/// The `PageBreak` enum encompasses three related CSS properties:
/// - `page-break-after`: Controls page breaks after an element
/// - `page-break-before`: Controls page breaks before an element
/// - `page-break-inside`: Controls page breaks inside an element
///
/// These properties are particularly important for print styling and PDF generation,
/// allowing control over how content flows across multiple pages.
///
/// ```
///    Page Break Examples:
///
///    page-break-before: always;     page-break-inside: avoid;
///    +--------------------+         +--------------------+
///    |  Previous Content  |         |   Table or Image   |
///    +--------------------+         |                    |
///                                   |  (will not split   |
///    +--------------------+         |   across pages)    |
///    |  Element with      |         |                    |
///    |  page-break-before |         +--------------------+
///    |  always starts     |         
///    |  on a new page     |         page-break-after: right;
///    +--------------------+         +--------------------+
///                                   |  Content that will |
///                                   |  be followed by a  |
///                                   |  page break, with  |
///                                   |  next content on   |
///                                   |  right-hand page   |
///                                   +--------------------+
/// ```
///
/// Example usage:
/// ```swift
/// let breakAfter = PageBreak.after(.always)
/// // CSS: page-break-after: always;
///
/// let breakBefore = PageBreak.before(.avoid)
/// // CSS: page-break-before: avoid;
///
/// let breakInside = PageBreak.inside(.avoid)
/// // CSS: page-break-inside: avoid;
/// ```
///
/// - Note: Modern CSS has replaced these properties with `break-inside`, `break-before`,
///   and `break-after`, which work for both paged media and multicol layouts. However,
///   for maximum compatibility, these legacy properties are still widely used.
///
/// - SeeAlso: [MDN Web Docs: page-break-after](https://developer.mozilla.org/en-US/docs/Web/CSS/page-break-after)
/// - SeeAlso: [MDN Web Docs: page-break-before](https://developer.mozilla.org/en-US/docs/Web/CSS/page-break-before)
/// - SeeAlso: [MDN Web Docs: page-break-inside](https://developer.mozilla.org/en-US/docs/Web/CSS/page-break-inside)
public enum PageBreak: Sendable, Hashable, Property {
    public static let property: String = "page-break"
    /// Controls page breaks after an element.
    case after(After)
    
    /// Controls page breaks before an element.
    case before(Before)
    
    /// Controls page breaks inside an element.
    case inside(Inside)
    
    case global(Global)
    
    /// Values for the page-break-after property.
    public enum After: String, Sendable {
        /// Let the browser determine automatically where page breaks should occur (default).
        case auto
        
        /// Always force a page break after the element.
        case always
        
        /// Avoid a page break after the element if possible.
        case avoid
        
        /// Force page breaks after the element until a left page is reached.
        case left
        
        /// Force page breaks after the element until a right page is reached.
        case right
        
        /// Sets the property to its default value.
        case initial
        
        /// Inherits the value from the parent element.
        case inherit
    }
    
    /// Values for the page-break-before property.
    public enum Before: String, Sendable {
        /// Let the browser determine automatically where page breaks should occur (default).
        case auto
        
        /// Always force a page break before the element.
        case always
        
        /// Avoid a page break before the element if possible.
        case avoid
        
        /// Force page breaks before the element until a left page is reached.
        case left
        
        /// Force page breaks before the element until a right page is reached.
        case right
        
        /// Sets the property to its default value.
        case initial
        
        /// Inherits the value from the parent element.
        case inherit
    }
    
    /// Values for the page-break-inside property.
    public enum Inside: String, Sendable {
        /// Let the browser determine automatically where page breaks should occur (default).
        case auto
        
        /// Avoid page breaks inside the element if possible.
        case avoid
        
        /// Sets the property to its default value.
        case initial
        
        /// Inherits the value from the parent element.
        case inherit
    }
    
    /// Returns the CSS property name and value as a tuple.
    ///
    /// This differs from most other properties in the library as it produces
    /// different property names based on the variant being used (after, before, or inside).
    ///
    /// - Returns: A tuple containing the CSS property name and its value.
    public var description: String {
        switch self {
        case .after(let after):
            after.rawValue
        case .before(let before):
            before.rawValue
        case .inside(let inside):
            inside.rawValue
        case .global(let global):
            global.description
        }
    }
    
    /// Default page-break-after with auto value.
    /// Equivalent to `.after(.auto)`.
    public static let after: Self = .after(.auto)
    
    /// Default page-break-before with auto value.
    /// Equivalent to `.before(.auto)`.
    public static let before: Self = .before(.auto)
    
    /// Default page-break-inside with auto value.
    /// Equivalent to `.inside(.auto)`.
    public static let inside: Self = .inside(.auto)
}

