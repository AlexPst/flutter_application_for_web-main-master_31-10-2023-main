import 'dart:io';
import 'package:televerse/telegram.dart';
import 'package:televerse/televerse.dart';



const String token = "6622522645:AAEzQznIXLr-gFT3pVT5LK8Zlsuthbr8Mzk";
 final Bot bot = Bot(token);
Conversation conversation = Conversation(bot);
var startButton = InlineMenu(name: "Start").text("Start", letCommand);
var starButt = Keyboard();
String someText='';

void startBot(String text){
  someText = text;
  bot.start(welcomeHandler);
}

Future<void> welcomeHandler(MessageContext ctx) async {
  // Reply a greeting
  ctx.reply(someText);
  await ctx.reply("Welcome to Televerse Conversation!");
  await ctx.reply("What is your name?");

  // ✨ The magic happens here ✨
  // We can wait for the user's reply using the `waitForTextMessage` method.
  var nameCtx = await conversation.waitForTextMessage(chatId: ctx.id);
  if(nameCtx.message.text == "Alex")
  {
    await ctx.reply("Hello, Alex");
  }
  else
  {
    await ctx.reply("I dont know you!");
  }
  
  // Reply with the user's name
  //await ctx.reply("Hello, ${nameCtx.message.text}!");
}

void letCommand(CallbackQueryContext ctx)
{
  ctx.editMessage("Hello");
}
