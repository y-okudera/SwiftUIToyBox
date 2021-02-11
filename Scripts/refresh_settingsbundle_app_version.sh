#!/usr/bin/env sh

APP_VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" $PRODUCT_SETTINGS_PATH)
/usr/libexec/PlistBuddy -c "Set :PreferenceSpecifiers:2:DefaultValue ${APP_VERSION}" "${PRODUCT_NAME}/Application/Resource/Settings.bundle/Root.plist"
