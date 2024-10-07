abstract class SearchEvent {}

class SearchProductEvent extends SearchEvent {
  final String searchName;
  SearchProductEvent({required this.searchName});
}