# SoftServeInc DevOps crash course

## Заняття 0. Вступ. Основи Git

Зареєструйтеся на https://github.com/
Пройдіть тренування на https://lab.github.com/ під назвою Introduction to GitHub

Рекомендовано до прочитання:
https://git-scm.com/book/en/v2 до розділу 3. Git Branching включно

Додаткове:
https://roadmap.sh/devops
https://learngitbranching.js.org/



## Заняття 1. Git
Встановлення Linux
Основні поняття системи контролю версій
Підключення до серверу Git за допомого SSH


Домашнє завдання:
1. Встановіть дистрибутив лінукс для подальшого використання(virtualbox, wmware, окрема інсталяція, можна unix чи mac)
2. Читати документ по git далі (рекомендовано розділ 4) https://git-scm.com/book/en/v2
3. Створити репозитарій на github, підключитися до нього за допомогою ключа SSH, створити кілька гілок на репозитарії та спробувати їх з'єднати:
master->branch1->branch2
зробити коміти в мастер та гілки
merge branch2 to branch1, merge branch1 to master
спробуйте спричинити merge conflict та розв'язати його

Рекомендовані відео по темі:
https://www.youtube.com/watch?v=DVRQoVRzMIY
https://www.youtube.com/watch?v=P6jD966jzlk
https://www.youtube.com/watch?v=0SJCYPsef54



## Заняття 2. SSH. Git. OSI model
https://youtu.be/QtcFYeDdiS8
 

## Заняття 2.5. SSH. SCP
https://youtu.be/fXSlzZCgCcs




## Заняття 3. Linux CLI
https://youtu.be/B0iS-Lk9UE4

список команд:
ls
pwd
clear
cd
pushd popd
file
locate - database >>> sudo updatedb
find
which
history - 1000 lines, histsize histfilesize
whatis
apropos
man
mkdir
touch
cp
mv  !
rm  !!!  * ?
rmdir
cat >> file   cat 1 2 > 3 concatenate
more less - space and q,  >> uparrow downarrow / search q space
nano
vim  !!!

REDIRECTION
>      ls -al / > lsout.txt
>>
 |    history | less
 
 
echo 
sudo -- sudo -s not sudo su ( to not activate root user accidentaly )
su !!! do not user
users
who
id

+++
chmod
chown



## Заняття 3.5
https://youtu.be/6y0zAfY4MKU

watch
free -h    df -h
killall
exit Ctrl+D
CtrlShift++--
ps aux
top
grep
kill

set   set | less - environment
printenv

files:
.bashrc
.bash_history
.bash_logout
.profile

. as read command

alias
\ls - bypass alias

Домашнє - розгляньте $PATH, Напишіть свій скрипт, пушніть скрипт у гіт (скрипт повинен спрацювати при зкачуванні на інший убунту хост).
 


## Заняття 4. 
https://youtu.be/YGcPuWzmJ-s

Команди:

wc
uniq
sort
diff
grep, cut and awk(mawk - AWK programming language)
ls -l | awk '{print $2, $1}'
https://www.google.com/search?q=awk+examples


head tail -f
~ expansion or substitution
* expansion
$(( )) arithmetic expansion
parameter expansion
command expansion

text{var1,var2,var3}text    {1..5} {a..z} {01..09}  {5..1}  a{A{1,2},B{1,2}}b brace expansion or substitution             " " > "text" {v1,v2,v3} / "text"{v1,v2,v3}
mkdir {2011..2021}-{01-12}

escape \\ \$
&& ||

"" ignore -- word split, parameter exp ~ exp {} exp      not ignore -- command and parameter exp $() ${}  arithmetic exp $(())
'' all expansion are suppressed

echo $(date)  old syntax echo date    command expansion or substitution

Література:
http://igorka.com.ua/kursy-linux/
https://linuxcommand.org/tlcl.php










