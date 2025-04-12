package Users;

use strict;
use warnings;
use Carp qw(croak);

# Конструктор
sub new {
    my ($class, %args) = @_;

    # Проверка обязательных полей
    for my $field (qw(user_id email name)) {
        croak "Missing required field '$field'" unless exists $args{$field};
    }

    # Валидируем email
    if (!__validate_email($args{email})) {
        croak "Invalid email format";
    }

    return bless { %args }, $class;
}

# Метод для получения email в нижнем регистре
sub get_email {
    my ($self) = @_;
    return "email => " . lc($self->{email});
}

# Приватный метод для валидации email
sub __validate_email {
    my ($email) = @_;

    # Убираем лишние пробелы
    $email =~ s/^\s+|\s+$//g;

    # Проверяем наличие символа '@'
    return 0 unless $email =~ /@/;

    return 1;
}

1;

__END__

Perl-модуль, содержащий класс User с полями user_id, email и name.
В модуле реализован метод-конструктор объекта данного класса
и метод выводящий email юзера в формате “email => $email”,
где $email - это email юзера в lowercase.
email валидируется на наличие символа @ и пустых символов (whitespace),
без прохождения валидации не допускается создание объекта и возвращается ошибка.
Валидатор вынесен в отдельный приватный метод.
