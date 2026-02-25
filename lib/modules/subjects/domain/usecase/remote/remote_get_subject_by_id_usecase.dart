// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:injectable/injectable.dart';
// import 'package:joinmeerkat/common/common.dart';
// import 'package:joinmeerkat/modules/message/message.dart';

// @injectable
// class RemoteGetChatByIdUsecase
//     extends UseCase<MessageEntity, RemoteGetChatByIdParams> {
//   final RemoteChatMessageRepository _repo;
//   RemoteGetChatByIdUsecase(this._repo);

//   @override
//   FutureOr<MessageEntity> execute(RemoteGetChatByIdParams params) {
//     return _repo.getChatById(chatId: params.chatId);
//   }
// }

// class RemoteGetChatByIdParams extends Equatable {
//   final String chatId;
//   const RemoteGetChatByIdParams({required this.chatId});

//   @override
//   List<Object?> get props => [chatId];
// }
