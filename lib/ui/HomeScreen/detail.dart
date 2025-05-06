import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pet_adopted_app/components/boxStat.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';
import 'package:pet_adopted_app/data/api/model.dart';

class DetailPet extends StatefulWidget {
  final Pet pet;

  const DetailPet({super.key, required this.pet});

  @override
  State<DetailPet> createState() => _DetailPetState();
}

class _DetailPetState extends State<DetailPet> {
  @override
  Widget build(BuildContext context) {
    final pet = widget.pet;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar Custom
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: blue.withOpacity(0.1),
                        child: Icon(Icons.arrow_back_ios_new, color: black),
                      ),
                    ),
                    Text("Pet Detail's", style: TextApp.h2),
                    CircleAvatar(
                      backgroundColor: blue.withOpacity(0.1),
                      child: Icon(Icons.favorite_border, color: black),
                    ),
                  ],
                ),

                Gap(16),

                // Banner Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar Pet
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: yellow,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.network(
                              pet.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Center(
                                child: Icon(Icons.broken_image,
                                    size: 60, color: blue),
                              ),
                            ),
                          ),
                        ),
                        Gap(12),

                        // Nama dan Harga
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(pet.name, style: TextApp.heading),
                            Text("Rp. 200 K", style: TextApp.headingY),
                          ],
                        ),

                        Gap(4),

                        // Lokasi
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: 18, color: black),
                            Gap(4),
                            Text(pet.location, style: TextApp.reguler),
                          ],
                        ),

                        Gap(16),

                        // Status Baris 1
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BoxStat(icon: Icons.monitor_heart, value: "Sehat"),
                            BoxStat(
                                icon: Icons.emoji_emotions,
                                value: pet.category),
                          ],
                        ),

                        Gap(16),

                        // Status Baris 2
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BoxStat(
                                icon: Icons.access_time_filled,
                                value: "${pet.age} Years"),
                            BoxStat(icon: Icons.transgender, value: pet.sex),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(16),

                // Tentang Pet
                Text('Tentang Pet', style: TextApp.heading),
                Gap(8),
                Text(
                  pet.description,
                  style: TextApp.reguler,
                ),

                Gap(20),

                // Tombol Submit
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Adopsi Sekarang', style: TextApp.h2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
