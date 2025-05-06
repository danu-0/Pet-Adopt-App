import "package:flutter/material.dart";
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pet_adopted_app/components/card.dart';
import 'package:pet_adopted_app/components/categori.dart';
import 'package:pet_adopted_app/controller/controller.dart';
import 'package:pet_adopted_app/data/api/model.dart';
import 'package:pet_adopted_app/data/api/sercvices.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';
import 'package:pet_adopted_app/ui/HomeScreen/detail.dart';
import 'package:pet_adopted_app/ui/HomeScreen/homeList.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PetController petController = Get.put(PetController());
  Service service = Service();
  bool isLoading = false;
  List<Pet> pets = [];

  Future<void> myPet() async {
    setState(() => isLoading = true);

    try {
      pets = await service.fetchPet();
      petController.setPet(pets);
    } catch (e) {
      print("Error fetching pets: $e");
      Get.snackbar("Error", "Gagal mengambil data hewan dari server",
          snackPosition: SnackPosition.BOTTOM);
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    myPet();
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    final user = userController.userData;

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/material/bg.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: baseColour,
                        radius: 30,
                        child: Icon(
                          Icons.person,
                          color: white,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_bag_rounded),
                            color: baseColour,
                            iconSize: 40,
                          ),
                          Gap(10),
                          IconButton(
                            onPressed: () {
                              userController.logout();
                            },
                            icon: Icon(Icons.logout_outlined),
                            color: baseColour,
                            iconSize: 40,
                          ),
                        ],
                      )
                    ],
                  ),

                  Gap(32),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hallo ${user["name"]}', style: TextApp.h1),
                        Text('Selamat Datang di pet adopted',
                            style: TextApp.reguler),
                      ],
                    ),
                  ),

                  Gap(12),

                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: baseColour,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/material/2.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),

                  Gap(24),

                  Text('Kategori', style: TextApp.h2),
                  Categori(),

                  Gap(16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hewan Pendatang', style: TextApp.h2),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homelist()),
                          );
                        },
                        child: Text('Lihat lainnya', style: TextApp.reguler),
                      )
                    ],
                  ),

                  Gap(12),

                  // List horizontal pet data dari API
                  SizedBox(
                    height: 200,
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : pets.isEmpty
                            ? Center(child: Text("Tidak ada data hewan"))
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: pets.length,
                                itemBuilder: (context, index) {
                                  final pet = pets[index];
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPet(pet: pet)),
                                        );
                                      },
                                      child: card(
                                          gambar: pet.image,
                                          petName: pet.name,
                                          location: pet.location,
                                          kategory: pet.category));
                                },
                              ),
                  ),

                  Gap(16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
