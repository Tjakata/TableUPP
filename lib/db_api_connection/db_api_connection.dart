class API {
  static const hostConnection = "http://192.168.116.245/tableupp_api";
  static const hostConnectionUser = "$hostConnection/user";

  //user signUp
  static const signUp = "$hostConnection/user/signup.php";

  // user login
  static const login = "$hostConnection/user/login.php";

  //
  static const validateEmail = "$hostConnection/user/validate_email.php";

  //get tables
  static const getDinnerTables = "$hostConnection/tables/dinner_tables.php";

  //check profile
  static const checkProfile = "$hostConnection/user/check_profile.php";
}