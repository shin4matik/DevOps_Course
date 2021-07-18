#!/bin/bash
#
#var
filecr=''
filedecr=''
namecr=''
keyid=''
mail=''
echo "**********************************"
echo "***** Асиметричне шифрування *****"
echo "**** за допомогою PGP (GnuPG) ****"
echo "**********************************"
echo "Виберіть дію >>"
select opt in 'Генерувати_ключі' 'Відправити_на_публічний_сервер' 'Закодувати_файл' 'Розкодувати_файл' 'Вихід'
do
	if [ "$opt" == 'Генерувати_ключі' ]; then
		gpg --gen-key
		echo "Виконано!********** "
		gpg --list-keys
		./crypt.sh		
		break
	elif [ "$opt" == 'Відправити_на_публічний_сервер' ]; then
		echo "Введіть ваш e-mail"
		read mail
		echo "Введіть ID ключа"
		read keyid
		gpg --keyserver pgp.mit.edu --send-key $keyid
		echo "Виконано!********** "
		./crypt.sh
		break
	elif [ "$opt" == 'Закодувати_файл' ]; then
		echo "Введіть ім'я файлу для закодування"
		read filecr
		echo "Введіть ім'я власника ключа"
		read namecr
		gpg -o encrypt-file.gpg -e -r $namecr $filecr
		echo "Виконано!********** "
		./crypt.sh
		break
	elif [ "$opt" == 'Розкодувати_файл' ]; then
                echo "Введіть ім'я файлу для розкодування"
                read filedecr
                gpg -o decrypt-file -d $filedecr
                echo "Виконано!********** "
                ./crypt.sh
                break
	elif [ "$opt" == 'Вихід' ]; then
		break
	fi
done
