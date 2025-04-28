import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pet_adopted_app/components/boxStat.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';

class DetailPet extends StatefulWidget {
  const DetailPet({super.key});

  @override
  State<DetailPet> createState() => _DetailPetState();
}

class _DetailPetState extends State<DetailPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, top: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                Text(
                  "Pet Detail's",
                  style: TextApp.h2,
                ),
                CircleAvatar(
                  child: Icon(Icons.heart_broken),
                )
              ],
            ),
            Gap(16),
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colour.blue,
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
                          color: Colour.yellow,
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: TextApp.heading,
                        ),
                        Text(
                          "Rp.200 K",
                          style: TextApp.headingY,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          'Mataram, gebang baru',
                          style: TextApp.reguler,
                        )
                      ],
                    ),
                    Gap(16),
                    //bagian status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BoxStat(icon: Icons.heart_broken, value: "Kesehatan"),
                        BoxStat(icon: Icons.heart_broken, value: "Kesehatan"),
                      ],
                    ),
                    Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BoxStat(icon: Icons.heart_broken, value: "Kesehatan"),
                        BoxStat(icon: Icons.heart_broken, value: "Kesehatan"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Gap(12),
            Text(
              'Tentang Pet',
              style: TextApp.heading,
            ),
            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"),
            Gap(12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colour.blue,

                padding: EdgeInsets.symmetric(
                    vertical: 10), // Padding vertikal untuk tinggi
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Sudut melengkung
                ),
              ),
              child: Text(
                'Submit',
                style: TextApp.h2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
