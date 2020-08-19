package com.scomarlf.bot.utils

interface Command {
    companion object {
        // public command
        const val START = "/start"
        const val LIST = "/list"
        const val ENROLL = "/enroll"
        const val HELP = "/help"
        const val CANCEL = "/cancel"

        // manage command
        const val ADMIN = "/admin"
        const val DAILY = "/daily"

        // link command
        // make a group to approve the enroll request
        const val APPROVE_INIT = "/approve"
        // after the enroll is passed, the announcement will be posted to the channel
        const val BULLETIN_INIT = "/bulletin"
    }
}
