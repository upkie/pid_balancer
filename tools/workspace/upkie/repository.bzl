# -*- python -*-
#
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def upkie_repository(version="5.1.0"):
    """
    Clone repository from GitHub and make its targets available for binding.
    """
    http_archive(
        name = "upkie",
        sha256 = "016e684d1978ac0c6e8151de97b8def0f72b7b7284fd4b9553a5848298f242be",
        strip_prefix = "upkie-{}".format(version),
        url = "https://github.com/upkie/upkie/archive/refs/tags/v{}.tar.gz".format(version),
    )
