import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import 'package:date_range_picker_marketplace_library_h3b4w8/index.dart'
    as $date_range_picker_marketplace_library_h3b4w8;

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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

GoRouter createRouter(AppStateNotifier appStateNotifier) {
  $date_range_picker_marketplace_library_h3b4w8.initializeRoutes(
    homePageWidgetName: 'date_range_picker_marketplace_library_h3b4w8.HomePage',
  );

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    refreshListenable: appStateNotifier,
    navigatorKey: appNavigatorKey,
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
        name: LoginWidget.routeName,
        path: LoginWidget.routePath,
        builder: (context, params) => LoginWidget(),
      ),
      FFRoute(
        name: HomeWidget.routeName,
        path: HomeWidget.routePath,
        builder: (context, params) => HomeWidget(),
      ),
      FFRoute(
        name: CartUsersWidget.routeName,
        path: CartUsersWidget.routePath,
        builder: (context, params) => CartUsersWidget(),
      ),
      FFRoute(
        name: ItemDetailsWidget.routeName,
        path: ItemDetailsWidget.routePath,
        builder: (context, params) => ItemDetailsWidget(
          itemdetail: params.getParam(
            'itemdetail',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['menu'],
          ),
          itemvalue: params.getParam(
            'itemvalue',
            ParamType.double,
          ),
        ),
      ),
      FFRoute(
        name: ItemCategoryWidget.routeName,
        path: ItemCategoryWidget.routePath,
        builder: (context, params) => ItemCategoryWidget(
          category: params.getParam(
            'category',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['category'],
          ),
        ),
      ),
      FFRoute(
        name: PaymentUserWidget.routeName,
        path: PaymentUserWidget.routePath,
        builder: (context, params) => PaymentUserWidget(),
      ),
      FFRoute(
        name: RoomWidget.routeName,
        path: RoomWidget.routePath,
        builder: (context, params) => RoomWidget(
          idOrder: params.getParam(
            'idOrder',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['order'],
          ),
        ),
      ),
      FFRoute(
        name: OrderDoneWidget.routeName,
        path: OrderDoneWidget.routePath,
        builder: (context, params) => OrderDoneWidget(
          orderRegisterID: params.getParam(
            'orderRegisterID',
            ParamType.DocumentReference,
            isList: false,
            collectionNamePath: ['order'],
          ),
        ),
      ),
      FFRoute(
        name: MyordersWidget.routeName,
        path: MyordersWidget.routePath,
        builder: (context, params) => MyordersWidget(),
      ),
      FFRoute(
        name: FaqpageWidget.routeName,
        path: FaqpageWidget.routePath,
        builder: (context, params) => FaqpageWidget(),
      ),
      FFRoute(
        name: MenuWidget.routeName,
        path: MenuWidget.routePath,
        builder: (context, params) => MenuWidget(),
      ),
      FFRoute(
        name: GalleryHomeWidget.routeName,
        path: GalleryHomeWidget.routePath,
        builder: (context, params) => GalleryHomeWidget(),
      ),
      FFRoute(
        name: LocalSelectedWidget.routeName,
        path: LocalSelectedWidget.routePath,
        asyncParams: {
          'localID': getDoc(['localDunamys'], LocalDunamysRecord.fromSnapshot),
        },
        builder: (context, params) => LocalSelectedWidget(
          localID: params.getParam(
            'localID',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: MapsWidget.routeName,
        path: MapsWidget.routePath,
        builder: (context, params) => MapsWidget(),
      ),
      FFRoute(
        name: FeedbackWidget.routeName,
        path: FeedbackWidget.routePath,
        builder: (context, params) => FeedbackWidget(),
      ),
      FFRoute(
        name: AdminWidget.routeName,
        path: AdminWidget.routePath,
        builder: (context, params) => AdminWidget(),
      ),
      FFRoute(
        name: CadastroProdutoWidget.routeName,
        path: CadastroProdutoWidget.routePath,
        builder: (context, params) => CadastroProdutoWidget(),
      ),
      FFRoute(
        name: RegisterProductWidget.routeName,
        path: RegisterProductWidget.routePath,
        asyncParams: {
          'typeCategory': getDoc(['category'], CategoryRecord.fromSnapshot),
        },
        builder: (context, params) => RegisterProductWidget(
          typeCategory: params.getParam(
            'typeCategory',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: OrderClientesWidget.routeName,
        path: OrderClientesWidget.routePath,
        builder: (context, params) => OrderClientesWidget(),
      ),
      FFRoute(
        name: DetailOrderWidget.routeName,
        path: DetailOrderWidget.routePath,
        asyncParams: {
          'orderID': getDoc(['order'], OrderRecord.fromSnapshot),
        },
        builder: (context, params) => DetailOrderWidget(
          orderID: params.getParam(
            'orderID',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: FeedbackClientsWidget.routeName,
        path: FeedbackClientsWidget.routePath,
        builder: (context, params) => FeedbackClientsWidget(),
      ),
      FFRoute(
        name: RelatorioWidget.routeName,
        path: RelatorioWidget.routePath,
        builder: (context, params) => RelatorioWidget(),
      ),
      FFRoute(
        name: PerfilUserWidget.routeName,
        path: PerfilUserWidget.routePath,
        builder: (context, params) => PerfilUserWidget(),
      ),
      FFRoute(
        name: SacWidget.routeName,
        path: SacWidget.routePath,
        builder: (context, params) => SacWidget(),
      ),
      FFRoute(
        name: PagamentoPIXWidget.routeName,
        path: PagamentoPIXWidget.routePath,
        asyncParams: {
          'orderID': getDoc(['order'], OrderRecord.fromSnapshot),
        },
        builder: (context, params) => PagamentoPIXWidget(
          qrcode: params.getParam(
            'qrcode',
            ParamType.String,
          ),
          paymentID: params.getParam(
            'paymentID',
            ParamType.String,
          ),
          orderID: params.getParam(
            'orderID',
            ParamType.Document,
          ),
          valor: params.getParam(
            'valor',
            ParamType.double,
          ),
        ),
      ),
      FFRoute(
        name: CadastroCategoriaWidget.routeName,
        path: CadastroCategoriaWidget.routePath,
        builder: (context, params) => CadastroCategoriaWidget(),
      ),
      FFRoute(
        name: EditarCategoriaWidget.routeName,
        path: EditarCategoriaWidget.routePath,
        asyncParams: {
          'categoriaID': getDoc(['category'], CategoryRecord.fromSnapshot),
        },
        builder: (context, params) => EditarCategoriaWidget(
          categoriaID: params.getParam(
            'categoriaID',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: CadastrarCategoriaWidget.routeName,
        path: CadastrarCategoriaWidget.routePath,
        builder: (context, params) => CadastrarCategoriaWidget(),
      ),
      FFRoute(
        name: FaqListagemWidget.routeName,
        path: FaqListagemWidget.routePath,
        builder: (context, params) => FaqListagemWidget(),
      ),
      FFRoute(
        name: FaqEditarWidget.routeName,
        path: FaqEditarWidget.routePath,
        asyncParams: {
          'faq': getDoc(['faq'], FaqRecord.fromSnapshot),
        },
        builder: (context, params) => FaqEditarWidget(
          faq: params.getParam(
            'faq',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: FaqCriarWidget.routeName,
        path: FaqCriarWidget.routePath,
        builder: (context, params) => FaqCriarWidget(),
      ),
      FFRoute(
        name: CadastrFotosLocalPrincipalWidget.routeName,
        path: CadastrFotosLocalPrincipalWidget.routePath,
        builder: (context, params) => CadastrFotosLocalPrincipalWidget(),
      ),
      FFRoute(
        name: EstoqueItemWidget.routeName,
        path: EstoqueItemWidget.routePath,
        asyncParams: {
          'itemDoc': getDoc(['menu'], MenuRecord.fromSnapshot),
        },
        builder: (context, params) => EstoqueItemWidget(
          itemDoc: params.getParam(
            'itemDoc',
            ParamType.Document,
          ),
        ),
      ),
      FFRoute(
        name: EstoquelistWidget.routeName,
        path: EstoquelistWidget.routePath,
        builder: (context, params) => EstoquelistWidget(),
      ),
      FFRoute(
        name: $date_range_picker_marketplace_library_h3b4w8
            .HomePageWidget.routeName,
        path: $date_range_picker_marketplace_library_h3b4w8
            .HomePageWidget.routePath,
        builder: (context, params) =>
            $date_range_picker_marketplace_library_h3b4w8.HomePageWidget(),
      )
    ].map((r) => r.toRoute(appStateNotifier)).toList(),
    observers: [routeObserver],
  );
}

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
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
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
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).info,
                  child: Image.asset(
                    'assets/images/svg_width=162_height=162_viewBox=0_0_162_162_fill=none_xmlns=httpwww.w3.org2000svg_g_clip-path=url(#clip0_7_59)_path_d=M120.515_59.3518L120.401_59.1235C113.901_46.0357_100.978_35.9155_80.8279.png',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
