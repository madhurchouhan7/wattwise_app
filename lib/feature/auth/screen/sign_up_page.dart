import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wattwise_app/core/colors.dart';
import 'package:wattwise_app/feature/auth/widgets/cta_button.dart';
import 'package:wattwise_app/feature/auth/widgets/sign_in_with_google.dart';
import 'package:wattwise_app/utils/svg_assets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Create Account',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          final fontSize = screenWidth * 0.05;

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // continue with google
                    const SignInWithGoogle(svgAssets: SvgAssets.google_svg),

                    //SizedBox(height: fontSize * 1),
                    Row(
                      children: [
                        // line
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),

                        // or
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: fontSize * 0.5,
                          ),
                          child: Text(
                            'OR',
                            style: GoogleFonts.poppins(
                              fontSize: fontSize * 0.8,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),

                        // line
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),
                      ],
                    ),

                    SizedBox(height: fontSize),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Name',
                          style: GoogleFonts.poppins(
                            fontSize: fontSize * 0.75,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: fontSize * 0.4),

                    // name
                    TextFormField(
                      style: GoogleFonts.nunito(color: Colors.black),
                      key: ValueKey('name'),

                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15, right: 5),
                        ),
                        hintText: "Enter your Full name",
                        hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),

                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: fontSize * 1.5),

                    // mail
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Mail Address',
                          style: GoogleFonts.poppins(
                            fontSize: fontSize * 0.75,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: fontSize * 0.4),

                    TextFormField(
                      style: GoogleFonts.nunito(color: Colors.black),
                      key: ValueKey('email'),

                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15, right: 5),
                        ),
                        hintText: "Enter your email address",
                        hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),

                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: fontSize * 1.5),

                    // password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: GoogleFonts.poppins(
                            fontSize: fontSize * 0.75,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: fontSize * 0.4),

                    TextFormField(
                      style: GoogleFonts.nunito(color: Colors.black),
                      key: ValueKey('password'),

                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15, right: 5),
                        ),
                        hintText: "Create a password",
                        hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),

                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: fontSize * 1.5),

                    // passoword strength

                    // confirm password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm Password',
                          style: GoogleFonts.poppins(
                            fontSize: fontSize * 0.75,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: fontSize * 0.4),

                    TextFormField(
                      style: GoogleFonts.nunito(color: Colors.black),
                      key: ValueKey('confirm_password'),

                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 15, right: 5),
                        ),
                        hintText: "Confirm your password",
                        hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[400]!),

                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: fontSize * 1.5),

                    // i agree to Terms of Service and Privacy Policy
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                'I agree to the ',
                                style: GoogleFonts.poppins(
                                  fontSize: fontSize * 0.75,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigate to Terms of Service
                                },
                                child: Text(
                                  'Terms of Service',
                                  style: GoogleFonts.poppins(
                                    fontSize: fontSize * 0.75,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              Text(
                                ' and ',
                                style: GoogleFonts.poppins(
                                  fontSize: fontSize * 0.75,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigate to Privacy Policy
                                },
                                child: Text(
                                  'Privacy Policy',
                                  style: GoogleFonts.poppins(
                                    fontSize: fontSize * 0.75,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: fontSize * 1.5),

                    // Create Account button
                    CtaButton(text: 'Create Account', onPressed: () {}),

                    SizedBox(height: fontSize * 2),

                    // Already have an account? Sign In
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.poppins(
                            fontSize: fontSize * 0.75,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[400],
                          ),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Sign In',
                            style: GoogleFonts.poppins(
                              fontSize: fontSize * 0.75,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
