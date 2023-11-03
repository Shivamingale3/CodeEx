import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : LoginWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: 'cindex',
          path: '/cindex',
          builder: (context, params) => CindexWidget(),
        ),
        FFRoute(
          name: 'cterminal',
          path: '/cterminal',
          builder: (context, params) => CterminalWidget(),
        ),
        FFRoute(
          name: 'about',
          path: '/about',
          builder: (context, params) => AboutWidget(),
        ),
        FFRoute(
          name: 'appinfo',
          path: '/appinfo',
          builder: (context, params) => AppinfoWidget(),
        ),
        FFRoute(
          name: 'python1keywords',
          path: '/python1keywords',
          builder: (context, params) => Python1keywordsWidget(),
        ),
        FFRoute(
          name: 'c0intro',
          path: '/c0intro',
          builder: (context, params) => C0introWidget(),
        ),
        FFRoute(
          name: 'c1first',
          path: '/c1first',
          builder: (context, params) => C1firstWidget(),
        ),
        FFRoute(
          name: 'c2comments',
          path: '/c2comments',
          builder: (context, params) => C2commentsWidget(),
        ),
        FFRoute(
          name: 'c3keywords',
          path: '/c3keywords',
          builder: (context, params) => C3keywordsWidget(),
        ),
        FFRoute(
          name: 'c4variables',
          path: '/c4variables',
          builder: (context, params) => C4variablesWidget(),
        ),
        FFRoute(
          name: 'c5constants',
          path: '/c5constants',
          builder: (context, params) => C5constantsWidget(),
        ),
        FFRoute(
          name: 'c6datatypes',
          path: '/c6datatypes',
          builder: (context, params) => C6datatypesWidget(),
        ),
        FFRoute(
          name: 'c7inout',
          path: '/c7inout',
          builder: (context, params) => C7inoutWidget(),
        ),
        FFRoute(
          name: 'c8operators',
          path: '/c8operators',
          builder: (context, params) => C8operatorsWidget(),
        ),
        FFRoute(
          name: 'c9arrays',
          path: '/c9arrays',
          builder: (context, params) => C9arraysWidget(),
        ),
        FFRoute(
          name: 'c10conditions',
          path: '/c10conditions',
          builder: (context, params) => C10conditionsWidget(),
        ),
        FFRoute(
          name: 'c11Strings',
          path: '/c11Strings',
          builder: (context, params) => C11StringsWidget(),
        ),
        FFRoute(
          name: 'cpp_index',
          path: '/cppIndex',
          builder: (context, params) => CppIndexWidget(),
        ),
        FFRoute(
          name: 'python_index',
          path: '/pythonIndex',
          builder: (context, params) => PythonIndexWidget(),
        ),
        FFRoute(
          name: 'java_index',
          path: '/javaIndex',
          builder: (context, params) => JavaIndexWidget(),
        ),
        FFRoute(
          name: 'cpp0intro',
          path: '/cpp0intro',
          builder: (context, params) => Cpp0introWidget(),
        ),
        FFRoute(
          name: 'cpp1first',
          path: '/cpp1first',
          builder: (context, params) => Cpp1firstWidget(),
        ),
        FFRoute(
          name: 'cpp2comments',
          path: '/cpp2comments',
          builder: (context, params) => Cpp2commentsWidget(),
        ),
        FFRoute(
          name: 'cpp3keywords',
          path: '/cpp3keywords',
          builder: (context, params) => Cpp3keywordsWidget(),
        ),
        FFRoute(
          name: 'cpp4variables',
          path: '/cpp4variables',
          builder: (context, params) => Cpp4variablesWidget(),
        ),
        FFRoute(
          name: 'cpp5datatypes',
          path: '/cpp5datatypes',
          builder: (context, params) => Cpp5datatypesWidget(),
        ),
        FFRoute(
          name: 'cpp6inout',
          path: '/cpp6inout',
          builder: (context, params) => Cpp6inoutWidget(),
        ),
        FFRoute(
          name: 'cpp7operators',
          path: '/cpp7operators',
          builder: (context, params) => Cpp7operatorsWidget(),
        ),
        FFRoute(
          name: 'cpp8decision',
          path: '/cpp8decision',
          builder: (context, params) => Cpp8decisionWidget(),
        ),
        FFRoute(
          name: 'cpp9arrays',
          path: '/cpp9arrays',
          builder: (context, params) => Cpp9arraysWidget(),
        ),
        FFRoute(
          name: 'cpp10strings',
          path: '/cpp10strings',
          builder: (context, params) => Cpp10stringsWidget(),
        ),
        FFRoute(
          name: 'java0intro',
          path: '/java0intro',
          builder: (context, params) => Java0introWidget(),
        ),
        FFRoute(
          name: 'java1first',
          path: '/java1first',
          builder: (context, params) => Java1firstWidget(),
        ),
        FFRoute(
          name: 'java2datatypes',
          path: '/java2datatypes',
          builder: (context, params) => Java2datatypesWidget(),
        ),
        FFRoute(
          name: 'java3operators',
          path: '/java3operators',
          builder: (context, params) => Java3operatorsWidget(),
        ),
        FFRoute(
          name: 'java4variables',
          path: '/java4variables',
          builder: (context, params) => Java4variablesWidget(),
        ),
        FFRoute(
          name: 'java5input',
          path: '/java5input',
          builder: (context, params) => Java5inputWidget(),
        ),
        FFRoute(
          name: 'java6output',
          path: '/java6output',
          builder: (context, params) => Java6outputWidget(),
        ),
        FFRoute(
          name: 'java7decision',
          path: '/java7decision',
          builder: (context, params) => Java7decisionWidget(),
        ),
        FFRoute(
          name: 'java8optypes',
          path: '/java8optypes',
          builder: (context, params) => Java8optypesWidget(),
        ),
        FFRoute(
          name: 'java9strings',
          path: '/java9strings',
          builder: (context, params) => Java9stringsWidget(),
        ),
        FFRoute(
          name: 'java10arrays',
          path: '/java10arrays',
          builder: (context, params) => Java10arraysWidget(),
        ),
        FFRoute(
          name: 'python0intro',
          path: '/python0intro',
          builder: (context, params) => Python0introWidget(),
        ),
        FFRoute(
          name: 'python2namespace',
          path: '/python2namespace',
          builder: (context, params) => Python2namespaceWidget(),
        ),
        FFRoute(
          name: 'python3indentation',
          path: '/python3indentation',
          builder: (context, params) => Python3indentationWidget(),
        ),
        FFRoute(
          name: 'python4input',
          path: '/python4input',
          builder: (context, params) => Python4inputWidget(),
        ),
        FFRoute(
          name: 'python5printing',
          path: '/python5printing',
          builder: (context, params) => Python5printingWidget(),
        ),
        FFRoute(
          name: 'python6operators',
          path: '/python6operators',
          builder: (context, params) => Python6operatorsWidget(),
        ),
        FFRoute(
          name: 'python7datatype',
          path: '/python7datatype',
          builder: (context, params) => Python7datatypeWidget(),
        ),
        FFRoute(
          name: 'python8string',
          path: '/python8string',
          builder: (context, params) => Python8stringWidget(),
        ),
        FFRoute(
          name: 'python9ifelse',
          path: '/python9ifelse',
          builder: (context, params) => Python9ifelseWidget(),
        ),
        FFRoute(
          name: 'python10functions',
          path: '/python10functions',
          builder: (context, params) => Python10functionsWidget(),
        ),
        FFRoute(
          name: 'feedback',
          path: '/feedback',
          builder: (context, params) => FeedbackWidget(),
        ),
        FFRoute(
          name: 'cppterminal',
          path: '/cppterminal',
          builder: (context, params) => CppterminalWidget(),
        ),
        FFRoute(
          name: 'javaterminal',
          path: '/javaterminal',
          builder: (context, params) => JavaterminalWidget(),
        ),
        FFRoute(
          name: 'pythonterminal',
          path: '/pythonterminal',
          builder: (context, params) => PythonterminalWidget(),
        ),
        FFRoute(
          name: 'changelogs',
          path: '/changelogs',
          builder: (context, params) => ChangelogsWidget(),
        ),
        FFRoute(
          name: 'usage',
          path: '/usage',
          builder: (context, params) => UsageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primary,
                  child: Image.asset(
                    'assets/images/CodeEx.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
