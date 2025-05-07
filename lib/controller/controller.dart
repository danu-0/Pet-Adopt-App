import 'package:get/get.dart';
import 'package:pet_adopted_app/data/api/model.dart';
import 'package:pet_adopted_app/ui/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userData = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void setUser(Map<String, dynamic> data) {
    userData.value = data;
    saveUserData(data);
  }

  void saveUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', data['name']);
    await prefs.setString('email', data['email']);
    await prefs.setBool('isLoggedIn', true);
  }

  void loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('userName');
    String? email = prefs.getString('email');

    if (name != null && email != null) {
      userData.value = {
        'name': name,
        'email': email,
      };
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    userData.value = {};
    Get.offAll(() => LoginPage());
  }
}

class PetController extends GetxController {
  var petData = <Pet>[].obs;
  var selectedCategory = ''.obs;

  void setPet(List<Pet> pets) {
    petData.value = pets;
  }

  void setCategory(String category) {
    selectedCategory.value = category;
  }

  List<Pet> get filteredPets {
    if (selectedCategory.value.isEmpty) {
      return petData;
    } else {
      return petData
          .where((pet) =>
              pet.category.toLowerCase() ==
              selectedCategory.value.toLowerCase())
          .toList();
    }
  }
}
