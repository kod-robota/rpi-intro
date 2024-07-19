# Пример мигания светодиодом

В этом примере используем pin 18
```bash
#   приготавливает пин для работы с ним
echo "18" > /sys/class/gpio/export                  

# задает пину режим вывода (как pinMode в Ардуино)
echo "out" > /sys/class/gpio/gpio18/direction

# Устанавливает высокий уровень на пин 18 (аналог digitalWrite)
echo "1" > /sys/class/gpio/gpio18/value

# Устанавливает ybprbq уровень на пин 18 (аналог digitalWrite)
echo "0" > /sys/class/gpio/gpio18/value
```

Для справки - чтение состояния пина (digitalRead)
```bash
echo "4" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio4/direction
cat /sys/class/gpio/gpio4/value
```

