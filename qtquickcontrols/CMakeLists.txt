include(ECMSetupVersion)
include(ECMGenerateHeaders)
include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)
include(KDEClangFormat)
include(KDEGitCommitHooks)
include(ECMQmlModule)

# Brige liboxygen and QML
ecm_add_qml_module(qqc2oxygenstyleplugin
  URI org.kde.qqc2oxygenstyle.private
  GENERATE_PLUGIN_SOURCE
  DEPENDENCIES
  QtQuick
)

target_sources(qqc2oxygenstyleplugin PRIVATE
    helper.cpp
    gradientbackground.cpp
)

target_link_libraries(qqc2oxygenstyleplugin PRIVATE
    Qt${QT_MAJOR_VERSION}::Core
    Qt${QT_MAJOR_VERSION}::Qml
    Qt${QT_MAJOR_VERSION}::Quick
    Qt${QT_MAJOR_VERSION}::Gui
    Qt${QT_MAJOR_VERSION}::Widgets
    KF${QT_MAJOR_VERSION}::ConfigCore
    KF${QT_MAJOR_VERSION}::GuiAddons
    oxygenstyle${QT_MAJOR_VERSION}
)

ecm_finalize_qml_module(qqc2oxygenstyleplugin)


# QML Style plugin
ecm_add_qml_module(OxygenStyle URI "org.kde.oxygen"
    GENERATE_PLUGIN_SOURCE
    DESIGNER_SUPPORTED
    DEPENDENCIES
    "QtQuick.Controls"
    "QtQuick.Window"
    "org.kde.desktop"
    "org.kde.qqc2oxygenstyle.private"
)

ecm_target_qml_sources(OxygenStyle SOURCES
    ApplicationWindow.qml
    Button.qml
    CheckBox.qml
    CheckDelegate.qml
    ComboBox.qml
    Control.qml
    DelayButton.qml
    Dial.qml
    Dialog.qml
    DialogButtonBox.qml
    Drawer.qml
    Frame.qml
    GroupBox.qml
    HorizontalHeaderView.qml
    ItemDelegate.qml
    Label.qml
    Menu.qml
    MenuBar.qml
    MenuBarItem.qml
    MenuItem.qml
    MenuSeparator.qml
    Page.qml
    PageIndicator.qml
    Pane.qml
    Popup.qml
    ProgressBar.qml
    RadioButton.qml
    RadioDelegate.qml
    RangeSlider.qml
    RoundButton.qml
    ScrollBar.qml
    ScrollView.qml
    Slider.qml
    SpinBox.qml
    StackView.qml
    SwipeDelegate.qml
    Switch.qml
    SwitchDelegate.qml
    TabBar.qml
    TabButton.qml
    TextArea.qml
    TextField.qml
    ToolBar.qml
    ToolButton.qml
    ToolSeparator.qml
    ToolTip.qml
    TreeViewDelegate.qml
    VerticalHeaderView.qml

    GradientBackground.qml
    MenuItemBackground.qml
)

if (NOT BUILD_SHARED_LIBS)
    target_link_libraries(OxygenStyle PRIVATE org.kde.oxygen)
endif()

ecm_finalize_qml_module(OxygenStyle EXPORT QQC2OxygenStyleTargets)
