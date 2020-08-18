package com.scomarlf

import com.scomarlf.bot.IndexBot
import com.scomarlf.conf.Bot
import com.scomarlf.conf.Database
import org.apache.commons.io.FileUtils
import org.json.JSONObject
import org.telegram.telegrambots.ApiContextInitializer
import org.telegram.telegrambots.bots.DefaultBotOptions
import org.telegram.telegrambots.meta.ApiContext
import org.telegram.telegrambots.meta.TelegramBotsApi
import org.telegram.telegrambots.meta.exceptions.TelegramApiException
import java.io.File

fun main(args: Array<String>) {
    val readStatus = readConf()
    if (readStatus)
        botStart()
}

/**
 * get bot config
 */
fun readConf(): Boolean {
    try {
        val file = File("conf.json")
        val content = FileUtils.readFileToString(file, "UTF-8")
        val jsonObject = JSONObject(content)
        // bot 配置
        val botConfObj = jsonObject.get("bot") as JSONObject
        Bot.TOKEN = botConfObj.get("bot_token") as String
        Bot.USERNAME = botConfObj.get("bot_username") as String
        Bot.CREATER = botConfObj.get("creater") as Int
        // 数据库配置
        val databaseConfObj = jsonObject.get("database") as JSONObject
        Database.URL = databaseConfObj.get("url") as String
        Database.USERNAME = databaseConfObj.get("username") as String
        Database.PASSWORD = databaseConfObj.get("password") as String
        return true
    } catch (e: Exception) {
        e.printStackTrace()
        return false
    }
}

/**
 * start bot application
 */
fun botStart() {
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

