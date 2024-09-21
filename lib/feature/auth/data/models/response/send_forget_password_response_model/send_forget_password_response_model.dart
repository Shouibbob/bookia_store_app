import 'data.dart';

class SendForgetPasswordResponseModel {
	Data? data;
	String? message;
	List<dynamic>? error;
	int? status;

	SendForgetPasswordResponseModel({
		this.data, 
		this.message, 
		this.error, 
		this.status, 
	});

	factory SendForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
		return SendForgetPasswordResponseModel(
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			message: json['message'] as String?,
			error: json['error'] as List<dynamic>?,
			status: json['status'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
				'message': message,
				'error': error,
				'status': status,
			};
}
