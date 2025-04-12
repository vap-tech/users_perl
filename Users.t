#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use Test::Exception;

use Users;

# Case 1
ok(Users->new(user_id => 1, email => 'v.petrenko@nic.ru', name => 'Vitalii Petrenko'),
    'Экземпляр успешно создан');

# Case 2
throws_ok { Users->new(email => 'v.petrenko@nic.ru') } qr/Missing required field/,
    'Исключение при отсутствии обязательного поля';

# Case 3
throws_ok { Users->new(user_id => 1, email => 'v.petrenko-nic', name => 'Vitalii Petrenko') }
    qr/Invalid email format/, 'Исключение при неверном формате email';

# Case 4
is(Users->new(user_id => 1, email => 'V.PETRENKO@NIC.RU', name => 'Vitalii Petrenko')->get_email(),
    'email => v.petrenko@nic.ru', 'метод get_email вернул корректный email в нижнем регистре');

done_testing;


