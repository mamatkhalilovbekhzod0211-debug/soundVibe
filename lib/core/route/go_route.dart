import 'package:go_router/go_router.dart';
import 'package:saundvibe/core/route/routes.dart';
import 'package:saundvibe/features/presentation/auth/register.dart';
import 'package:saundvibe/features/presentation/auth/register_verify.dart';
import 'package:saundvibe/features/presentation/auth/sign_in.dart';
import 'package:saundvibe/features/presentation/auth/sign_up.dart';

class AppRoute {
  AppRoute._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.register_verify,
    routes: [
      GoRoute(path: Routes.register, name: 'register', builder: (context, state) => const Register()),
      GoRoute(path: Routes.register_verify, name: 'register_verify', builder: (context, state) => const RegisterVerify()),
      GoRoute(path: Routes.singnIn, name: 'signin', builder: (context, state) => const SignIn()),
      GoRoute(path: Routes.signUp, name: 'signup', builder: (context, state) => const SignUp()),
    ],
  );
}
