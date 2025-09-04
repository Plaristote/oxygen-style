set(org.kde.oxygen_SRCS
    animationspeedprovider.cpp
    plasmadesktoptheme.cpp
    kirigamiplasmafactory.cpp
    plasmadesktopunits.cpp

)

add_library(org.kde.oxygen MODULE ${org.kde.oxygen_SRCS})

target_link_libraries(org.kde.oxygen
    PUBLIC
        Qt6::Core
        KF6::KirigamiPlatform
    PRIVATE
        Qt6::Qml
        Qt6::Quick
        KF6::ConfigCore
        KF6::ColorScheme
        KF6::IconThemes
)

if (HAVE_DBUS)
    target_link_libraries(org.kde.oxygen
        PRIVATE
        Qt6::DBus
    )
    target_compile_definitions(org.kde.oxygen PRIVATE -DHAVE_QTDBUS=1)
else()
    target_compile_definitions(org.kde.oxygen PRIVATE -DHAVE_QTDBUS=0)
endif()

if(WIN32)
    target_link_libraries(org.kde.oxygen PRIVATE user32)
endif()

install(TARGETS org.kde.oxygen DESTINATION ${KDE_INSTALL_PLUGINDIR}/kf6/kirigami/platform)
