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
                                    color: AppColor.whiteColor,
                                  ),
                                  child: Image.asset(AppImages.logo),
                                ),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to your Forgot Password Screen
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ForgotPasswordScreen(),
                            //   ),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, right: 4),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: MyFonts.poppins,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.none, // underline for clickable look
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.width >= 600
                                        ? 20
                                        : MediaQuery.of(context).size.width <
                                            380
                                        ? 5
                                        : 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                  width:
                                      MediaQuery.of(context).size.width >= 600
                                          ? 2
                                          : 1.5,
                                ),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                splashColor: Colors.white.withOpacity(0.2),
                                onTap:
                                    viewModel.isLoading
                                        ? null
                                        : () async {
                                          FocusScope.of(context).unfocus();

                                          final email =
                                              _emailController.text.trim();
                                          final password =
                                              _passwordController.text.trim();

                                          // ✅ Step 1: Input Validations
                                          if (email.isEmpty &&
                                              password.isEmpty) {
                                            if (!mounted) return;
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Please enter your email and password",
                                                  style: TextStyle(
                                                    fontFamily: MyFonts.poppins,
                                                  ),
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                            return;
                                          } else if (email.isEmpty) {
                                            if (!mounted) return;
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Please enter your email",
                                                  style: TextStyle(
                                                    fontFamily: MyFonts.poppins,
                                                  ),
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                            return;
                                          } else if (password.isEmpty) {
                                            if (!mounted) return;
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  "Please enter your password",
                                                  style: TextStyle(
                                                    fontFamily: MyFonts.poppins,
                                                  ),
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                            return;
                                          }

                                          // ✅ Step 2: Call API
                                          final success = await viewModel.login(
                                            email,
                                            password,
                                          );

                                          // ✅ Step 3: Check if Widget Still Exists
                                          if (!mounted) return;

                                          // ✅ Step 4: Handle API Response
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

                                            // ✅ Safe Navigation After Async
                                            if (!mounted) return;
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        DashboardScreen(
                                                          userEmail: email,
                                                        ),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  viewModel.errorMessage ??
                                                      "Invalid email or password",
                                                  style: const TextStyle(
                                                    fontFamily: MyFonts.poppins,
                                                  ),
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.width >= 600
                                            ? 20
                                            : 14,
                                  ),
                                  child: Center(
                                    child: Text(
                                      viewModel.isLoading
                                          ? "Loading..."
                                          : "Login",
                                      style: TextStyle(
                                        fontFamily: MyFonts.poppins,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width >=
                                                    600
                                                ? 20
                                                : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
