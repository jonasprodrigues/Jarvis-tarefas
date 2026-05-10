package com.jarvis

import android.app.*
import android.content.Intent
import android.os.IBinder
import android.speech.tts.TextToSpeech
import java.util.*

class JarvisService : Service(), TextToSpeech.OnInitListener {

    private lateinit var tts: TextToSpeech

    override fun onCreate() {
        super.onCreate()
        tts = TextToSpeech(this, this)
        startForeground(1, createNotification())
    }

    override fun onInit(status: Int) {
        tts.language = Locale.US
        speak("Jarvis ativo em segundo plano")
    }

    private fun speak(text: String) {
        tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, null)
    }

    private fun createNotification(): Notification {
        val channelId = "jarvis_channel"

        val channel = NotificationChannel(
            channelId,
            "Jarvis Service",
            NotificationManager.IMPORTANCE_LOW
        )

        val manager = getSystemService(NotificationManager::class.java)
        manager.createNotificationChannel(channel)

        return Notification.Builder(this, channelId)
            .setContentTitle("Jarvis ativo")
            .setContentText("Rodando em segundo plano")
            .setSmallIcon(android.R.drawable.ic_media_play)
            .build()
    }

    override fun onBind(intent: Intent?): IBinder? = null
}