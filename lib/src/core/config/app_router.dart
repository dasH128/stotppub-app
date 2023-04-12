import 'package:go_router/go_router.dart';
import 'package:stotppub/src/core/presentacion/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/',
      name: 'signIn',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signUpClient',
      name: 'signUpClient',
      builder: (context, state) => const SignUpClientScreen(),
    ),
    GoRoute(
      path: '/signUpTransport',
      name: 'signUpTransport',
      builder: (context, state) => const SignUpTransportScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/orderClient',
      name: 'orderClient',
      builder: (context, state) => const OrderScreen(),
    ),
    GoRoute(
      path: '/orderHistoryClient',
      name: 'orderHistoryClient',
      builder: (context, state) => const OrderHistoryScreen(),
    ),
    GoRoute(
      path: '/registerTransport',
      name: 'registerTransport',
      builder: (context, state) => const RegisterTransportScreen(),
    ),
    GoRoute(
      path: '/registerVehicle',
      name: 'registerVehicle',
      builder: (context, state) => const RegisterVehicleScreen(),
    ),
    GoRoute(
      path: '/createRequest',
      name: 'createRequest',
      builder: (context, state) => const CreateRequestScreen(),
    ),
    GoRoute(
      path: '/showShipment',
      name: 'showShipment',
      builder: (context, state) => const ShowShipmentScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/route',
      name: 'route',
      builder: (context, state) => const RouteScreen(),
    ),
  ],
);
