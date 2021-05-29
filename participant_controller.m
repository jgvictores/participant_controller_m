% Basic participant controller.

% list devices of robot.
n_devices = wb_robot_get_number_of_devices();
wb_console_print(int2str(n_devices), WB_STDOUT); % 13

% Initialize the robot
timestep = wb_robot_get_basic_time_step();

% Initialize motors
motor_left = wb_robot_get_device('wheel_left_joint');
motor_right = wb_robot_get_device('wheel_right_joint');
lidar = wb_robot_get_device('Hokuyo URG-04LX-UG01');
position = wb_robot_get_device('gps');

wb_motor_set_position(motor_left, inf);
wb_motor_set_position(motor_right, inf);
wb_motor_set_velocity(motor_left, 0);
wb_motor_set_velocity(motor_right, 0);

while wb_robot_step(timestep) ~= -1
  wb_motor_set_velocity(motor_left, 5);
  wb_motor_set_velocity(motor_right, 5);
end
