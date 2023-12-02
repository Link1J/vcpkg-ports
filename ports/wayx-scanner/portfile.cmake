if(VCPKG_CROSSCOMPILING)
	# make FATAL_ERROR in CI when issue #16773 fixed
	message(WARNING "vcpkg-cmake is a host-only port; please mark it as a host port in your dependencies.")
endif()

vcpkg_from_git(
	OUT_SOURCE_PATH SOURCE_PATH
	URL https://git.link1j.me/link1j/wayx-scanner.git
	REF 90365541752f60de7c4e8342d828d791ea5cd634
	HEAD_REF master
	PATCHES deps.patch cli11.patch
)
vcpkg_configure_cmake(
	SOURCE_PATH ${SOURCE_PATH}
	PREFER_NINJA
)
vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/wayx-scanner)

vcpkg_copy_tools(TOOL_NAMES wayx-scanner AUTO_CLEAN)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug" "${CURRENT_PACKAGES_DIR}/lib")

file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/wayx-scanner RENAME copyright)

vcpkg_fixup_pkgconfig()