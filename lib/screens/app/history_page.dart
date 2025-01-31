import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4168EB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // White Background for the Body
            Container(
              width: Get.width,
              height: Get.height,
              color: Colors.white,
            ),

            // Blue Background Container
            Container(
              width: Get.width,
              height: Get.height * 0.3,
              color: const Color(0xff4168EB),
            ),

            // Scrollable Content
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.05), // Space for blue header

                  // Title Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "History",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: Get.width * 0.40,
                          height: Get.height * 0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jan, 31, 2025',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -1),
                                  child: const Icon(
                                    Icons.arrow_drop_down_circle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // White Container with Cards
                  Container(
                    margin: EdgeInsets.only(
                      top: Get.height * 0.05, // Adjust spacing
                      left: Get.width * 0.05,
                      right: Get.width * 0.05,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        CustomInfoCard(
                          titleText: '7958 Swift Village',
                          locationText: '105 William St, Chicago, US',
                          amountText: '\$75.00',
                          statusText: 'Completed',
                          statusColor: Colors.green,
                          checkIconColor: Colors.green,
                        ),
                        SizedBox(height: 10),
                        CustomInfoCard(
                          titleText: '026 Mitchell Burg Apt. 574',
                          locationText: '324 Lottie Views Suite 426',
                          amountText: '\$30.00',
                          statusText: 'Cancelled',
                          statusColor: Colors.red,
                          checkIconColor: Colors.red,
                        ),
                        SizedBox(height: 10),
                        CustomInfoCard(
                          titleText: '89 Stacy Falls Suite 953',
                          locationText: '080 Joaquin Isle Suite 865',
                          amountText: '\$35.00',
                          statusText: 'In Progress',
                          statusColor: Colors.orange,
                          checkIconColor: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInfoCard extends StatelessWidget {
  final IconData? checkIcon;
  final Color? checkIconColor;
  final String? titleText;
  final IconData? locationIcon;
  final Color? locationIconColor;
  final String? locationText;
  final String? amountText;
  final String? statusText;
  final Color? statusColor;
  final VoidCallback? onTap;

  const CustomInfoCard({
    Key? key,
    this.checkIcon,
    this.checkIconColor,
    this.titleText,
    this.locationIcon,
    this.locationIconColor,
    this.locationText,
    this.amountText,
    this.statusText,
    this.statusColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row (Check Icon and Title)
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 8),
            child: Row(
              children: [
                Icon(
                  checkIcon ?? Icons.check_circle_outline_sharp,
                  color: checkIconColor ?? const Color(0xff4168EB),
                ),
                const SizedBox(width: 10),
                Text(
                  titleText ?? 'No history yet',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Second Row (Location Icon and Text)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  locationIcon ?? Icons.location_on,
                  color: locationIconColor ?? const Color(0xFFEB4141),
                ),
                const SizedBox(width: 10),
                Text(
                  locationText ?? '105 William St, Chicago, US',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),

          // Bottom Row (Amount and Status)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Amount Section
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      color: Colors.grey,
                    ),
                    Text(
                      amountText ?? '\$75.00',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // Status Section
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Text(
                        statusText ?? 'Completed',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: statusColor ?? Colors.green,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
