class Env {
  Env(this.baseUrl);

  final String baseUrl;
}

mixin EnvValue {
  static final Env development = Env('https://booksdemo.herokuapp.com');
  static final Env staging = Env('https://booksdemo.herokuapp.com');
  static final Env production = Env('https://booksdemo.herokuapp.com');
}
