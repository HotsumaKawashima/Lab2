#import <Foundation/Foundation.h>

@interface Box : NSObject
{
  @private
      float height;
      float width;
      float length;
}
@property float height, width, length;
@end

@implementation Box
@synthesize height, width, length;
- (id) build:(float)height width:(float)width length:(float)length {
   if (self = [super init]) {
     self.height = height;
     self.width = width;
     self.length = length;
  }
  return self;
}
- (float) calculate {
  return self.height * self.width * self.length;
}

- (int) fit:(id)box {
  return floor([self calculate] / [box calculate]);
}
@end

int main(int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  Box *one = [[ Box alloc ] build:5 width:2 length:10];
  Box *two = [[ Box alloc ] build:5 width:1 length:1];
  NSLog(@"%f", [one calculate]);
  NSLog(@"%ld", [one fit:two]);
  [pool drain];
  return 0;
}
