vcpkg_from_github(
	OUT_SOURCE_PATH SOURCE_PATH
	REPO Link1J/ljh
	REF bf15118b2f6b7878414ffebd8a703ce4e49c2b8b
	SHA512 69c5faf7686b89933a2989a8034ca1e9ca089f59f156788cf02f9ae5db5b209b3d0278f9299e8e54e8d65adeb0117c3b2b98ba648b3171389ead1454acec4ce1
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