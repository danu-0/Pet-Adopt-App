import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pet_adopted_app/components/categori.dart';
import 'package:pet_adopted_app/components/search.dart';
import 'package:pet_adopted_app/controller/controller.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';

class Homelist extends StatelessWidget {
  const Homelist({super.key});

  @override
  Widget build(BuildContext context) {
    final PetController petController = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchEngine(),
              Gap(12),
              Text('Kategori', style: TextApp.h2),
              Categori(),
              Gap(16),

              // List Pet
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        2, // 2 kolom agar konten tidak terlalu kecil
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio:
                        3 / 4.2, // proporsi kotak (gambar + detail)
                  ),
                  itemCount: petController.petData.length,
                  itemBuilder: (context, index) {
                    final pet = petController.petData[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: blue.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar Pet
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  pet.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Gap(6),

                            // Nama dan Kategori
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                            // Lokasi
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 16, color: black),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
