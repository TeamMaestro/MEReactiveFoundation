//
//  MERMapTestCase.m
//  MEReactiveFoundation
//
//  Created by William Towe on 1/24/14.
//  Copyright (c) 2014 Maestro, LLC. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <XCTest/XCTest.h>
#import "MERMap.h"

@interface MERMapTestCase : XCTestCase

@end

@implementation MERMapTestCase

- (void)testMERMap {
    NSArray *src = @[@1,@2,@3];
    NSArray *dst = @[@"1",@"2",@"3"];
    
    XCTAssertEqualObjects(MERMap(src, ^id(id value) {
        return [value stringValue];
    }), dst);
}
- (void)testMERMapDictionary {
    NSDictionary *src = @{@1: @"one",
                          @2: @"two",
                          @3: @"three"};
    NSDictionary *dst = @{@"one": @1,
                          @"two": @2,
                          @"three": @3};
    
    XCTAssertEqualObjects(MERMapDictionary(src, ^NSArray *(id<NSCopying> key, id value) {
        return @[value,key];
    }), dst);
}

@end
