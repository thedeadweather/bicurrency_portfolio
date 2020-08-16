Бивалютный портфель
======

Учебная консольная программа, позволяющая хранить рублевые и долларовые сбережения  
в процентном соотношении 50/50.  
___

Программа берет официальный курс валют в виде xml данных с сайта Центробанка.  
Затем просто вводим имеющиеся доллары и рубли, и программа покажет какую валюту и в каком количестве нужно обменять,
чтобы валютные портфели были равны, либо оповестит, что менять ничего не нужно тк портфели уже равны.  
Пример ипользования:  
```
Сегоняшний курс доллара: 73.21

Сколько у вас рублей?
12345
Сколько у вас долларов?
678
вам надо продать 254.69 $
```
___

Программа написана на Ruby  
Для запуска необходимо перейти в терминале в каталог с программой и запустить ее следующей командой:
```
$ ruby dual_case.rb
```
___

В случае отстутствия соединения в прогромма выдаст исключение и позволит ввести курс валют самостоятельно.  
Программа создана в рамках учебного проекта ["Хороший программист"](https://goodprogrammer.ru)
