import 'package:e_hospital_service/constants/app_colors.dart';
import 'package:e_hospital_service/constants/app_text_styles.dart';
import 'package:e_hospital_service/providers/auth_provider.dart';
import 'package:e_hospital_service/widgets/custom_input_field.dart';
import 'package:e_hospital_service/widgets/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.login(
        email: _emailController.text.trim(),
        password: _passwordController.text);
    if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(authProvider.errorMessage ?? 'Login gagal'),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10)),
      ));
      authProvider.clearError();
    }
  }

  Future<void> _handleDemoLogin() async {
    await context.read<AuthProvider>().loginWithDemo();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInputField(
                  label: 'Email Address',
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (v) {
                    if (v == null || v.isEmpty)
                      return 'Please enter your email';
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(v)) return 'Please enter a valid email';
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomInputField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  controller: _passwordController,
                  validator: (v) {
                    if (v == null || v.isEmpty)
                      return 'Please enter your password';
                    if (v.length < 6)
                      return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (val) =>
                                setState(() => _rememberMe = val ?? false),
                            activeColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            side: const BorderSide(
                                color: AppColors.checkboxBorder, width: 1.5),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text('Remember me',
                            style: AppTextStyles.rememberMe),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      child: const Text('Forgot Password?',
                          style: AppTextStyles.forgotPassword),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                    text: 'Login',
                    onPressed: _handleLogin,
                    isLoading: auth.isLoading),
                const SizedBox(height: 20),
                Row(children: const [
                  Expanded(child: Divider(color: AppColors.divider)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Or', style: AppTextStyles.orDivider)),
                  Expanded(child: Divider(color: AppColors.divider)),
                ]),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'Continue with Demo Account',
                  onPressed: auth.isLoading ? null : _handleDemoLogin,
                  backgroundColor: AppColors.white,
                  textColor: AppColors.textPrimary,
                ),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(style: AppTextStyles.footerText, children: [
                      const TextSpan(text: 'By continuing, you agree to our '),
                      TextSpan(
                          text: 'Terms of Service',
                          style: AppTextStyles.footerLink,
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      const TextSpan(text: ' and\n'),
                      TextSpan(
                          text: 'Privacy Policy',
                          style: AppTextStyles.footerLink,
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
