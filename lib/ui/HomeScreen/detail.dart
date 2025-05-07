import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '/components/boxStat.dart';
import '/theme/colour.dart';
import '/theme/text.dart';
import '/data/api/model.dart';

class DetailPet extends StatefulWidget {
  final Pet pet;

  const DetailPet({super.key, required this.pet});

  @override
  State<DetailPet> createState() => _DetailPetState();
}

class _DetailPetState extends State<DetailPet> {
  bool isWishlisted = false;

  void _toggleWishlist() {
    setState(() {
      isWishlisted = !isWishlisted;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pet = widget.pet;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/material/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: baseColour.withOpacity(0.1),
                        child: Icon(Icons.arrow_back_ios_new, color: black),
                      ),
                    ),
                    Text("Detail Pet", style: TextApp.h2),
                    // Wishlist toggle
                    CircleAvatar(
                      backgroundColor: baseColour.withOpacity(0.1),
                      child: IconButton(
                        icon: Icon(
                          isWishlisted ? Icons.favorite : Icons.favorite_border,
                          color: isWishlisted ? Colors.red : black,
                        ),
                        onPressed: _toggleWishlist,
                      ),
                    ),
                  ],
                ),

                Gap(16),

                // Card pet
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: baseColour,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                    size: 60, color: baseColour),
                              ),
                            ),
                          ),
                        ),
                        Gap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(pet.name, style: TextW.heading),
                            Text("Rp. 200 K", style: TextW.heading),
                          ],
                        ),
                        Gap(4),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                size: 18, color: white),
                            Gap(4),
                            Text(pet.location, style: TextW.reguler),
                          ],
                        ),
                        Gap(16),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BoxStat(
                                icon: Icons.access_time_filled,
                                value: "${pet.age} Tahun"),
                            BoxStat(icon: Icons.transgender, value: pet.sex),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(16),

                // Deskripsi
                Text('Tentang Pet', style: TextApp.heading),
                Gap(8),
                Text(
                  pet.description,
                  style: TextApp.reguler,
                ),

                Gap(20),

                // Tombol adopsi
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: baseColour,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    minimumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Adopsi Sekarang', style: TextW.h2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
