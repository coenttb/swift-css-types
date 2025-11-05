//
//  TimePercentage Tests.swift
//
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("TimePercentage Tests")
struct TimePercentageTests {

    @Test("TimePercentage time values render correctly")
    func testTimeValues() {
        let seconds = TimePercentage.s(1.5)
        #expect(seconds.description == "1.5s")

        let milliseconds = TimePercentage.ms(500)
        #expect(milliseconds.description == "500ms")

        let timeValue = TimePercentage.time(.s(2))
        #expect(timeValue.description == "2s")
    }

    @Test("TimePercentage percentage values render correctly")
    func testPercentageValues() {
        let percentage = TimePercentage.percentage(50)
        #expect(percentage.description == "50%")

        let decimalPercent = TimePercentage.percentage(33.33)
        #expect(decimalPercent.description == "33.33%")

        let negativePercent = TimePercentage.percentage(-25)
        #expect(negativePercent.description == "-25%")
    }

    @Test("Predefined constants work correctly")
    func testPredefines() {
        #expect(TimePercentage.zero.description == "0s")

        #expect(TimePercentage.half.description == "50%")

        #expect(TimePercentage.full.description == "100%")
    }

    @Test("Arithmetic operations work correctly")
    func testArithmetic() {
        let seconds = TimePercentage.s(2)
        let doubledSeconds = seconds * 2
        #expect(doubledSeconds.description == "4s")

        let halvedSeconds = seconds / 2
        #expect(halvedSeconds.description == "1s")

        let percentage = TimePercentage.percentage(50)
        let doubledPercent = percentage * 2
        #expect(doubledPercent.description == "100%")

        let halvedPercent = percentage / 2
        #expect(halvedPercent.description == "25%")
    }

    @Test("Literal conversions work correctly")
    func testLiteralConversion() {
        let integerLiteral: TimePercentage = 2
        #expect(integerLiteral.description == "2s")

        let floatLiteral: TimePercentage = 1.5
        #expect(floatLiteral.description == "1.5s")
    }

    @Test("TimePercentage conforms to Hashable")
    func testHashable() {
        let seconds1 = TimePercentage.s(1)
        let seconds2 = TimePercentage.s(1)
        let seconds3 = TimePercentage.s(2)

        #expect(seconds1 == seconds2)
        #expect(seconds1 != seconds3)

        let percent1 = TimePercentage.percentage(50)
        let percent2 = TimePercentage.percentage(50)
        let percent3 = TimePercentage.percentage(75)

        #expect(percent1 == percent2)
        #expect(percent1 != percent3)

        // Different types should not be equal
        #expect(seconds1 != percent1)
    }

    @Test("Factory methods create correct instances")
    func testFactoryMethods() {
        let seconds = TimePercentage.s(1.5)
        if case .time(let time) = seconds {
            #expect(time.value == 1.5)
            #expect(time.unit == .s)
        } else {
            #expect(Bool(false), "Expected .time case")
        }

        let ms = TimePercentage.ms(750)
        if case .time(let time) = ms {
            #expect(time.value == 750)
            #expect(time.unit == .ms)
        } else {
            #expect(Bool(false), "Expected .time case")
        }

        let percentage = TimePercentage.percentage(25)
        if case .percentage(let value) = percentage {
            #expect(value == 25)
        } else {
            #expect(Bool(false), "Expected .percentage case")
        }
    }
}
