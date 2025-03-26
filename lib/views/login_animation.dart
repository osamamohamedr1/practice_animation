import 'package:flutter/material.dart';
import 'package:practice_animation/helpers/states_enum.dart';
import 'package:rive/rive.dart';

class LoginAnimation extends StatefulWidget {
  const LoginAnimation({super.key});

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation> {
  final FocusNode passwordFoucsNode = FocusNode();
  GlobalKey<FormState> fromKey = GlobalKey();
  String trueEmail = 'osama@gmail.com';
  String password = '123456';
  Artboard? riveArtboard;
  late RiveAnimationController handsUpController;
  late RiveAnimationController handsDownController;
  late RiveAnimationController successController;
  late RiveAnimationController failController;
  late RiveAnimationController lookRightController;
  late RiveAnimationController lookLeftController;
  late RiveAnimationController lookIdleController;
  bool isLookingLeft = false;
  bool isLookingRight = false;

  void addSpaceficController(RiveAnimationController controller) {
    removeAllControllers();
    riveArtboard?.artboard.addController(controller);
  }

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(handsUpController);
    riveArtboard?.artboard.removeController(handsDownController);
    riveArtboard?.artboard.removeController(successController);
    riveArtboard?.artboard.removeController(failController);
    riveArtboard?.artboard.removeController(lookRightController);
    riveArtboard?.artboard.removeController(lookLeftController);
    riveArtboard?.artboard.removeController(lookIdleController);
  }

  @override
  void initState() {
    handsUpController = SimpleAnimation(StatesEnum.Hands_up.name);
    handsDownController = SimpleAnimation(StatesEnum.hands_down.name);
    successController = SimpleAnimation(StatesEnum.success.name);
    failController = SimpleAnimation(StatesEnum.fail.name);
    lookRightController = SimpleAnimation(StatesEnum.Look_down_right.name);
    lookLeftController = SimpleAnimation(StatesEnum.Look_down_left.name);
    failController = SimpleAnimation(StatesEnum.fail.name);
    lookIdleController = SimpleAnimation(StatesEnum.idle.name);
    loadRive();
    changePasswordFoucsNode();
    super.initState();
  }

  Future<void> loadRive() async {
    final file = await RiveFile.asset('assets/animated_login_screen.riv');
    final artboard = file.mainArtboard;
    artboard.addController(lookIdleController);
    setState(() {
      riveArtboard = artboard;
    });
  }

  void changePasswordFoucsNode() {
    passwordFoucsNode.addListener(
      () {
        if (passwordFoucsNode.hasFocus) {
          addSpaceficController(handsUpController);
        } else if (!passwordFoucsNode.hasFocus) {
          addSpaceficController(handsDownController);
        }
      },
    );
  }

  void validateEmailAndPassword() {
    Future.delayed(Duration(milliseconds: 500), () {
      if (fromKey.currentState!.validate()) {
        addSpaceficController(successController);
      } else {
        addSpaceficController(failController);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              riveArtboard == null
                  ? SizedBox.shrink()
                  : SizedBox(
                      height: 300,
                      child: Rive(artboard: riveArtboard!),
                    ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  if (value.length < 16 && value.isNotEmpty && !isLookingLeft) {
                    addSpaceficController(lookLeftController);
                  } else if (value.length > 16 &&
                      value.isNotEmpty &&
                      !isLookingRight) {
                    addSpaceficController(lookRightController);
                  }
                },
                validator: (value) {
                  return value != trueEmail ? 'worng email' : null;
                },
                decoration: InputDecoration(
                  label: Text('Email'),
                  labelStyle: TextStyle(fontSize: 14, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                focusNode: passwordFoucsNode,
                validator: (value) {
                  return value != password ? 'worng password' : null;
                },
                decoration: InputDecoration(
                  label: Text('Password'),
                  labelStyle: TextStyle(fontSize: 14, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 400,
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    passwordFoucsNode.unfocus();
                    validateEmailAndPassword();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
