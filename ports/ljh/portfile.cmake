vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Link1J/ljh
	REF 0048b4624dc44c0924fb2a32643cbc588a952cb2
	SHA512 51b686d3d9d5acd2be28635fff7e9fa598b03eb3df1ede49ac56bcf1072d88fdad381bbbd74640da338a2dc383536ccda405b643f8001ec654fd633514657104
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