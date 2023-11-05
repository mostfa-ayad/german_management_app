import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:german_management_app/core/widget/app_custom_text.dart';
import 'package:german_management_app/core/widget/drawer_item.dart';
import 'package:german_management_app/product/presentation/pages/product_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  child: Image.asset(height: 100, "assets/images/avatar.jpeg"),
                ),
              ),
              AppCustomText(
                text: "Moustafa Ayad",
                size: 25,
                fontWeight: FontWeight.bold,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text("Logout")),
              const SizedBox(
                height: 20,
              ),
              AppDrawerItem(
                screen: ProductPage(),
                text: "Product admin",
              )
            ],
          ),
        ),
      ),
    );
  }
}
