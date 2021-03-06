/*
 * TRObject.m vi:ts=4:sw=4:expandtab:
 * TRObject Unit Tests
 *
 * Author: Landon Fuller <landonf@bikemonkey.org>
 *
 * Copyright (c) 2006 - 2007 Three Rings Design, Inc.
 * Copyright (c) 2007 - 2012 Landon Fuller <landonf@bikemonkey.org>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of Landon Fuller nor the names of any contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#ifdef HAVE_CONFIG_H
#import <config.h>
#endif

#import "TRObject.h"
#import "PXTestCase.h"

@interface TRObjectTests : PXTestCase @end

@implementation TRObjectTests

- (void) testIsKindOfClass {
    TRObject *trObj = [[[TRObject alloc] init] autorelease];

    STAssertTrue([self isKindOfClass: [TRObject class]], "Test case should be considered a subclass of TRObject");
    STAssertTrue([self isKindOfClass: [self class]], "Test case should consider itself to be of the same kind as its own class.");
    STAssertFalse([trObj isKindOfClass: [self class]], "TRObject is not an intance of TRObjectTests, or an instance of a TRObjectTests subclass");
}

- (void) testRetainRelease {
    TRObject *obj;

    /* Initialize the object */
    obj = [[TRObject alloc] init];
    STAssertEquals([obj retainCount], (PXUInteger)1, "Newly initialized TRObject has unexpected reference count");

    /* Increment the refcount */
    [obj retain];
    STAssertEquals([obj retainCount], (PXUInteger)2, "Retained TRObject has unexpected reference count");

    /* Decrement the refcount */
    [obj release];
    STAssertEquals([obj retainCount], (PXUInteger)1, "Released TRObject has unexpected reference count");

    /* Deallocate the object */
    [obj release];
}

- (void) testIsEqual {
    TRObject *obj;

    /* Initialize the object */
    obj = [[TRObject alloc] init];

    STAssertEqualObjects(obj, obj, "Object should be equal to self");

    /* Deallocate the object */
    [obj release];
}

@end
