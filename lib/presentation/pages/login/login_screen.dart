import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constatnts/colors.dart';
import '../../../core/constatnts/custom_textfeild.dart';
import '../../../core/constatnts/font_types.dart';
import '../../../core/constatnts/images.dart';
import '../home_screens/dashboard_screen.dart' show DashboardScreen;
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.primaryColor1, AppColor.primaryColor2],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                    width: MediaQuery.of(context).size.width,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColor.whiteColor
                                    ),
                                    child: Image.asset(AppImages.logo)),
                                const SizedBox(height: 40),
                                Text(
                                  "SignUp With",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: MyFonts.poppins,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                                Text(
                                  "Your Email Address!",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: MyFonts.poppins,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            CustomTextField(
                              controller: _emailController,
                              label: "Email",
                              icon: Icons.email,
                            ),
                            const SizedBox(height: 15),
                            CustomTextField(
                              controller: _passwordController,
                              label: "Password",
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primaryColor2,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed:
                                    viewModel.isLoading
                                        ? null
                                        : () async {
                                          FocusScope.of(context).unfocus();

                                          bool success = await viewModel.login(
                                            _emailController.text.trim(),
                                            _passwordController.text.trim(),
                                          );

                                          if (success) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Login Successful!",
                                                  style: TextStyle(
                                                    fontFamily: MyFonts.poppins,
                                                  ),
                                                ),
                                                backgroundColor: Colors.green,
                                              ),
                                            );
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => DashboardScreen(
                                                  userEmail: _emailController.text.trim(), // ✅ Pass entered email directly
                                                ),
                                              ),
                                            );


                                          } else {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  style: TextStyle(
                                                    fontFamily: MyFonts.poppins,
                                                  ),
                                                  viewModel.errorMessage ??
                                                      "Login failed!",
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        },
                                child:
                                    viewModel.isLoading
                                        ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                        : const Text(
                                          "Login",
                                          style: TextStyle(
                                            fontFamily: MyFonts.poppins,
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
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
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
