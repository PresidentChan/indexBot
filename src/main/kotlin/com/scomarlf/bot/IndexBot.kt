package com.scomarlf.bot

import com.scomarlf.bot.handles.MainResponseHandles
import com.scomarlf.conf.Bot
import org.telegram.abilitybots.api.bot.AbilityBot
import org.telegram.telegrambots.bots.DefaultBotOptions
import org.telegram.telegrambots.meta.api.objects.Update

class IndexBot(botOptions: DefaultBotOptions) : AbilityBot(Bot.TOKEN, Bot.USERNAME, botOptions) {

    var mainHandle : MainResponseHandles? = null

    init {
        print("bot started");

        mainHandle = MainResponseHandles(sender)
    }

    override fun creatorId(): Int {
        return Bot.CREATER;
    }

    override fun onUpdateReceived(update: Update) {
        mainHandle?.helloWorld(update);
        mainHandle?.test();
    }
}