import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pet_adopted_app/ui/HomeScreen/detail.dart';
import '/components/categori.dart';
import '/components/search.dart';
import '/controller/controller.dart';
import '/theme/colour.dart';
import '/theme/text.dart';

class Homelist extends StatefulWidget {
  const Homelist({super.key});

  @override
  State<Homelist> createState() => _HomelistState();
}

class _HomelistState extends State<Homelist> {
  final PetController petController = Get.find();

  String selectedCategory = 'Semua';
  List<String> categories = [
    'Semua',
    'Cat',
    'Dog',
    'Rabbit',
    'Hamster',
    'Bird'
  ];
  List filteredPets = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filterPets();
  }

  void filterPets() {
    List allPets = petController.petData;

    if (selectedCategory != 'Semua') {
      allPets = allPets
          .where((pet) =>
              pet.category.toLowerCase() == selectedCategory.toLowerCase())
          .toList();
    }

    if (searchQuery.isNotEmpty) {
      allPets = allPets
          .where((pet) =>
              pet.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    filteredPets = allPets;
    setState(() {});
  }

  void updateCategory(String category) {
    selectedCategory = category;
    filterPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/material/bg.png'),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchEngine(onSearch: (query) {
                  setState(() {
                    searchQuery = query;
                  });
                  filterPets();
                }),
                Gap(12),
                Text('Kategori', style: TextApp.h2),
                Categori(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onSelectedCategory: updateCategory,
                ),
                Gap(16),
                Expanded(
                  child: filteredPets.isEmpty
                      ? Center(child: Text('Tidak ada data hewan'))
                      : GridView.builder(
                          padding: EdgeInsets.only(bottom: 12),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3 / 4.2,
                          ),
                          itemCount: filteredPets.length,
                          itemBuilder: (context, index) {
                            final pet = filteredPets[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPet(pet: pet)),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: baseColour,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            pet.image,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                      Gap(6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              pet.name,
                                              style: TextApp.h3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            pet.category,
                                            style: TextApp.reguler,
                                          ),
                                        ],
                                      ),
                                      Gap(4),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on,
                                              size: 16, color: black),
                                          Flexible(
                                            child: Text(
                                              pet.location,
                                              style: TextApp.regulerS,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
