import CSSTypeTypes
import Foundation

/// The `content` CSS property replaces an element's content with generated content.
///
/// It can be used to define what is rendered inside an element or pseudo-element:
/// - For elements, it specifies whether the element renders normally or is replaced with an image
/// - For pseudo-elements, it defines the content as images, text, counters, or nothing
///
/// Note that content inserted using this property is not part of the DOM and will not be 
/// represented in the accessibility tree, which may impact screen readers.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/content)
public enum Content: Property {
    public static let property: String = "content"

    /// Default value. For elements, computes to descendants. For ::before and ::after, computes to none.
    case normal

    /// No generated content is created
    case none

    /// Simple text content
    case text(CSSString)

    /// An image represented as a URL
    case image(Url)

    /// Counter value
    case counter(name: String, style: ListStyleType? = nil)

    /// Nested counters with a separator string
    case counters(name: String, separator: String, style: ListStyleType? = nil)

    /// Value of an attribute
    case attr(name: String)

    /// Opening quotation mark. Used with the quotes property.
    case openQuote

    /// Closing quotation mark. Used with the quotes property.
    case closeQuote

    /// Omits the opening quotation mark. Used with the quotes property.
    case noOpenQuote

    /// Omits the closing quotation mark. Used with the quotes property.
    case noCloseQuote

    /// A list of content fragments
    case list([Content])

    /// Image replacement with alternative text for accessibility
    case imageWithAlt(image: Url, alt: CSSString)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .none:
            return "none"
        case .text(let string):
            return string.description
        case .image(let url):
            return "\(url)"
        case .counter(let name, nil):
            return "counter(\(name))"
        case .counter(let name, let style):
            return "counter(\(name), \(style!.description))"
        case .counters(let name, let separator, nil):
            return "counters(\(name), \"\(separator)\")"
        case .counters(let name, let separator, let style):
            return "counters(\(name), \"\(separator)\", \(style!.description))"
        case .attr(let name):
            return "attr(\(name))"
        case .openQuote:
            return "open-quote"
        case .closeQuote:
            return "close-quote"
        case .noOpenQuote:
            return "no-open-quote"
        case .noCloseQuote:
            return "no-close-quote"
        case .list(let items):
            return items.map { $0.description }.joined(separator: " ")
        case .imageWithAlt(let image, let alt):
            return "\(image) / \"\(alt.description)\""
        case .global(let value):
            return value.description
        }
    }
}
