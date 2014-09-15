SplittingTriangle
=================

iOS port of [Splitting triangle](https://dribbble.com/shots/1678788-Splitting-triangle).

<img src="SplittingTriangle.gif"/>

## Installation

Add the `SplittingTriangle.h` and `SplittingTriangle.m` source files to your project.

## Usage

``` objective-c

SplittingTriangle *st = [[SplittingTriangle alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    
[st setForeColor:[UIColor colorWithWhite:0.7 alpha:0.7] andBackColor:[UIColor clearColor]];
    
[st setClockwise:YES];
[st setDuration:2.4];
[st setRadius:22];
[st setPaused:NO];

[self.view addSubview:st];

```

## License

[MIT license](LICENSE.md). 
