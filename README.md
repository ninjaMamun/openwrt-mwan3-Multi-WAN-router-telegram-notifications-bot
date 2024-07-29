# OpenWRT Multi-WAN Router Telegram Notifications Bot

This repository contains a shell script for sending OpenWRT Multi-WAN router notifications to a Telegram bot.

## Usage

The script will automatically send notifications for the following events:
- Interface up
- Interface down
- Interface connected
- Interface disconnected

## Requirements

- OpenWRT router.
- Telegram bot token and chat ID.

## Setup

1. Create a Telegram bot using [@BotFather](https://core.telegram.org/bots#botfather) and get the bot token.
2. Get your chat ID by sending a message to your bot and using the [getUpdates](https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates) API.

## Installation

### Option 1: Using Shell Access

1. Clone the repository:
    ```sh
    git clone https://github.com/ninjaMamun/openwrt-mwan3-Multi-WAN-router-telegram-notifications-bot.git
    cd openwrt-mwan3-Multi-WAN-router-telegram-notifications-bot
    ```

2. Modify the `router_notify.sh` script:
    - Replace `BOT_TOKEN` with your Telegram bot token.
    - Replace `CHAT_ID` with your chat ID.

3. Copy the script to your OpenWRT router:
    ```sh
    scp router_notify.sh root@<router-ip>:/root/
    ```

4. Make the script executable:
    ```sh
    ssh root@<router-ip>
    chmod +x /root/router_notify.sh
    ```

5. Configure OpenWRT to use the script for interface events by editing `/etc/mwan3.user`:
    ```sh
    echo '#!/bin/sh' > /etc/mwan3.user
    echo '/root/router_notify.sh' >> /etc/mwan3.user
    chmod +x /etc/mwan3.user
    ```

### Option 2: Using LuCI Interface

1. Clone the repository:
    ```sh
    git clone https://github.com/ninjaMamun/openwrt-mwan3-Multi-WAN-router-telegram-notifications-bot.git
    cd openwrt-mwan3-Multi-WAN-router-telegram-notifications-bot
    ```

2. Modify the `router_notify.sh` script:
    - Replace `BOT_TOKEN` with your Telegram bot token.
    - Replace `CHAT_ID` with your chat ID.

3. Copy the contents of the `router_notify.sh` script to your clipboard.

4. Open the OpenWRT LuCI interface in your browser.
5. Navigate to **Network -> MultiWAN Manager -> Notify**.
6. Paste the script into the notification script section.
7. Save and apply the changes.

## Customization

You can customize the interface names by modifying the `get_custom_name` function in the `router_notify.sh` script.

