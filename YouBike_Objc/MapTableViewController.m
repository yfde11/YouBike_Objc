//
//  MapTableViewController.m
//  YouBike_Objc
//
//  Created by 謝豐任 on 2017/5/9.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

#import "MapTableViewController.h"
#import "MapTableViewCell.h"
#import "CommentTableViewCell.h"

 enum Componets{
    map ,
    station,
    comment,
} ;

@interface MapTableViewController ()
{
    NSArray *componentsArray;
    
}

    @property (strong, nonatomic) NSString *identifier;


@end

@implementation MapTableViewController{
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _identifier = [NSString new];
    _identifier = @"CommentTableViewCell";
    
     componentsArray = [[NSArray alloc] initWithObjects: map, station, comment, nil];
//    componetsArray = [[NSArray alloc] initWithObjects: @"a", @"sss", @"ddCommentTableViewCellCommentTableViewCellCommentTableViewCellCommentTableViewCellCommentTableViewCellCommentTableViewCellCommentTableViewCellCommentTableViewCellCommentTableViewCelld", nil];
    
    UINib *cellNib = [UINib nibWithNibName:_identifier bundle:nil];
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:_identifier];
    
        //[self.tableView registerNib:cellNib forCellReuseIdentifier:@"CommentTableViewCell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return componentsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    switch (0) {
        case 1:
        case 2:
            return 1;
            break;
        case 3:
            return 3;
        default:
            break;
    }
    return componentsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    CommentTableViewCell *commentCell = [tableView dequeueReusableCellWithIdentifier:_identifier forIndexPath:indexPath];
    
    commentCell.comment.text = componentsArray[indexPath.row];
    return commentCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGSize constrain = CGSizeMake(375, CGFLOAT_MAX);
    CGSize boundingBox = [[componentsArray objectAtIndex:indexPath.row] boundingRectWithSize:constrain options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]} context:nil].size;
  
    
    if (ceil(boundingBox.height) < 100) {
        return 100;
    } else {
        return ceil(boundingBox.height) + 80;
    }
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
