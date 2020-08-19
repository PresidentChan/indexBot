package com.scomarlf.bot

import com.scomarlf.bot.handles.MainResponseHandles
import com.scomarlf.conf.BotConf
import org.telegram.abilitybots.api.bot.AbilityBot
import org.telegram.telegrambots.bots.DefaultBotOptions
import org.telegram.telegrambots.meta.api.objects.Update

class IndexBot(botOptions: DefaultBotOptions) : AbilityBot(BotConf.TOKEN, BotConf.USERNAME, botOptions) {

    var mainHandle : MainResponseHandles? = null

    init {
        println("bot start");
        mainHandle = MainResponseHandles(sender)
    }

    override fun creatorId(): Int {
        return BotConf.CREATER;
    }

    override fun onUpdateReceived(update: Update) {
        mainHandle?.helloWorld(update);
        mainHandle?.test();
    }


}