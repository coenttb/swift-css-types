import Foundation
import CSSTypeTypes

/// The CSS `text-rendering` property provides information to the rendering engine about what to optimize for when rendering text.
///
/// The browser makes trade-offs among speed, legibility, and geometric precision. This property can significantly
/// affect the display of text, particularly when using ligatures and kerning which are important for many languages
/// and scripts.
///
/// - Note: This property is an SVG property that is not defined in any CSS standard. However, browsers
///         let you apply this property to HTML and XML content on various platforms.
///
/// - Note: One very visible effect is `optimizeLegibility`, which enables ligatures (ff, fi, fl, etc.)
///         in text smaller than 20px for some fonts (for example, Microsoft's Calibri, Candara, Constantia,
///         and Corbel, or the DejaVu font family).
///
/// Example:
/// ```swift
/// .textRendering(.auto)                // text-rendering: auto
/// .textRendering(.optimizeSpeed)       // text-rendering: optimizeSpeed
/// .textRendering(.optimizeLegibility)  // text-rendering: optimizeLegibility
/// .textRendering(.geometricPrecision)  // text-rendering: geometricPrecision
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-rendering](https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering)
public enum TextRendering: Property {
    public static let property: String = "text-rendering"
    
    /// The browser makes educated guesses about when to optimize for speed, legibility, and
    /// geometric precision while drawing text. This is a good default for balancing quality
    /// and performance, especially for extended bodies of plain text.
    case auto
    
    /// The browser emphasizes rendering speed over legibility and geometric precision when
    /// drawing text. It disables kerning and ligatures. This is preferable in resource-constrained
    /// rendering scenarios, such as slow processors or low battery.
    case optimizeSpeed
    
    /// The browser emphasizes legibility over rendering speed and geometric precision.
    /// This enables kerning and optional ligatures. This is preferable for texts that are
    /// large in size but short in content, such as headers or banners, to enhance their readability.
    case optimizeLegibility
    
    /// The browser emphasizes geometric precision over rendering speed and legibility.
    /// Certain aspects of fonts — such as kerning — don't scale linearly.
    /// So this value can make text using those fonts look good.
    case geometricPrecision
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto: return "auto"
        case .optimizeSpeed: return "optimizeSpeed"
        case .optimizeLegibility: return "optimizeLegibility"
        case .geometricPrecision: return "geometricPrecision"
        case .global(let global): return global.description
        }
    }
}
