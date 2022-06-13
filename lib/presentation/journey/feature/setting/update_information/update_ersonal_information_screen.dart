import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';

import '../../../../../common/model/old_model.dart';
import '../../../../widgets/gridview_item.dart';

class UpdateInformationScreen extends StatefulWidget {
  const UpdateInformationScreen({Key? key}) : super(key: key);

  @override
  State<UpdateInformationScreen> createState() =>
      _UpdateInformationScreenState();
}

class _UpdateInformationScreenState extends State<UpdateInformationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(),
      body: OldGridViewViewItem(
        oldModels: OldModel.listOldrModel,
        ableScroll: true,
      ),
    );
  }
}
