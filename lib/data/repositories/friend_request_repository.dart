import '../models/friend_request_model.dart';

class FriendRequestRepository {
  Future<List<FriendRequest>> fetchFriendRequests() async {
    // Simulate an API call or database query
    await Future.delayed(Duration(seconds: 2)); 
    return [
      FriendRequest(id: '1', name: 'Rashid Batthi', avatarUrl: 'assets/images/user_1.png'),
      FriendRequest(id: '2', name: 'Rashid Batthi', avatarUrl: 'assets/images/user_1.png'),
      FriendRequest(id: '3', name: 'Rashid Batthi', avatarUrl: 'assets/images/user_1.png'),
      FriendRequest(id: '4', name: 'Rashid Batthi', avatarUrl: 'assets/images/user_1.png'),
      FriendRequest(id: '5', name: 'Rashid Batthi', avatarUrl: 'assets/images/user_1.png'),
      FriendRequest(id: '6', name: 'Rashid Batthi', avatarUrl: 'assets/images/user_1.png'),
      FriendRequest(id: '7', name: 'Rashid Batthi', avatarUrl: 'assets/images/user_1.png'),
    ];
  }

  Future<void> updateFriendRequestStatus(String id, String status) async {
    // Simulate an API call to update status
    await Future.delayed(Duration(milliseconds: 500));
  }
}
