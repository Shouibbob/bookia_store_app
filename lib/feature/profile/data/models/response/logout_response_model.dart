class LogoutResponseModel {
	List<dynamic>? data;
	String? message;
	List<dynamic>? error;
	int? status;

	LogoutResponseModel({this.data, this.message, this.error, this.status});

	factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
		return LogoutResponseModel(
			data: json['data'] as List<dynamic>?,
			message: json['message'] as String?,
			error: json['error'] as List<dynamic>?,
			status: json['status'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data,
				'message': message,
				'error': error,
				'status': status,
			};
}
