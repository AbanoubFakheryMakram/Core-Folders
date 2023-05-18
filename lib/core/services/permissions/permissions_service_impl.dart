import 'package:core_folders/app_lib.dart';

class PermissionServiceImpl implements PermissionService {

  @override
  Future<PermissionStatus> getPermissionStatus(Permission permission) async {
    return await permission.status;
  }

  @override
  Future<bool> permissionIsGranted(Permission permission) async {
    return await permission.isGranted;
  }

  @override
  Future<PermissionStatus> requestPermission(Permission permission) async {
    return await permission.request();
  }
}