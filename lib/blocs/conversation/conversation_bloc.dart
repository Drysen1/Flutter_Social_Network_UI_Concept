import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_state.dart';
import 'package:flutter_social_network_ui_concept/models/conversationReplyModel.dart';
import 'package:flutter_social_network_ui_concept/repository/conversationRepository.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState>{
  ConversationBloc() : super(ConversationInitialState());

  @override
  Stream<ConversationState> mapEventToState(ConversationEvent event) async* {
    if(event is LoadConversationRepliesEvent){
      yield* _mapLoadConversationEventToState(event);
    } else if(event is SendMessageEvent){
      yield* _mapSendMessageEventToState(event);
    }
  }

  Stream<ConversationState> _mapLoadConversationEventToState(LoadConversationRepliesEvent event) async*{
    yield ConversationLoadingState();
    var conversationReplies = _getConversationRepliesById(event.conversationId);
    yield ConversationLoadedState(conversationReplies);
  }

  Stream<ConversationState> _mapSendMessageEventToState(SendMessageEvent event) async*{
    //Here we would send message.
    yield MessageSentState();
  }

  List<ConversationReplyModel> _getConversationRepliesById(int conversationId){
    var conversationRepository = ConversationRepository();
    return conversationRepository.getConversationReplies(conversationId);
  }

}