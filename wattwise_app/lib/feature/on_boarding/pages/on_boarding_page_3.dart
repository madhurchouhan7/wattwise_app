import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/feature/auth/widgets/cta_button.dart';
import 'package:wattwise_app/feature/on_boarding/widget/people_select.dart';
import 'package:wattwise_app/utils/svg_assets.dart';

class OnBoardingPage3 extends StatefulWidget {
  final PageController pageController;
  const OnBoardingPage3({super.key, required this.pageController});

  @override
  State<OnBoardingPage3> createState() => _OnBoardingPage3State();
}

class _OnBoardingPage3State extends State<OnBoardingPage3> {
  int _peopleCount = 2;
  String? _selectedFamilyType;
  String? _selectedHouseType;

  final List<String> _familyOptions = [
    'Just Me',
    'Small Family',
    'Large Family',
    'Join Family',
  ];

  void _increment() {
    setState(() {
      _peopleCount++;
    });
  }

  void _decrement() {
    if (_peopleCount > 1) {
      setState(() {
        _peopleCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final fontSize = width * 0.05;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        // fixed row at the top
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.02,
          ),
          child: Row(
            children: [
              // TODO: Add Progress Indicator here
              const Placeholder(fallbackHeight: 10, fallbackWidth: 100),

              const Spacer(),

              TextButton(onPressed: () {}, child: const Text('Skip Setup')),
            ],
          ),
        ),

        // scrollable content
        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: width * 0.02,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Step 3 of 5',
                        style: GoogleFonts.poppins(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: fontSize * 0.65,
                        ),
                      ),

                      SizedBox(height: width * 0.05),

                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'How many People live with you?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: fontSize * 1.3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'This helps us estimate typical electricity usage for your household.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: fontSize * 0.75,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.05),

                      SvgPicture.asset(
                        SvgAssets.people_home_svg,
                        width: width * 0.4,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PeopleSelect(text: '-', onTap: _decrement),

                          Column(
                            children: [
                              Text(
                                '$_peopleCount',
                                style: GoogleFonts.poppins(
                                  fontSize: fontSize * 3,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              Text(
                                'People',
                                style: GoogleFonts.poppins(
                                  fontSize: fontSize * 0.75,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          PeopleSelect(text: '+', onTap: _increment),
                        ],
                      ),

                      SizedBox(height: width * 0.05),

                      Wrap(
                        spacing: 12, // More compact spacing
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: _familyOptions.map((option) {
                          final isSelected = _selectedFamilyType == option;
                          return ChoiceChip(
                            label: Text(option),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                _selectedFamilyType = selected ? option : null;
                              });
                            },
                            labelStyle: GoogleFonts.poppins(
                              fontSize: fontSize * 0.75,
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.black87,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                            selectedColor: Colors.blueGrey[50],
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: isSelected
                                    ? primaryColor
                                    : Colors.grey.shade300,
                                width: 1.5,
                              ),
                            ),
                            showCheckmark: false, // Cleaner look as requested
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          );
                        }).toList(),
                      ),

                      SizedBox(height: width * 0.07),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\tMore Details(optional)',
                            style: GoogleFonts.poppins(
                              fontSize: fontSize * 0.75,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 10),

                          DropdownButtonFormField<String>(
                            initialValue: _selectedHouseType,
                            items:
                                ['Apartment', 'Bungalow', 'Independent House']
                                    .map(
                                      (type) => DropdownMenuItem(
                                        value: type,
                                        child: Text(type),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedHouseType = value;
                              });
                            },
                            hint: const Text('HOUSE TYPE'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: width * 0.03,
                              ),
                            ),
                          ),

                          SizedBox(height: width * 0.05),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: CtaButton(
                    text: 'Continue',
                    onPressed: () {
                      widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
