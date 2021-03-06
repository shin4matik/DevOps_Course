# SoftServeInc DevOps crash course



<details><summary><b>Заняття 0. Вступ. Основи Git</b></summary>
<br/>
Зареєструйтеся на https://github.com/
Пройдіть тренування на https://lab.github.com/ під назвою Introduction to GitHub

Рекомендовано до прочитання:
https://git-scm.com/book/en/v2 до розділу 3. Git Branching включно

Додаткове:
https://roadmap.sh/devops
https://learngitbranching.js.org/
</details>

******


<details><summary><b>Заняття 1. Git</b></summary>
<br/>
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

</details>

******

<details>
<summary><b> Заняття 2. SSH. Git. OSI model</b></summary>
<br/>
https://youtu.be/QtcFYeDdiS8
</details>

******

<details>
<summary><b>Заняття 2.5. SSH. SCP</b></summary>
<br/>
https://youtu.be/fXSlzZCgCcs
</details>

******

<details>
<summary><b>Заняття 3. Linux CLI</b></summary>
<br/>
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

</details>

******

<details>
<summary><b>Заняття 3.5. More CMD</b></summary>
<br/>
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
</details>

****** 

<details>
<summary><b> Заняття 4. More CMD 2</b></summary>
<br/>
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
</details>

******

<details>
<summary><b>Заняття 5. VM & Server apps</b></summary>
<br/>
https://youtu.be/V_xQuJAzNjc


Домашнє завдання: LAMP+SSL

Література:
https://www.reddit.com/r/SQL/wiki/index
https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-18-04
</details>

******


<details>
<summary><b>Заняття 6. LAMP</b></summary>
<br/>
https://youtu.be/iDKVliYPdns

Load balancing
LAMP= LA+LM+LP

DNS
DNS-cache

/etc/hosts

192.168.1.152 	myexample.com //перенаправлення ігноруючи DNS

Listen ports:
lsof -i P -n
netstat -tulpn



Домашнє завдання:
Скрипт установки: LAMP+CMS (wordpress)


https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-20-04-with-a-lamp-stack 
</details>

******


<details>
<summary><b>Заняття 7. Docker</b></summary>
<br/>
https://youtu.be/OD9bU6enr98



ДЗ: розгляньте докер документацію
https://docs.docker.com/get-started/overview/
https://www.docker.com/resources/what-container

Теорія:
https://habr.com/ru/company/southbridge/blog/515508/
Туторіал:
https://habr.com/ru/company/ruvds/blog/438796/
</details>

******


<details>
<summary><b>Заняття 7.5. Wordpress with Docker</b></summary>
<br/>
https://youtu.be/lsySv4wyCtk

Теорія:
cat https://upcloud.com/community/tutorials/wordpress-with-docker/
</details>

******

<details>
<summary><b>Заняття 8. Docker 2</b></summary>
<br/>

https://youtu.be/hOXtvgFrSp4

### Приклади файлів:

#### Apache Dockerfile

```bash
FROM ubuntu:21.04
RUN apt-get update && apt-get install -y apache2 && apt-get clean && rm -rf /var/lib/apt/lists/*
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html

ENV APACHE_PID_FILE ???
ServerName


EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
```

#### Nginx Dockerfile - to fix

```bash
FROM ubuntu:21.04
RUN apt-get update
RUN apt-get install -y nginx
COPY index.html /usr/share/nginx/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
```

```html
index.html
<!doctype html>
<html>
  <head>
    <title>HELLO!</title>
  </head>
  <body>
    <p>Blah, blah. Blah, <strong>BLAH!</strong></p>
  </body>
</html>
```
</details>

******

<details>
<summary><b>Заняття 8.5. Orchestration (Kubernetes, Terraform, Docker Swarm, Docker Compose)</b></summary>
<br/>
https://youtu.be/aWDpfjNTfO0


https://github.com/dockersamples/example-voting-app
https://docs.docker.com/engine/swarm/ 
https://docs.docker.com/compose/ 
</details>

******


<details>
<summary><b> Заняття 9. Terraform +  AWS</b></summary>
<br/>
https://youtu.be/CH-mSjPdqmM


Реєстрація:
https://aws.amazon.com/
Зверніть увагу на меню Documentation та Learn

Конфігурація та ключі на AWS:
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html

https://www.terraform.io/
зкачуйте Cli та читайте документацію

Visual Studio Code
https://code.visualstudio.com/

Відео про початки тераформу та авс:
https://www.youtube.com/watch?v=SLB_c_ayRMo
</details>

******


<details>
<summary><b> Заняття 9.5. VPC (virtual private cloud)</b></summary>
<br/>
https://youtu.be/N0_UJskLJfU


### Networking
IPv4, netmask

CIDR block 
(public IP, private IP, netmask, subnet)

VLSM subnets
</details>

******



<details>
<summary><b> Заняття 10. Kubernetes (K8s)</b></summary>
<br/>
https://youtu.be/tsemPofi2aA



https://kubernetes.io/docs/tutorials/kubernetes-basics/ 
https://kubernetes.io/docs/tutorials/ 
https://www.youtube.com/watch?v=X48VuDVv0do 

AWS
https://www.youtube.com/watch?v=ulprqHHWlng 

</details>

******






