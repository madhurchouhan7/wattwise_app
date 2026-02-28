import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/core/colors.dart';
import 'package:wattwise_app/feature/bill/widgets/upload_photo_button.dart';

class AddBillScreen extends StatelessWidget {
  const AddBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Add Bill",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close_rounded,
              color: AppColors.textSecondary,
              size: 28,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UploadPhotoButton(onPressed: () {}),
              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, color: Colors.grey.shade200),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "or fill manually",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.textSecondary.withAlpha(150),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(height: 1, color: Colors.grey.shade200),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              Text(
                "Billing Period",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: TextField(
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          labelText: "Start",
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                          hintText: "mm/dd/yy",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.primaryBlue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: TextField(
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                        decoration: InputDecoration(
                          labelText: "End",
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                          hintText: "mm/dd/yy",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            color: AppColors.textPrimary,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.primaryBlue,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.info_rounded,
                    color: AppColors.primaryBlue,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Usual cycle is 30 days",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              _buildLabelledTextField(
                label: "Units Consumed",
                hintText: "0",
                suffix: Text(
                  "kWh",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              _buildLabelledTextField(
                label: "Total Amount",
                hintText: "0.00",
                prefix: Text(
                  "₹  ",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              const SizedBox(height: 24),
              _buildLabelledTextField(
                label: "BILL NUMBER",
                optional: true,
                hintText: "e.g. #INV-2023-001",
                hintColor: AppColors.textSecondary.withAlpha(150),
              ),

              const SizedBox(height: 24),
              _buildLabelledTextField(
                label: "DUE DATE",
                optional: true,
                hintText: "mm/dd/yyyy",
                hintColor: AppColors.textSecondary.withAlpha(150),
              ),

              const SizedBox(height: 48),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Save Bill",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelledTextField({
    required String label,
    bool optional = false,
    required String hintText,
    Color? hintColor,
    Widget? prefix,
    Widget? suffix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                letterSpacing: optional ? 0.5 : 0.0,
              ),
            ),
            if (optional) ...[
              const SizedBox(width: 4),
              Text(
                "(optional)",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textSecondary.withAlpha(150),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 56, // Match design larger text fields
          child: TextField(
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: AppColors.textPrimary,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                fontSize: 16,
                color: hintColor ?? AppColors.textPrimary,
              ),
              prefixIcon: prefix != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 8.0,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: prefix,
                    )
                  : null,
              suffixIcon: suffix != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        top: 16.0,
                        bottom: 16.0,
                      ),
                      child: suffix,
                    )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primaryBlue,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
