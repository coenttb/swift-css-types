import Foundation
import CSSTypeTypes

/// The CSS `font` property is a shorthand for setting font-style, font-variant, font-weight,
/// font-stretch, font-size, line-height, and font-family all at once.
///
/// This property lets you set multiple font-related properties with a single declaration,
/// making it easier to style text consistently.
///
/// Example:
/// ```swift
/// .font(.custom(.generic(.systemUi), .px(16), weight: .bold))            // font: bold 16px system-ui
/// .font(.style(.italic, .smallCaps, .bold, .specific("Helvetica"), .px(14))) // font: italic small-caps bold 14px Helvetica
/// .font(.global(.inherit))                                          // font: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font](https://developer.mozilla.org/en-US/docs/Web/CSS/font)
public enum Font: Property {
    public static let property: String = "font"
    
    /// Specifies a font with size, weight, style, and family values
    case style(Style?, Variant?, Weight?, FontFamily?, Size, LineHeight?)
    
    /// Specifies a custom font with family, size, and optional properties
    case custom(FontFamily?, Size, weight: Weight? = nil, style: Style? = nil)
    
    /// System fonts keywords
    case caption, icon, menu, messageBox, smallCaption, statusBar
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    /// Creates a system font with the specified size
    public static func system(size: Size) -> Font {
        .custom(.generic(.systemUi), size)
    }
    
    /// Creates a custom font with a specific family and size
    public static func custom(_ family: String, size: Size) -> Font {
        .custom(.family(.specific(family)), size)
    }
    
    public var description: String {
        switch self {
        case .style(let style, let variant, let weight, let family, let size, let lineHeight):
            var components: [String] = []
            
            if let style = style {
                components.append(style.description)
            }
            
            if let variant = variant {
                components.append(variant.rawValue)
            }
            
            if let weight = weight {
                components.append(weight.description)
            }
            
            components.append(size.description)
            
            if let lineHeight = lineHeight {
                components[components.count - 1] += "/\(lineHeight)"
            }
            
            if let family = family {
                components.append(family.description)
            }
            
            return components.joined(separator: " ")
            
        case .custom(let family, let size, let weight, let style):
            var components: [String] = []
            
            if let style = style {
                components.append(style.description)
            }
            
            if let weight = weight {
                components.append(weight.description)
            }
            
            components.append(size.description)
            
            if let family = family {
                components.append(family.description)
            }
            
            return components.joined(separator: " ")
            
        case .caption:
            return "caption"
        case .icon:
            return "icon"
        case .menu:
            return "menu"
        case .messageBox:
            return "message-box"
        case .smallCaption:
            return "small-caption"
        case .statusBar:
            return "status-bar"
        case .global(let value):
            return value.description
        }
    }
    
    // MARK: - Font Style
    
    /// Reference to the FontStyle enum for use in the Font property
    public typealias Style = FontStyle
    
    // MARK: - Font Variant
    
    /// Represents the font-variant CSS property
    public enum Variant: String, Sendable, Hashable {
        /// Renders text normally
        case normal
        
        /// Renders text in small capitals
        case smallCaps = "small-caps"
    }
    
    // MARK: - Font Weight
    
    /// Reference to the FontWeight enum for use in the Font property
    public typealias Weight = FontWeight
    
    // MARK: - Font Size
    
    /// Reference to the FontSize enum for use in the Font property
    public typealias Size = FontSize
    
    // MARK: - Font Stretch
    
    /// Reference to the FontStretch enum for use in the Font property
    public typealias Stretch = FontStretch
}
