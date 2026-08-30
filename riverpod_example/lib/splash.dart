import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_example/mainscreen.dart';
import 'package:riverpod_example/providers/nav_item_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // ----------------------------------------------------------
    // Animation Controller
    // ----------------------------------------------------------
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // ----------------------------------------------------------
    // Fade Animation
    // ----------------------------------------------------------
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // ----------------------------------------------------------
    // Scale Animation
    // ----------------------------------------------------------
    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    // Start loading navigation data
    _loadNavigation();
  }

  // ------------------------------------------------------------
  // Load Navigation Data
  // ------------------------------------------------------------
  Future<void> _loadNavigation() async {
    try {
      // Wait until navItemsProvider finishes its build().
      await ref.read(navItemsProvider.future);

      if (!mounted) return;

      // Small delay so the splash animation can be seen.
      await Future.delayed(const Duration(milliseconds: 800));

      if (!mounted) return;

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
    } catch (error) {
      // Error is handled by build()
      debugPrint('Navigation loading error: $error');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ----------------------------------------------------------
    // WATCH PROVIDER
    // ----------------------------------------------------------
    final navItemsAsync = ref.watch(navItemsProvider);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),

              // ------------------------------------------------
              // LOGO
              // ------------------------------------------------
              FadeTransition(
                opacity: _fadeAnimation,

                child: ScaleTransition(
                  scale: _scaleAnimation,

                  child: Container(
                    width: 120,
                    height: 120,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Icon(
                      Icons.account_balance_rounded,
                      size: 65,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ------------------------------------------------
              // APP NAME
              // ------------------------------------------------
              FadeTransition(
                opacity: _fadeAnimation,

                child: const Text(
                  'My Banking App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ------------------------------------------------
              // STATUS
              // ------------------------------------------------
              navItemsAsync.when(
                loading: () {
                  return const Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  );
                },

                data: (items) {
                  return Text(
                    'Preparing your application...',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 14,
                    ),
                  );
                },

                error: (error, stack) {
                  return const Text(
                    'Unable to load application',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  );
                },
              ),

              const Spacer(),

              // ------------------------------------------------
              // LOADING / ERROR
              // ------------------------------------------------
              navItemsAsync.when(
                loading: () {
                  return const Column(
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 16),

                      Text(
                        'Loading navigation...',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  );
                },

                data: (items) {
                  return const SizedBox(
                    height: 28,
                    width: 28,
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  );
                },

                error: (error, stack) {
                  return Column(
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.white,
                        size: 32,
                      ),

                      const SizedBox(height: 12),

                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(navItemsProvider);
                          _loadNavigation();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 40),

              // ------------------------------------------------
              // VERSION
              // ------------------------------------------------
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.65),
                  fontSize: 12,
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
