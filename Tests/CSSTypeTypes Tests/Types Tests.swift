//
//  Types Tests.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Testing

/// This file contains tests that verify the high-level functionality of the CSS Types system.
/// The individual types are tested in their respective test files.

@Suite("CSS Types")
struct CSSTypesTests {

    @Test("Types can be used together in property values")
    func testTypesInPropertyValues() {
        // Test that our types can be combined in complex property values

        // A transform with multiple functions
        let transform = "transform: \(TransformFunction.translate(.px(100), .px(50))) \(TransformFunction.rotate(.deg(45))) \(TransformFunction.scale(sx: 1.5))"
        #expect(transform == "transform: translate(100px, 50px) rotate(45deg) scale(1.5)")

        // A transition with time values
        let transition = "transition: all \(Time.s(0.3)) \(Time.ms(100))"
        #expect(transition == "transition: all 0.3s 100ms")

        // A complex animation with multiple values
        let animation = "animation: fadeIn \(Time.s(1)) \(TimePercentage.percentage(50))"
        #expect(animation == "animation: fadeIn 1s 50%")

        // A property with a URL value
        let backgroundImage = "background-image: \(Url("image.jpg"))"
        #expect(backgroundImage == "background-image: url('image.jpg')")
    }
}
