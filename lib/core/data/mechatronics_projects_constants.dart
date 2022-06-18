class MechatronicsProjectsConstants {
  static const List<Map<String, dynamic>> mechatronicsProjects = [
    {
      "name": "QCTIMU",
      "description":
          "Quadrotor Control by Teleoperation Using IMU is a project developed during my Mechatronics Engineering undegraduation.\nThe system consists of a Control Glove, a Decision Making Unit (Ubuntu Linux running ROS) and an Unmanned Aerial Vehicle.\nBy using it, the user is able to maneuver a drone vehicle with their hand movements.\n\nSupport: FAPESP (Process: 2016/04117-8)\nLabRom - EESC-USP",
      "projectImagesPaths": [
        "lib/core/data/mechatronics_projects/images/qctimu/1.png",
        "lib/core/data/mechatronics_projects/images/qctimu/2.png",
        "lib/core/data/mechatronics_projects/images/qctimu/3.png",
      ],
      "videosUrl":
          "https://www.youtube.com/watch?v=Fp48DxE-20k&list=PLMFvLxnk4aiLag7BGHFrbJRXZ1Vu9WAT1",
    },
    {
      "name": "Wall Climbing Autonomous Robot",
      "description":
          "This project was developed during my Mechatronics Engineering undergraduation.\nIt consists of a robot able to climb walls autonomously by a predefined distance.\nBrushless DC motors and propellers were used to prevent falling.\nEncoders were used to provide travelled distance feedback.\nA PID Control System was developed to achieve a very accurate result.",
      "projectImagesPaths": [
        "lib/core/data/mechatronics_projects/images/wall_climbing_autonomous_robot/1.png",
        "lib/core/data/mechatronics_projects/images/wall_climbing_autonomous_robot/2.png",
        "lib/core/data/mechatronics_projects/images/wall_climbing_autonomous_robot/3.png",
      ],
    },
  ];
}
