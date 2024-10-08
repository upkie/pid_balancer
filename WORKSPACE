# -*- python -*-

workspace(name = "pid_balancer")

# Add default repositories listed in tools/workspace/
load("//tools/workspace:default.bzl", "add_default_repositories")
add_default_repositories()

# @upkie was added by add_default_repositories
load("@upkie//tools/workspace:default.bzl", add_upkie_repositories = "add_default_repositories")
add_upkie_repositories()

# @palimpsest was added by add_upkie_repositories
load("@palimpsest//tools/workspace:default.bzl", add_palimpsest_repositories = "add_default_repositories")
add_palimpsest_repositories()

# @pi3hat was added by add_upkie_repositories
load("@pi3hat//tools/workspace:default.bzl", add_pi3hat_repositories = "add_default_repositories")
add_pi3hat_repositories()

# @rpi_bazel was added by add_pi3hat_repositories
load("@rpi_bazel//tools/workspace:default.bzl", add_rpi_bazel_repositories = "add_default_repositories")
add_rpi_bazel_repositories()

# Python dependencies
# ===================
#
# Those rules are only used in //pid_balancer:bullet. They depend on
# @rules_python which is added by `add_palimpsest_repositories`.

load("//tools/workspace/pip_pid_balancer:parse_deps.bzl", "parse_deps")
parse_deps()

load("@pip_pid_balancer//:requirements.bzl", "install_deps")
install_deps()
