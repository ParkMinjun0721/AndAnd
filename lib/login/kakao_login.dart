import 'package:flutter/material.dart';
import 'package:andand/main.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter with Kakao login"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _profile(),
              _nickName(),
              _loginButton(),
            ],
          ),
        ));
  }

  Widget _profile() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child:
        Consumer<UserController>(builder: (context, controller, child) {
          // 사용자의 프로필 사진 가져오기
          final String? src = controller.user?.properties?["profile_image"];
          if (src != null) {
            return Image.network(src, fit: BoxFit.cover);
          } else {
            return Container(
              color: Colors.black,
            );
          }
        }),
      ),
    ),
  );

  Widget _nickName() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Consumer<UserController>(builder: (context, controller, child) {
      // 사용자의 닉네임 가져오기
      final String? name = controller.user?.properties?["nickname"];
      if (name != null) {
        return Text(name);
      } else {
        return const Text("로그인이 필요합니다");
      }
    }),
  );

  Widget _loginButton() => Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      // 카카오 로그인을 위한 메소드
        onTap: context.read<UserController>().kakaoLogin,
        child: Image.asset("assets/login_kakaotalk.png")),
  );
}

class UserController with ChangeNotifier {
  User? _user;
  KakaoLoginApi kakaoLoginApi;

  User? get user => _user;

  UserController({required this.kakaoLoginApi});

  Future<void> kakaoLogin() async {
    try {
      _user = await kakaoLoginApi.signWithKakao();
      notifyListeners();
      print("로그인성공");
    } catch (error) {
      print('로그인 실패: $error');
      print(await KakaoSdk.origin);
    }
  }
}

class KakaoLoginApi {
  Future<User?> signWithKakao() async {
    final UserApi api = UserApi.instance;
    try {
      if (await isKakaoTalkInstalled()) {
        await api.loginWithKakaoTalk();
      } else {
        await api.loginWithKakaoAccount();
      }
      return await api.me();
    } catch (error) {
      // 예외 처리 로직을 여기에 추가하면 됩니다.
      print('로그인 과정에서 오류 발생: $error');
      throw error;
    }
  }
}