import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/dimens.dart';
import '../theme/styles.dart';
import '../view_model/friend_request_controller.dart';
import '../data/repositories/friend_request_repository.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendRequestPage extends StatelessWidget {
  FriendRequestPage({super.key});
  final FriendRequestController controller =
      Get.put(FriendRequestController(FriendRequestRepository()));
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> options = [
      {'Friend Request': 'assets/images/friend_request.png'},
      {
        'My Friends': 'assets/images/friends.png',
      },
      {
        'Send Request': 'assets/images/add_friend.png',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: InkWell(
              onTap: () {
                debugPrint('Back Icon Clicked');
              },
              child: Icon(Icons.arrow_back_ios_new)),
        ),
        title: Text('Friends', style: Styles.black20SemiBold),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              'assets/images/search.png',
              width: 26,
              height: 26,
            ),
          ),
        ],
        toolbarHeight: 100,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.friendRequests.isEmpty) {
            return Center(child: Text('No friend requests.'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    String label = options[index].keys.first;
                    String image = options[index][label]!;
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('$label clicked')),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 4, right: 12),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: index == 0
                                    ? Colors.blue
                                    : Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              image,
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              label,
                              textAlign: TextAlign.center,
                              style: Styles.black12SemiBold,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 8,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Friend requests',
                      textAlign: TextAlign.center, style: Styles.black20Bold),
                  SizedBox(width: 8),
                  Text('${controller.friendRequests.length}',
                      style: Styles.red20Bold),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.friendRequests.length,
                  itemBuilder: (context, index) {
                    var request = controller.friendRequests[index];
                    return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 5,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(request.avatarUrl),
                                radius: 40,
                              )),
                          SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            flex: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      request.name,
                                      style: Styles.black14SemiBold,
                                    ),
                                    Text('6d', style: Styles.grey12Medium),
                                  ],
                                ),
                                // Text(request.status.capitalize ?? 'Pending'),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 22,
                                      width: 40,
                                      child: Stack(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                              'assets/images/user_2.png',
                                            ),
                                            radius: 14,
                                          ),
                                          Positioned(
                                            right: -3,
                                            top: 0,
                                            bottom: 0,
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                'assets/images/user_3.png',
                                              ),
                                              radius: 14,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text('21 mutual friends',
                                        style: Styles.grey12Medium),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                request.status == 'pending'
                                    ? Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => controller
                                                  .updateRequestStatus(
                                                      request.id, 'confirm'),
                                              child: Container(
                                                height: 37,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Confirm',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.manrope()
                                                            .fontFamily,
                                                    color: Colors.white,
                                                    fontSize: Dimens.fourteen,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 11),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => controller
                                                  .updateRequestStatus(
                                                      request.id, 'delete'),
                                              child: Container(
                                                height: 37,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Delete',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.manrope()
                                                            .fontFamily,
                                                    color: Colors.black,
                                                    fontSize: Dimens.fourteen,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(request.status.capitalize ?? ''),
                              ],
                            ),
                          ),
                        ]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 30,
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
