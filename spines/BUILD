# -*- python -*-

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "bullet_spine",
    srcs = [
        "bullet_spine.cpp",
    ],
    data = [
        "@upkie_description",
    ],
    deps = [
        "@upkie//upkie/cpp/actuation:bullet_interface",
        "@upkie//upkie/cpp/model",
        "@upkie//upkie/cpp/observers",
        "@upkie//upkie/cpp/sensors",
        "@upkie//upkie/cpp/spine",
        "@upkie//upkie/cpp/utils:get_log_path",
        "@upkie//upkie/cpp:version",
    ],
)

cc_binary(
    name = "mock_spine",
    srcs = [
        "mock_spine.cpp",
    ],
    deps = [
        "@upkie//upkie/cpp/actuation:mock_interface",
        "@upkie//upkie/cpp/model",
        "@upkie//upkie/cpp/observers",
        "@upkie//upkie/cpp/sensors",
        "@upkie//upkie/cpp/spine",
        "@upkie//upkie/cpp/utils:get_log_path",
        "@upkie//upkie/cpp:version",
    ] + select({
        "//:pi64_config": [
            "@org_llvm_libcxx//:libcxx",
            "@pi3hat//lib/cpp/mjbots/pi3hat:libpi3hat",
        ],
        "//conditions:default": [],
    }),
)

cc_binary(
    name = "pi3hat_spine",
    srcs = [
        "pi3hat_spine.cpp",
    ],
    deps = [
        "@upkie//upkie/cpp/model",
        "@upkie//upkie/cpp/observers",
        "@upkie//upkie/cpp/sensors",
        "@upkie//upkie/cpp/spine",
        "@upkie//upkie/cpp/utils:get_log_path",
        "@upkie//upkie/cpp:version",
    ] + select({
        "//:pi64_config": ["@upkie//upkie/cpp/actuation:pi3hat_interface"],
        "//conditions:default": [],
    }),
    target_compatible_with = select({
        "//:pi64_config": [],
        "//conditions:default": ["@platforms//:incompatible"],
    }),
)
