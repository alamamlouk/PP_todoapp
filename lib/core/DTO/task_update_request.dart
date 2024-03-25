import '../Enum/status.dart';

class TaskUpdateRequest {
  String taskId;
  Status newStatus;

  TaskUpdateRequest({
    required this.taskId,
    required this.newStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'newStatus': newStatus.toString().split('.')[1], // Use a specific representation
    };
  }

  factory TaskUpdateRequest.fromJson(Map<String, dynamic> json) {
    return TaskUpdateRequest(
      taskId: json['taskId'],
      newStatus: Status.values
          .firstWhere((status) => status.toString().split('.')[1] == json['newStatus']),
    );
  }
}
