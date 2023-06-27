import 'UserReducer.dart';

///全局Redux store 的对象，保存State数据
class GSYState {
  ///用户信息
  User userInfo;
  ///构造方法
  GSYState({this.userInfo});

}

///通过 Reducer 创建 用于store 的 Reducer
GSYState appReducer(GSYState state, action) {
  return GSYState(
    ///通过 UserReducer 将 GSYState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),
  );
}
