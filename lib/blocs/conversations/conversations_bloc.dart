import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_state.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';
import 'package:flutter_social_network_ui_concept/repository/conversationRepository.dart';

class ConverationsBloc extends Bloc<ConversationEvent, ConversationsState>{
  ConverationsBloc() : super(ConversationsInitialState());

  @override
  Stream<ConversationsState> mapEventToState(ConversationEvent event) async* {
    if(event is LoadConversationEvent){
      yield* _mapLoadConversationEventToState();
    } 
  }

  Stream<ConversationsState> _mapLoadConversationEventToState() async*{
    yield ConversationsLoadingState();
    var conversations = _getConversations();
    yield ConversationsLoadedState(conversations);
  }

  List<ConversationModel> _getConversations(){
    var conversationRepository = ConversationRepository();
    return conversationRepository.getConversations();
  }
}