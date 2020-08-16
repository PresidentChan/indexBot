package com.scomarlf.bot.handles

import org.telegram.abilitybots.api.sender.MessageSender
import org.telegram.telegrambots.meta.api.methods.send.SendMessage
import org.telegram.telegrambots.meta.api.objects.Update

class MainResponseHandles(sender: MessageSender?) {
    var sender: MessageSender? = null;

    init{
        this.sender = sender
    }

    fun helloWorld(update: Update) {
        val sendMsg = SendMessage()
        sendMsg.chatId = update.message.from.id.toString();
        sendMsg.text = "hello world";
        sender?.execute(sendMsg);
    }

}