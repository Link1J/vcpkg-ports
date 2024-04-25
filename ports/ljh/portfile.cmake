vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Link1J/ljh
	REF 2328a8f88e825b9b41e6e4c8f2e3f16965f95152
	SHA512 da95ac621bfe8a9dcb619c3788eef14c2eabcc5d2cd1daa2d59043b92c864a6443be3cbf2d25e15bea5f48e5dd76dc067c7b4fe3034ec219bcbfc77a2a0b6e91
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