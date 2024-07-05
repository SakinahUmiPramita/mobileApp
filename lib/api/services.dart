class AppServices {
  static String getBaseUrl() {
    return 'http://192.168.71.226:5000';
  }

  static String getLoginEndpoint() {
    return '${getBaseUrl()}/api/login';
  }

  static String getRegistEndpoint() {
    return '${getBaseUrl()}/api/register';
  }

  static String getAuthEndpoint() {
    return '${getBaseUrl()}/bearer-auth';
  }
}
