//
//  MatchTableViewController.m
//  Oefening-UITableView-1
//
//  Created by Jean Smits on 19/08/15.
//  Copyright (c) 2015 EASI. All rights reserved.
//

#import "MatchTableViewController.h"
#import "MatchTableViewCell.h"
#import "HeaderTableViewCell.h"
#import "MatchFactory.h"
#import "Match.h"
#import "DetailViewController.h"


@interface MatchTableViewController ()

@property (strong, nonatomic) NSArray *matches;
@property (strong, nonatomic) NSMutableArray *matchesPlayed;
@property (strong, nonatomic) NSMutableArray *matchesOngoing;
@property (strong, nonatomic) NSMutableArray *matchesNotPlayedyet;

@end

@implementation MatchTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.matches = [MatchFactory createMatches];
    for (Match *m in self.matches){
        NSLog(@"%@ => %lu", m.homeTeamName , (unsigned long)m.status);
    }
    self.matchesPlayed = [[NSMutableArray alloc] init];
    self.matchesNotPlayedyet = [[NSMutableArray alloc] init];
    self.matchesOngoing = [[NSMutableArray alloc] init];
    [self statusCheck:self.matches];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
// #warning Potentially incomplete method implementation.
    // Return the number of sections.
    //return [self numberOfStatuses:self.matches]; Werkt niet in 100% van de cases.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
// #warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section == 0) {
        return self.matchesPlayed.count;
    } else if (section == 1) {
            return self.matchesOngoing.count;
    } else {
            return self.matchesNotPlayedyet.count;
    }
}

- (MatchTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MatchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Match" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [cell createCells:[self.matchesPlayed objectAtIndex:indexPath.item]];
    } else if (indexPath.section == 1) {
            [cell createCells:[self.matchesOngoing objectAtIndex:indexPath.item]];
    } else{
           [cell createCells:[self.matchesNotPlayedyet objectAtIndex:indexPath.item]];
    }
    // tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.separatorColor = [UIColor blueColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Status"];
    if (section == 0) {
        cell.status.text = @"Finished Matches";
    } else if (section == 1) {
            cell.status.text = @"Ongoing Matches";
    } else {
            cell.status.text = @"Not Yet Played Matches";
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Detail"]){
        DetailViewController* viewController = segue.destinationViewController;
        NSIndexPath *index = [self.tableView indexPathForCell:sender];
        if (index.section == 0 ){
                [viewController setMatch:[self.matchesPlayed objectAtIndex:index.row]];
        } else if (index.section == 1) {
                [viewController setMatch:[self.matchesOngoing objectAtIndex:index.row]];
        }
        else {
                [viewController setMatch:[self.matchesNotPlayedyet objectAtIndex:index.row]];
        }
    }
}



- (NSUInteger) numberOfStatuses:(NSArray *)array{
    NSUInteger status1 = 0;
    NSUInteger status2 = 0;
    NSUInteger status3 = 0;
    for (Match *m in array) {
        if (m.status == MatchStatusNotPlayedYet) {
            status1 = 1;
        } else if (m.status == MatchStatusOngoing) {
                status2 = 1;
        } else {
                status3 = 1;
        }
    }
    return status1 + status2 + status3;
}

- (void) statusCheck:(NSArray *)array{
    for (Match *m in array) {
        if (m.status == MatchStatusPlayed) {
            [self.matchesPlayed addObject:m];
        }
        if (m.status == MatchStatusOngoing) {
            [self.matchesOngoing addObject:m];
        }
        if (m.status == MatchStatusNotPlayedYet) {
            [self.matchesNotPlayedyet addObject:m];
        }
    }

    
}



@end
