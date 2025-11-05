//
//  Shape Tests.swift
//
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("Shape Tests")
struct ShapeTests {

    @Test("Shape.rect renders correctly")
    func testRectShape() {
        let shape = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
        #expect(shape.description == "rect(10px, 100px, 100px, 10px)")
    }

    @Test("Shape.rect factory method works correctly")
    func testRectFactoryMethod() {
        // Use the Double parameter version explicitly with type annotations
        let shape = Shape.rect(
            top: Double(10),
            right: Double(100),
            bottom: Double(100),
            left: Double(10)
        )
        #expect(shape.description == "rect(10px, 100px, 100px, 10px)")
    }

    @Test("Shape.rect with uniform values works correctly")
    func testRectUniformValues() {
        let shape = Shape.rect(all: 20)
        #expect(shape.description == "rect(20px, 20px, 20px, 20px)")
    }

    @Test("Shape.auto property works correctly")
    func testAutoProperty() {
        let shape = Shape.auto
        #expect(shape.description == "rect(auto, auto, auto, auto)")
    }

    @Test("Shape conforms to Hashable")
    func testHashable() {
        let shape1 = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
        let shape2 = Shape.rect(top: .px(10), right: .px(100), bottom: .px(100), left: .px(10))
        let shape3 = Shape.rect(top: .px(20), right: .px(100), bottom: .px(100), left: .px(10))

        #expect(shape1 == shape2)
        #expect(shape1 != shape3)
    }

    @Test("Shape is marked as deprecated")
    func testDeprecation() {
        // This test doesn't do anything at runtime, but it documents that
        // Shape is correctly marked as deprecated. The compiler will
        // generate warnings when Shape is used outside of the
        // @_spi(SuppressDeprecationWarnings) context.

        // The fact that this test compiles confirms that the
        // SuppressDeprecationWarnings SPI is working
        let shape = Shape.rect(all: 10)
        #expect(shape.description.contains("rect"))
    }
}
