# users_perl


Perl-модуль, содержащий класс User с полями user_id, email и name.
В модуле реализован метод-конструктор объекта данного класса 
и метод выводящий email юзера в формате “email => $email”,
где $email - это email юзера в lowercase. 
email валидируется на наличие символа @ и пустых символов (whitespace),
без прохождения валидации не допускается создание объекта и возвращается ошибка.
Валидатор вынесен в отдельный приватный метод.


### to tests

perl -I ./ Users.t