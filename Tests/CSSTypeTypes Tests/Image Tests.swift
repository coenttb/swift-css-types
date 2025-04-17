//
//  Image Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Image Tests")
struct ImageTests {
    
    @Test("Image.url renders correctly")
    func testUrlImage() {
        let image = Image.url("image.jpg")
        #expect(image.description == "url('image.jpg')")
        
        let imageWithPath = Image.url("/images/banner.png")
        #expect(imageWithPath.description == "url('/images/banner.png')")
        
        let imageWithQuotes = Image.url("\"path/to/image.jpg\"")
        #expect(imageWithQuotes.description == "url('path/to/image.jpg')")
    }
    
    @Test("Image.gradient renders correctly")
    func testGradientImage() {
        let linearGradient = Image.gradient(Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue))
            ]
        ))
        #expect(linearGradient.description == "linear-gradient(red, blue)")
        
        let radialOptions = Gradient.RadialOptions(shape: .circle)
        let radialGradient = Image.gradient(Gradient.radial(
            options: radialOptions,
            colorStops: [
                Gradient.ColorStop(Color.named(.yellow)),
                Gradient.ColorStop(Color.named(.green))
            ]
        ))
        #expect(radialGradient.description == "radial-gradient(circle, yellow, green)")
    }
    
    @Test("Image.element renders correctly")
    func testElementImage() {
        let element = Image.element(id: "header")
        #expect(element.description == "element(#header)")
        
        let anotherElement = Image.element(id: "logo")
        #expect(anotherElement.description == "element(#logo)")
    }
    
    @Test("Image.crossFade renders correctly")
    func testCrossFadeImage() {
        let crossFade = Image.crossFade(
            percentage: Percentage(40),
            from: .url("old.jpg"),
            to: .url("new.jpg")
        )
        #expect(crossFade.description == "cross-fade(40% url('old.jpg'), url('new.jpg'))")
        
        let linearGradient = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue))
            ]
        )
        
        let crossFadeWithGradient = Image.crossFade(
            percentage: Percentage(75),
            from: .url("image.jpg"),
            to: .gradient(linearGradient)
        )
        #expect(crossFadeWithGradient.description == "cross-fade(75% url('image.jpg'), linear-gradient(red, blue))")
    }
    
    @Test("Image.imageSet renders correctly")
    func testImageSetImage() {
        let imageSet = Image.imageSet(images: [
            ImageSetItem(url: "image.png", resolution: "1x"),
            ImageSetItem(url: "image-2x.png", resolution: "2x")
        ])
        #expect(imageSet.description == "image-set('image.png' 1x, 'image-2x.png' 2x)")
        
        let imageSetWithManyItems = Image.imageSet(images: [
            ImageSetItem(url: "small.jpg", resolution: "1x"),
            ImageSetItem(url: "medium.jpg", resolution: "2x"),
            ImageSetItem(url: "large.jpg", resolution: "3x")
        ])
        #expect(imageSetWithManyItems.description == "image-set('small.jpg' 1x, 'medium.jpg' 2x, 'large.jpg' 3x)")
    }
    
    @Test("Image.paint renders correctly")
    func testPaintImage() {
        let paint = Image.paint(name: "myPaintWorklet")
        #expect(paint.description == "paint(myPaintWorklet)")
        
        let paintWithArgs = Image.paint(name: "checkerboard", arguments: ["green", "10px"])
        #expect(paintWithArgs.description == "paint(checkerboard, green, 10px)")
    }
    
    @Test("Image.none renders correctly")
    func testNoneImage() {
        let none = Image.none
        #expect(none.description == "none")
    }
    
    @Test("Image factory methods work correctly")
    func testImageFactoryMethods() {
        // Test linearGradient without direction
        let linearGradient = Image.linearGradient([
            Color.named(.red),
            Color.named(.blue)
        ])
        #expect(linearGradient.description == "linear-gradient(red, blue)")
        
        // Test linearGradient with side direction
        let linearGradientWithSide = Image.linearGradient(
            to: .right,
            stops: [Color.named(.yellow), Color.named(.green)]
        )
        #expect(linearGradientWithSide.description == "linear-gradient(to right, yellow, green)")
        
        // Test linearGradient with angle
        let linearGradientWithAngle = Image.linearGradient(
            angle: Angle.deg(90),
            stops: [Color.named(.yellow), Color.named(.green)]
        )
        #expect(linearGradientWithAngle.description == "linear-gradient(90deg, yellow, green)")
        
        // Test radialGradient
        let radialGradient = Image.radialGradient([
            Color.named(.orange),
            Color.named(.purple)
        ])
        #expect(radialGradient.description == "radial-gradient(orange, purple)")
        
        // Test conicGradient
        let conicGradient = Image.conicGradient(
            from: Angle.deg(45),
            stops: [Color.named(.red), Color.named(.yellow), Color.named(.blue)]
        )
        #expect(conicGradient.description == "conic-gradient(from 45deg, red, yellow, blue)")
        
        // Test imageSet
        let imageSet = Image.imageSet([
            (url: "image.png", resolution: "1x"),
            (url: "image-2x.png", resolution: "2x")
        ])
        #expect(imageSet.description == "image-set('image.png' 1x, 'image-2x.png' 2x)")
        
        // Test paint
        let paint = Image.paint("checkboard", arguments: ["black", "white", "10px"])
        #expect(paint.description == "paint(checkboard, black, white, 10px)")
    }
    
    @Test("Image conforms to Hashable")
    func testHashable() {
        // Same type and values should be equal
        #expect(Image.url("image.jpg") == Image.url("image.jpg"))
        
        let gradient1 = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue))
            ]
        )
        let gradient2 = Gradient.linear(
            direction: nil,
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue))
            ]
        )
        #expect(Image.gradient(gradient1) == Image.gradient(gradient2))
        #expect(Image.none == Image.none)
        
        // Different values should not be equal
        #expect(Image.url("image1.jpg") != Image.url("image2.jpg"))
        #expect(Image.paint(name: "worklet1") != Image.paint(name: "worklet2"))
        
        // Different values in same type
        let gradient3 = Gradient.linear(
            direction: .angle(.deg(45)),
            colorStops: [
                Gradient.ColorStop(Color.named(.red)),
                Gradient.ColorStop(Color.named(.blue))
            ]
        )
        #expect(Image.gradient(gradient1) != Image.gradient(gradient3))
        
        // Different types should not be equal
        #expect(Image.url("image.jpg") != Image.none)
        #expect(Image.gradient(gradient1) != Image.url("gradient.png"))
    }
    
    @Test("Image is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using Image values
        let backgroundImage = "background-image: \(Image.url("banner.jpg"))"
        #expect(backgroundImage == "background-image: url('banner.jpg')")
        
        let borderImage = "border-image: \(Image.linearGradient([Color.named(.red), Color.named(.blue)]))"
        #expect(borderImage == "border-image: linear-gradient(red, blue)")
    }
}
