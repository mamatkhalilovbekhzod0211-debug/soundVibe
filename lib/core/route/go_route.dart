import 'package:go_router/go_router.dart';
import 'package:saundvibe/core/route/routes.dart';
import 'package:saundvibe/features/presentation/auth/register.dart';
import 'package:saundvibe/features/presentation/auth/register_verify.dart';
import 'package:saundvibe/features/presentation/auth/sign_in.dart';
import 'package:saundvibe/features/presentation/auth/sign_up.dart';
import 'package:saundvibe/features/presentation/home/comments.dart';
import 'package:saundvibe/features/presentation/home/home_page.dart';
import 'package:saundvibe/features/presentation/home/smile.dart';
import 'package:saundvibe/features/presentation/home/vibe.dart';
import 'package:saundvibe/features/presentation/home/tuned.dart';

class AppRoute {
  AppRoute._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.comments,
    routes: [
      GoRoute(path: Routes.home_page, name: 'home_page', builder: (context,state)=>const HomePage()),
      GoRoute(path: Routes.register, name: 'register', builder: (context, state) => const Register()),
      GoRoute(path: Routes.register_verify, name: 'register_verify', builder: (context, state) => const RegisterVerify()),
      GoRoute(path: Routes.singnIn, name: 'signin', builder: (context, state) => const SignIn()),
      GoRoute(path: Routes.signUp, name: 'signup', builder: (context, state) => const SignUp()),
      GoRoute(path: Routes.vibe, name: 'vibe', builder: (context, state) => const Tuned()),
      GoRoute(path: Routes.smile, name: 'smile', builder: (context, state) => const Smile()),
      GoRoute(path: Routes.tuned, name: 'tuned', builder: (context, state) => const Tuned()),
      GoRoute(path: Routes.comments, name: 'comments', builder: (context, state) => const Comments()),
    ],
  );
}
