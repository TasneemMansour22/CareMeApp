import 'package:flutter/material.dart';

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({super.key});

  @override
  State<AccountTypeScreen> createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  String? selectedAccountType;

  void selectAccountType(String accountType) {
    setState(() {
      selectedAccountType = accountType;
    });
  }

  Widget _buildAccountOption({
    required String accountType,
    required String imagePath,
    required String label,
    required double imageHeight,
  }) {
    bool isSelected = selectedAccountType == accountType;

    return Column(
      children: [
        GestureDetector(
          onTap: () => selectAccountType(accountType),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? const Color(0xFF308A99) : Colors.black12,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              imagePath,
              height: imageHeight,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Adjust padding and image height based on screen size
    double imageHeight = screenWidth * 0.2; // Adjust this for better scaling

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Choose account type",
                      style: TextStyle(
                        fontSize: screenWidth * 0.08, // Dynamic font size
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Please choose the type of account you\nwould like to create",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // Dynamic font size
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
              _buildAccountOption(
                accountType: "service_provider",
                imagePath: 'assets/images/servicsProvider.png',
                label: "Service provider",
                imageHeight: imageHeight,
              ),
              _buildAccountOption(
                accountType: "elderly",
                imagePath: 'assets/images/eldery.png',
                label: "Elderly",
                imageHeight: imageHeight,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF308A99),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 115,
                    ),
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}