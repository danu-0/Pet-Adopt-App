import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class SearchEngine extends StatefulWidget {
  final Function(String) onSearch;

  const SearchEngine({super.key, required this.onSearch});

  @override
  State<SearchEngine> createState() => _SearchEngineState();
}

class _SearchEngineState extends State<SearchEngine> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              child: Icon(Icons.arrow_back_ios_new),
            ),
          ),
          Gap(20),
          Expanded(
            child: TextField(
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
                widget.onSearch(searchQuery); // Call the callback
              },
              decoration: InputDecoration(
                hintText: 'Cari Hewan..',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
