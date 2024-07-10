class DimensionGroupApiService {
  // fetch dimension groups with dimensions
  Future<ResultBrend> fetchDimensionGroupsWithDimensions({
    required String accessToken,
    required int page,
    required bool isDeleted,
    required String search,
  }) async {
    Uri uri = Uri.parse('$apiUrl/back/brends').replace(
      queryParameters: {
        'limit': '10',
        'page': '$page',
        'is_deleted': '$isDeleted',
        'search': search,
      },
    );

    try {
      http.Response response = await http.get(
        uri,
        headers: tokenHeader(accessToken),
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200 && jsonData['status']) {
        if (jsonData['brends'] == null) {
          return const ResultBrend(brends: [], error: '');
        }

        var brendsList = jsonData['brends'] as List;
        return ResultBrend(
          brends: brendsList
              .map<Brend>((propJson) => Brend.fromJson(propJson))
              .toList(),
          error: '',
        );
      }
      return const ResultBrend(brends: [], error: 'auth error');
    } catch (e) {
      rethrow;
    }
  }
}
