/// 打包发布
///
/// 版本号
///     1.定义在pubspec.yaml中
///     2.version: 1.0.0+1（versionName+versionCode）
///
/// 打包
///     1.APK
///       * Android Application Package
///       * 可直接使用APK文件安装
///       * flutter build apk（flutter build 默认带有 --release 参数）
///     2.AAB
///       * Android Application Bundle
///       * Google推出的一种新的上传格式
///       * 会根据打包的 AAB 文件，动态生成设备需要的APK文件
///       * flutter build appbundle
main() {}
