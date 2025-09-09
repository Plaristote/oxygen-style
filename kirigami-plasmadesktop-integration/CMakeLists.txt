set(oxygenkirigamiplatform_SRCS
    animationspeedprovider.cpp
    plasmadesktoptheme.cpp
    kirigamiplasmafactory.cpp
    plasmadesktopunits.cpp
)

add_library(oxygenkirigamiplatform MODULE ${oxygenkirigamiplatform_SRCS})

set_target_properties(oxygenkirigamiplatform PROPERTIES
    OUTPUT_NAME org.kde.oxygen
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/platform_build"
)

target_link_libraries(oxygenkirigamiplatform
    PUBLIC
        Qt6::Core
        KF6::KirigamiPlatform
    PRIVATE
        Qt6::DBus
        Qt6::Qml
        Qt6::Quick
        KF6::ConfigCore
        KF6::ColorScheme
        KF6::IconThemes
)

if(WIN32)
    target_link_libraries(oxygenkirigamiplatform PRIVATE user32)
endif()

install(TARGETS oxygenkirigamiplatform DESTINATION ${KDE_INSTALL_PLUGINDIR}/kf6/kirigami/platform)
