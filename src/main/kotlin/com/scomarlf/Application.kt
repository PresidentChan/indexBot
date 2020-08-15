package com.scomarlf

import com.scomarlf.bot.IndexBot
import org.telegram.telegrambots.ApiContextInitializer
import org.telegram.telegrambots.bots.DefaultBotOptions
import org.telegram.telegrambots.meta.ApiContext
import org.telegram.telegrambots.meta.TelegramBotsApi
import org.telegram.telegrambots.meta.exceptions.TelegramApiException

fun main(args: Array<String>) {
    // Initialize Api Context
    ApiContextInitializer.init()
    // Set up Http proxy
    val botOptions = ApiContext.getInstance(DefaultBotOptions::class.java)
    botOptions.proxyHost = "127.0.0.1"
    botOptions.proxyPort = 7890
    botOptions.proxyType = DefaultBotOptions.ProxyType.HTTP
    // Instantiate Telegram Bots API
    val botsApi = TelegramBotsApi()
    // Register bot
    try {
        // don't use proxy
//        botsApi.registerBot(IndexBot(DefaultBotOptions()))
        // use proxy
        botsApi.registerBot(IndexBot(botOptions));
    } catch (e: TelegramApiException) {
        e.printStackTrace()
    }

}

