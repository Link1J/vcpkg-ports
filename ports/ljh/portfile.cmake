vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Link1J/ljh
	REF 47be1816b796cad83061fd96828f82ebf621419b
	SHA512 20be7c2e27e63570b83e42f73584447358d0dcdae6b6dac989f862104f4602fc3814f5c9d3ea40602ee09a9d8c8b437fabdeaff6d0599d67c7f3b4b79094f585
	HEAD_REF master
)
vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA
	OPTIONS
		-Dljh_BUILD_TESTS=OFF
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/ljh)
file(INSTALL ${SOURCE_PATH}/LICENSE_1_0.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/ljh RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")