import 'package:e_hospital_service/constants/app_colors.dart';
import 'package:e_hospital_service/screens/auth/login_screen.dart';
import 'package:e_hospital_service/screens/auth/signup_screen.dart';
import 'package:e_hospital_service/widgets/auth_header.dart';
import 'package:e_hospital_service/widgets/auth_tab_switcher.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoginSelected = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() => _isLoginSelected = _tabController.index == 0);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        children: [
          // Header Section
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.primary,
              child: const SafeArea(child: Center(child: AuthHeader())),
            ),
          ),

          // white card section
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                children: [
                  // Tab Switcher
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: AuthTabSwitcher(
                      isLoginSelected: _isLoginSelected,
                      onLoginTap: () {
                        setState(() => _isLoginSelected = true);
                        _tabController.animateTo(0);
                      },
                      onSignUpTap: () {
                        setState(() => _isLoginSelected = false);
                        _tabController.animateTo(1);
                      },
                    ),
                  ),
                  // form section
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        // Login Form
                        SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(24, 20, 24, 24),
                          child: LoginScreen(),
                        ),
                        // Sign Up Form
                        SingleChildScrollView(
                          padding: EdgeInsets.fromLTRB(24, 20, 24, 24),
                          child: SignUpScreen(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
