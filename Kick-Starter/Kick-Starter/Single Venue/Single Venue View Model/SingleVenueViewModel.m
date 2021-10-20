//
//  SingleVenueViewModel.m
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/18.
//

#import "SingleVenueViewModel.h"

@implementation SingleVenueViewModel {
    Venue * _singleVenue;
}

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)set:(Venue *) selectedVenue {
    _singleVenue = selectedVenue;
}
- (NSString *) venueName {
    return _singleVenue.name;
}
- (NSString *) venueCapacity {
    NSString* capacity = [NSString stringWithFormat:@"Venue Capacity: %li",(long) (long)_singleVenue.capacity];
    return capacity;
}
- (NSString *) venueCity {
    return _singleVenue.city;
}
- (NSString *) venueImage {
    return _singleVenue.image;
}

@end
