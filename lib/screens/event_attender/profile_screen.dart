import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:show_up_app/helpers/validators/validator.dart';
import 'package:show_up_app/theme/size/app_size.dart';
import 'package:show_up_app/widgets/buttons/custom_back_button.dart';
import 'package:show_up_app/widgets/buttons/primary_button.dart';
import 'package:show_up_app/widgets/input/custom_text_field.dart';

class AttenderProfileScreen extends StatefulWidget {
  const AttenderProfileScreen({super.key});

  @override
  State<AttenderProfileScreen> createState() => AttenderProfileScreenState();
}

class AttenderProfileScreenState extends State<AttenderProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController majorController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    majorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        centerTitle: true,
        leading: CustomBackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSize.w24),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.2),
                      image: const DecorationImage(
                        image: NetworkImage(''),

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 18,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                label: 'Full Name',
                controller: nameController,
                validator: Validator().nameValidator,
              ),
              SizedBox(height: AppSize.h20),
              CustomTextField(
                label: 'Major',
                controller: majorController,
                validator: Validator().emptyValidator,
              ),
              SizedBox(height: 40.h),
              PrimaryButton(
                text: 'Update Profile',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
