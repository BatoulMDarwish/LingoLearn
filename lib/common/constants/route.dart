abstract class EndPoints {
  EndPoints._();

  static const baseUrl = "https://lingolearn.somee.com/api/Mobile/";
  static const addres = "https://lingolearn.somee.com/";
static const auth=_Auth();
}


class _Auth{
  const _Auth();
  final login='Student/LogIn';
  final register='Student/Create';
}

