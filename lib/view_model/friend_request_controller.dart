import 'package:get/get.dart';
import '../data/models/friend_request_model.dart';
import '../data/repositories/friend_request_repository.dart';

class FriendRequestController extends GetxController {
  final FriendRequestRepository repository;

  FriendRequestController(this.repository);

  var friendRequests = <FriendRequest>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadFriendRequests();
  }

  Future<void> loadFriendRequests() async {
    isLoading.value = true;
    try {
      friendRequests.value = await repository.fetchFriendRequests();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateRequestStatus(String id, String status) async {
    await repository.updateFriendRequestStatus(id, status);
    friendRequests.value = friendRequests.map((request) {
      if (request.id == id) {
        return request.copyWith(status: status);
      }
      return request;
    }).toList();
  }
}
