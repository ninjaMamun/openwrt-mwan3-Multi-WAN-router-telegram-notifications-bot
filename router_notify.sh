#!/bin/sh

# Replace with your own Telegram bot token
BOT_TOKEN="YOUR_BOT_TOKEN"

# Replace with your own Telegram chat ID
CHAT_ID="YOUR_CHAT_ID"

# Function to send a message to the specified Telegram chat
send_telegram_message() {
    local message=$1
    curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" -d chat_id=${CHAT_ID} -d text="${message}" > /dev/null
}

# Function to map interface and device names to custom names
get_custom_name() {
    case "${INTERFACE}" in
        pppoe-wan | wan)
            echo "Razzab Mamu"  # Custom name for pppoe-wan or wan interface
            ;;
        pppoe-wanb | wanb)
            echo "ThunderLink"  # Custom name for pppoe-wanb or wanb interface
            ;;
        *)
            echo "${INTERFACE}"  # Default to the actual interface name if not specified above
            ;;
    esac
}

# Get the custom name for the interface
CUSTOM_NAME=$(get_custom_name)

# Handle different actions and send the corresponding message
case "${ACTION}" in
    ifdown)
        send_telegram_message "📡 **Router Notification** 📡━━━━━━━━━━━━━━━ ${CUSTOM_NAME} is down 🚫━━━━━━━━━━━━━━━"
        ;;
    ifup)
        send_telegram_message "📡 **Router Notification** 📡━━━━━━━━━━━━━━━ ${CUSTOM_NAME} is up 📶━━━━━━━━━━━━━━━"
        ;;
    disconnected)
        send_telegram_message "📡 **Router Notification** 📡━━━━━━━━━━━━━━━ ${CUSTOM_NAME} is disconnected ❌━━━━━━━━━━━━━━━"
        ;;
    connected)
        send_telegram_message "📡 **Router Notification** 📡━━━━━━━━━━━━━━━ ${CUSTOM_NAME} is connected 🟢━━━━━━━━━━━━━━━"
        ;;
esac
