//
//  NSSet+MERExtensionsTestCase.m
//  MEReactiveFoundation
//
//  Created by William Towe on 1/27/14.
//  Copyright (c) 2014 Maestro, LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <XCTest/XCTest.h>
#import "NSSet+MERExtensions.h"

@interface NSSet_MERExtensionsTestCase : XCTestCase

@end

@implementation NSSet_MERExtensionsTestCase

- (void)testMERConcat {
    NSSet *src = [NSSet setWithObjects:[NSSet setWithArray:@[@1,@2,@3]],[NSSet setWithArray:@[@3,@4,@5]], nil];
    NSSet *dst = [NSSet setWithArray:@[@1,@2,@3,@4,@5]];
    
    XCTAssertEqualObjects([src MER_concat], dst);
}
- (void)testMERConcatWith {
    NSSet *src1 = [NSSet setWithArray:@[@1,@2,@3]];
    NSSet *src2 = [NSSet setWithArray:@[@3,@4,@5]];
    NSSet *dst = [NSSet setWithArray:@[@1,@2,@3,@4,@5]];
    
    XCTAssertEqualObjects([src1 MER_concatWith:src2], dst);
}

- (void)testMERSum {
    NSSet *src = [NSSet setWithArray:@[@1,@2,@3]];
    NSNumber *dst = @6;
    
    XCTAssertEqualObjects([src MER_sum], dst);
}
- (void)testMERSumDecimal {
    NSSet *src = [NSSet setWithArray:@[[NSDecimalNumber one],[NSDecimalNumber decimalNumberWithString:@"2"],[NSDecimalNumber decimalNumberWithString:@"3"]]];
    NSDecimalNumber *dst = [NSDecimalNumber decimalNumberWithString:@"6"];
    
    XCTAssertEqualObjects([src MER_sum], dst);
}
- (void)testMERMinimum {
    NSSet *src = [NSSet setWithArray:@[@1,@2,@3]];
    NSNumber *dst = @1;
    
    XCTAssertEqualObjects([src MER_minimum], dst);
}
- (void)testMERMaximum {
    NSSet *src = [NSSet setWithArray:@[@1,@2,@3]];
    NSNumber *dst = @3;
    
    XCTAssertEqualObjects([src MER_maximum], dst);
}

@end
