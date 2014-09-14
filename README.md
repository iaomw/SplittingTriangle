SplittingTriangle
=================

iOS port of [Splitting triangle](https://dribbble.com/shots/1678788-Splitting-triangle).
<img src="SplittingTriangle.gif"/>

## Installation

Add the `SplittingTriangle.h` and `SplittingTriangle.m` source files to your project.

1. Download the latest code version or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop `SplittingTriangle.h` and `SplittingTriangle.m` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
3. Include SplittingTriangle wherever you need it with `#import "SplittingTriangle.h"`

## Usage

``` objective-c

	SplittingTriangle *st = [[SplittingTriangle alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
	    
	[st setForeColor:[UIColor colorWithWhite:0.7 alpha:0.7] andBackColor:[UIColor clearColor]];
	    
	[st setClockwise:YES];
	[st setDuration:2.4];
	[st setRadius:22];
	
	[self.view addSubview:st];

```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 
