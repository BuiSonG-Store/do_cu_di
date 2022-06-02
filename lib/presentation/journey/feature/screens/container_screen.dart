import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.red,
      child: const Text('container'),
    );
  }
}
