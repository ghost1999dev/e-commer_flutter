//Interface
import 'package:untitled/src/domain/utils/Resource.dart';

abstract class Authrepository {
  Future<Resource> login(String email,String password);
}