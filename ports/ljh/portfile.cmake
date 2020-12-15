vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Link1J/ljh
	REF 3646bc772acaf4b6bc009e5c1688622d131eac22
	SHA512 5c6f6e436855f52c0813487425209e20ca69efc8a4c2f46b6d7f35c06ddbeb925235d3c24cc7093bcea9d63ec8f986ec246f5d92ee7b7bcd154dff274197c3ce
	HEAD_REF master
)
vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/ljh)
file(INSTALL ${SOURCE_PATH}/LICENSE_1_0.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/ljh RENAME copyright)
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")