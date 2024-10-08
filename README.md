# PID balancer

The PID balancer is a baseline agent designed to test an Upkie quickly. It has minimum dependencies beyond the main `upkie` module.

## Usage

<img src="https://user-images.githubusercontent.com/1189580/170496331-e1293dd3-b50c-40ee-9c2e-f75f3096ebd8.png" height="100" align="right" />

```console
./run_pid_balancer.sh
```

## Overview

This agent balances the robot by PI feedback from torso-pitch and ground-position to wheel velocities (`WheelController`), keeping the legs' hip and knee joints straight (`ServoController`). The wheel controller adds a feedforward [non-minimum phase trick](https://github.com/upkie/upkie/blob/513fea81673f89646fdffcbad2f65ca9a0941ca6/pid_balancer/wheel_controller.py#L433-L457) for smoother transitions from standing to rolling.
