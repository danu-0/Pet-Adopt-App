import "package:flutter/material.dart";
import 'package:gap/gap.dart';
import 'package:pet_adopted_app/components/categori.dart';
import 'package:pet_adopted_app/theme/colour.dart';
import 'package:pet_adopted_app/theme/text.dart';
import 'package:pet_adopted_app/ui/HomeScreen/detail.dart';
import 'package:pet_adopted_app/ui/HomeScreen/homeList.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colour.blue,
                  radius: 30,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      color: Colour.blue,
                    ),
                    Gap(10),
                    Container(
                      height: 40,
                      width: 100,
                      color: Colour.blue,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hallo', style: TextApp.h1),
                    Text(
                      'Selamat Datang di pet adopted',
                      style: TextApp.reguler,
                    ),
                  ],
                ),
              ),
            ),
            Gap(12),
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colour.blue, borderRadius: BorderRadius.circular(10)),
            ),
            Gap(16),
            Text(
              'Kategori',
              style: TextApp.h2,
            ),
            Categori(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hewan Pendatang',
                  style: TextApp.h2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Homelist()));
                  },
                  child: Text(
                    'Lihat lainnya',
                    style: TextApp.regulerLink,
                  ),
                )
              ],
            ),
            Gap(12),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailPet()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 12,
                      ),
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colour.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('Pet ${index + 1}')),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
