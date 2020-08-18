package com.scomarlf.bot.handles

import com.scomarlf.generated.tables.Record.RECORD
import com.scomarlf.utils.HikariManager
import org.jooq.Record
import org.jooq.Result
import org.telegram.abilitybots.api.sender.MessageSender
import org.telegram.telegrambots.meta.api.methods.send.SendMessage
import org.telegram.telegrambots.meta.api.objects.Update


class MainResponseHandles(sender: MessageSender?) {
    var sender: MessageSender? = null;

    init {
        this.sender = sender
    }

    fun helloWorld(update: Update) {
        val sendMsg = SendMessage()
        sendMsg.chatId = update.message.from.id.toString();
        sendMsg.text = "hello world";
        sender?.execute(sendMsg);
    }

    fun test() {
        val create = HikariManager.getDSLContext()
        try {

            val result: Result<Record> = create.select().from(RECORD).fetch()
            println(result.size)

        } catch (e: Exception) {
            e.printStackTrace()
        } finally {
            create.close()
        }
    }

}