import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nasa_app/common/constants/app_colors.dart';
import 'package:nasa_app/features/home_page/home_page.dart';
// Importe sua tela de destino aqui
// import 'package:nasa_app/features/home/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Configura o controlador da animação
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duração total
    );

    // 2. Define a sequência da escala (0 -> 1.2 -> 1.0)
    // Usei 1.2 em vez de 2 para não estourar a tela, mas você pode ajustar
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.2,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 70, // 70% do tempo subindo
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.2,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30, // 30% do tempo voltando para o tamanho original
      ),
    ]).animate(_controller);

    // 3. Inicia a animação e navega ao terminar
    _controller.forward().then((_) {
      // Substitua 'NextPage' pela sua rota real
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>HomePage())
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Importante para não vazar memória
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.blueGradient,
          ),
        ),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Sombra/Brilho ao fundo
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    AppColors.black.withAlpha(40),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/images/nasa_logo.png',
                    width: 320,
                    height: 320,
                  ),
                ),
              ),
              // Logo principal
              Image.asset(
                'assets/images/nasa_logo.png',
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
