Purpose
--------------

ArrayUtils is a collection of category methods that extend NSArray with a few missing methods that make certain array manipulations easier and more concise.


Supported OS & SDK Versions
-----------------------------

* Supported build target - iOS 6.0 / Mac OS 10.8 (Xcode 4.5.1, Apple LLVM compiler 4.1)
* Earliest supported deployment target - iOS 5.0 / Mac OS 10.7
* Earliest compatible deployment target - iOS 4.3 / Mac OS 10.6

NOTE: 'Supported' means that the library has been tested with this version. 'Compatible' means that the library should work on this iOS version (i.e. it doesn't rely on any unavailable SDK features) but is no longer being tested for compatibility and may require tweaking or bug fixes to run correctly.


ARC Compatibility
------------------

ArrayUtils works with both ARC and non-ARC projects. There is no need to exclude ArrayUtils files from the ARC validation process or to convert ArrayUtils using the ARC conversion tool.


Thread Safety
--------------

In general, NSArray is thread safe and NSMutableArray isn't. ArrayUtils does not do anything to chnage that. You can saftely call the ArrayUtils methods on an NSArray instance from mutltiple threads, but doing so on an NSMutableArray will have unpredictable results.


Installation
--------------

To use the ArrayUtils categories in an app, just drag the ArrayUtils.h and ArrayUtils.m files (demo files and assets are not needed) into your project and import the header file into any class where you wish to make use of the ArrayUtils functionality, or include it in your prefix.pch file to make it available globally within your project.


NSArray Extension Methods
----------------------------

ArrayUtils extends NSArray with the following methods:

    - (id)firstObject;
    
Returns the first object in the array, or nil if the array is empty.
    
    - (NSArray *)arrayByRemovingObject:(id)object;
    
Returns a copy of the array with the specified object removed.
    
    - (NSArray *)arrayByRemovingObjectAtIndex:(NSInteger)index;
    
Returns a copy of the array with the object at the specified index removed.
    
    - (NSArray *)arrayByRemovingLastObject;
    
Returns a copy of the array with the last object removed. Does nothing if the array is empty.
    
    - (NSArray *)arrayByRemovingFirstObject;
    
Returns a copy of the array with the first object removed. Does nothing if the array is empty.
    
    - (NSArray *)arrayByInsertingObject:(id)object atIndex:(NSInteger)index;
    
Returns a copy of the array with the specified object inserted at the specified index.
    
    - (NSArray *)arrayByReplacingObjectAtIndex:(NSInteger)index withObject:(id)object;
    
Returns a copy of the array with the object at the specified index replaced by the specified object.
    
    
NSMutableArray Extension Methods
---------------------------------

ArrayUtils extends NSMutableArray with the following methods:

    - (void)removeFirstObject;
    
Removes the first object from the array. Does nothing if the array is empty.