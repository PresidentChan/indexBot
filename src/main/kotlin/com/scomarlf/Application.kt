package com.scomarlf

import com.scomarlf.bot.IndexBot
import com.scomarlf.conf.BotConf
import com.scomarlf.conf.DatabaseConf
import com.scomarlf.utils.HikariManager
import org.apache.commons.io.FileUtils
import org.json.JSONObject
import org.telegram.telegrambots.ApiContextInitializer
import org.telegram.telegrambots.bots.DefaultBotOptions
import org.telegram.telegrambots.meta.ApiContext
import org.telegram.telegrambots.meta.TelegramBotsApi
import org.telegram.telegrambots.meta.exceptions.TelegramApiException
import java.io.File

fun main(args: Array<String>) {
    // read config file
    val readStatus = readConf()
    if (readStatus){
        //create database connection
        HikariManager.createConnection()
        // start bot
        botStart()
    }
}

/**
 * get bot config
 */
fun readConf(): Boolean {
    try {
        val file = File("conf.json")
        val content = FileUtils.readFileToString(file, "UTF-8")
        val jsonObject = JSONObject(content)
        // for bot
        val botConfObj = jsonObject.get("bot") as JSONObject
        BotConf.TOKEN = botConfObj.get("bot_token") as String
        BotConf.USERNAME = botConfObj.get("bot_username") as String
        BotConf.CREATER = botConfObj.get("creater") as Int
        // for database
        val databaseConfObj = jsonObject.get("database") as JSONObject
        DatabaseConf.URL = databaseConfObj.get("url") as String
        DatabaseConf.USERNAME = databaseConfObj.get("username") as String
        DatabaseConf.PASSWORD = databaseConfObj.get("password") as String
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

