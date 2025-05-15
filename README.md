# PID balancer

[![upkie](https://img.shields.io/badge/upkie-5.1.0-cyan)](https://github.com/upkie/upkie/tree/v5.1.0)

The PID balancer is a baseline agent designed to test new Upkies with minimum dependencies. Try it out as follows:

```console
./run_pid_balancer.sh
```

The agent balances the robot by PI feedback from torso-pitch and ground-position to wheel velocities (`WheelController`), keeping the legs' hip and knee joints straight (`ServoController`). The wheel controller adds a feedforward [non-minimum phase trick](https://github.com/upkie/pid_balancer/blob/75c6d8080e7f723171e172e7ec62983e09c76037/pid_balancer/wheel_controller.py#L433-L456) for smoother transitions from standing to rolling.

## Non-minimum phase trick

As per control theory's book, the proper feedforward velocity should be `+self.target_ground_velocity` as computed from joystick inputs. However, it is with resolute purpose that we send `-self.target_ground_velocity` at [this line](https://github.com/upkie/pid_balancer/blob/75c6d8080e7f723171e172e7ec62983e09c76037/pid_balancer/wheel_controller.py#L457) instead!

This hack is not purely out of a spirit of contradiction. Changing velocity in a [wheeled inverted pendulum](https://scaron.info/robotics/wheeled-inverted-pendulum-model.html) model is a non-minimum phase behavior (to accelerate forward, the ZMP to move backward at first, then forward), and our feedback can't realize that (it only takes care of balancing around a stationary velocity).

What's left? The integrator of our controller! If we send the opposite of the target velocity (or only a fraction of it, although 100% seems to do a good job), the Upkie will immediately start executing the desired non-minimum phase behavior. The error will then grow and the integrator catch up so that `upkie_trick_velocity - self.integral_error_velocity` converges to its proper steady state value (the same value `0 - self.integral_error_velocity` would have converged to if we had no feedforward).

Unconvinced? Try this agent on an Upkie :)
