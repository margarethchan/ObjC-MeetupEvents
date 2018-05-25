//
//  FavoritesViewController.m
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import "FavoritesViewController.h"
#import "Event.h"
#import "EventCell.h"
#import "PersistenceManager.h"

@interface FavoritesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *favoritesTableView;
@property (nonatomic) NSArray <Event *> *events;
@property (nonatomic) Event *selectedEvent;

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.favoritesTableView.delegate = self;
    self.favoritesTableView.dataSource = self;
    [self.favoritesTableView registerClass:EventCell.class forCellReuseIdentifier:@"EventCell"];
    _events = PersistenceManager.sharedManager.readEvents;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.favoritesTableView reloadData];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    EventCell *cell = (EventCell *)[tableView dequeueReusableCellWithIdentifier:@"EventCell" forIndexPath:indexPath];
    Event *event = self.events[indexPath.row];
    [cell configureViewWithEvent:event];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedEvent = [self events][indexPath.row];
    
    [self performSegueWithIdentifier:@"FavoriteToDetailSegue" sender:self];

}

@end
