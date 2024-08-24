import telebot
import os

from pathlib import Path

from picamera2 import Picamera2, Preview

picam2 = Picamera2()

with open(Path.home() / ".token" , 'r') as content_file:
    content = content_file.read().strip("\n")

bot = telebot.TeleBot(content)

@bot.message_handler(commands=['start'])
def start(message):
    bot.reply_to(message, "Привет! Это бот палочников Гены.")

@bot.message_handler(commands=['pic'])
def take_pic(message):
    picfile = "bot_photo.jpg"
    picam2.start()
    picam2.capture_file(picfile)
    photo = open(picfile,'rb')
    bot.send_photo(message.chat.id, photo)
    photo.close()

bot.infinity_polling(none_stop=True)

