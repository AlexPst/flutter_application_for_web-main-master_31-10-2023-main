import 'package:flutter/material.dart';

class ExperiensContainer extends StatelessWidget {
  const ExperiensContainer({
    super.key,
    required this.experience, 
    
  });

  final ExperienceInfo experience;
 

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
    border: Border.all(width: 3, color: Colors.amber),
    borderRadius: BorderRadius.circular(3),                                  
      ),
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(experience.company, style: textStyle(isBold: true)),
      SizedBox(height: 10),
      Text(experience.timeline, style: textStyle(isGray: true)),
      for(final item in experience.description) 
      Text(item, style: textStyle())
    ],
      ),
    );
  }
}

TextStyle? textStyle({var isBold, var isGray}){    
  return TextStyle( fontSize: 20,
                   height: 1.3,
                   fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
                   color: isGray ?? false ? Colors.grey: Colors.black);
}


class ExperienceInfo{
  final String company;
  final String timeline;
  final List<String> description;

  ExperienceInfo(
   {required this.company, 
   required this.description, 
   required this.timeline});
}


final experiences = [

  ExperienceInfo(
    company: "ООО Атос IT Solution", 
    timeline: "Июль 2021 — Сентябрь 2023 года", 
    description: [" Системный администратор",
                 "- Прием и регистрация обращений пользователей Компании (телефон, электронная почта).",
                 "- Удаленная поддержка пользователей по вопросам работы корпоративных информационных систем",
                 "- ОС Windows, пакет Microsoft Office, антивирусы, архиваторы, "]
                 ),
  ExperienceInfo(
    company: "ООО Квант", 
    timeline: "Май 2020 — Апрель 2021 год", 
    description: ["Технический директор",
                 "- Управление технической службой компании, разработка и контроль выполнения текущих задач.", 
                 "- Взаимодействие с заказчиками, подрядными организациями, ресурсоснабжающими организациями.", 
                 "- Обеспечение безаварийной эксплуатации инженерных систем и оборудования объектов."]
                 ),
  ExperienceInfo(
    company: "ООО Суперсоник", 
    timeline: "Январь 2020 — Май 2020 год", 
    description: ["Руководитель проекта по работе с клиентами",
                 "- Взаимодействие с корпоративными клиентами", 
                 "- сбор пожеланий по развитию проекта от пользователей",
                 "- контроль за запуском проекта у клиентов, сопровождение", 
                 "текущих клиентов в работе с программным обеспечением"
                 ]
                 ),
  ExperienceInfo(
    company: "ООО Кока Кола", 
    timeline: "Ноябрь 2016 — Август 2019", 
    description: ["Руководитель проекта по работе с клиентами",
                 "Прием и регистрация обращений пользователей", 
                 "- Поддержка пользователей по вопросам работы корпоративных информационных систем", 
                 "- (ОС Windows, пакет Microsoft Office, антивирусы, архиваторы, почтовый клиент Outlook, BAT и др), корпоративных средств связи.",
                 "- Обучение пользователей использованию программ и оборудования и написание соответствующих инструкций.",
                 "- Обновление платформ, баз и конфигураций 1С 7.7, 8,x.",
                 "- Обслуживание и конфигурация систем Windows Server 2003, 2008, 2012.",
                 "- Сборка и ремонт Различных конфигураций ПК под нужды пользователей.",
                 "- Установка различных программных продуктов в том числе клиент банков и сопровождающего ПО.",
                 "- Прокладка и настройка внутренних локальных сетей."
                 ]
                 ),
];
