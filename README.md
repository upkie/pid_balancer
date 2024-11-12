# PID balancer

[![upkie](https://img.shields.io/badge/upkie-5.1.0-cyan)](https://github.com/upkie/upkie/tree/v5.1.0)

The PID balancer is a baseline agent designed to test new Upkies with minimum dependencies. Try it out as follows:

```console
./run_pid_balancer.sh
```

The agent balances the robot by PI feedback from torso-pitch and ground-position to wheel velocities (`WheelController`), keeping the legs' hip and knee joints straight (`ServoController`). The wheel controller adds a feedforward [non-minimum phase trick](https://github.com/upkie/pid_balancer/blob/75c6d8080e7f723171e172e7ec62983e09c76037/pid_balancer/wheel_controller.py#L433-L456) for smoother transitions from standing to rolling.
