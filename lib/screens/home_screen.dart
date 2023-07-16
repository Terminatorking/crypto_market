import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("CryptoMarket"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            width: size.width,
            child: TextField(
              controller: searchController,
              cursorColor: Colors.white,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
              ),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
                fillColor: Colors.greenAccent.withOpacity(0.8),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide(width: 0),
                ),
                hintText: "type your crypto name to search...",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
