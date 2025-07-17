-- 1. Мониторинг и управление аналоговыми сигналами
-- Задача: Написать скрипт, который проверяет аналоговый сигнал (например, температуру) и включает/выключает реле (дискретный выход), если значение выходит за допустимые пределы.
-- Пример кода:


local temp = io.readAnalog("AI1")  -- Чтение аналогового входа
local setpoint = 80.0
local hysteresis = 2.0

if temp > setpoint + hysteresis then
    io.writeDigital("DO1", true)  -- Включить реле
elseif temp < setpoint - hysteresis then
    io.writeDigital("DO1", false)  -- Выключить реле
end

-- 2. Логика управления насосами
-- Задача: Реализовать попеременное включение двух насосов, чтобы избежать износа одного устройства.
-- Пример кода:

local pump1 = "DO2"
local pump2 = "DO3"
local runtime_pump1 = system.getTag("Runtime_Pump1")  -- Время работы насоса 1
local runtime_pump2 = system.getTag("Runtime_Pump2")  -- Время работы насоса 2

if runtime_pump1 > runtime_pump2 then
    io.writeDigital(pump1, false)
    io.writeDigital(pump2, true)
else
    io.writeDigital(pump1, true)
    io.writeDigital(pump2, false)
end

-- 3. Простая аварийная сигнализация
-- Задача: При выходе значения за пределы нормы активировать аварийный сигнал и записывать событие в лог.
-- Пример кода:


local pressure = io.readAnalog("AI2")
local max_pressure = 10.0  -- Бар
local alarm_tag = "Alarm_HighPressure"

if pressure > max_pressure then
    system.setTag(alarm_tag, true)
    system.log("Внимание! Давление превышено: " .. pressure .. " бар")
else
    system.setTag(alarm_tag, false)
end

-- 4. Расчет среднего значения за период времени
-- Задача: Реализовать скользящее среднее значение аналогового сигнала за последние N секунд.
-- Пример кода:

local samples = {}
local max_samples = 60  -- 60 секунд (если обновление раз в секунду)

function updateAverage(value)
    table.insert(samples, 1, value)
    if #samples > max_samples then
        table.remove(samples)
    end
    local sum = 0
    for _, v in ipairs(samples) do
        sum = sum + v
    end
    return sum / #samples
end

local current_value = io.readAnalog("AI3")
local avg = updateAverage(current_value)
system.setTag("Average_Temp", avg)

-- 5. Управление по расписанию
-- Задача: Включать/выключать устройство (например, освещение) по расписанию.
-- Пример кода:


local current_time = os.date("*t")  -- Получаем текущее время
local light_tag = "DO4"

-- Включаем свет с 8:00 до 18:00
if current_time.hour >= 8 and current_time.hour < 18 then
    io.writeDigital(light_tag, true)
else
    io.writeDigital(light_tag, false)
end

-- 6. Обработка дискретных событий (кнопка + таймер)
-- Задача: При нажатии кнопки включать выход на заданное время (например, 5 секунд).
-- Пример кода:


local button = io.readDigital("DI1")
local output = "DO5"
local timer = system.getTag("Output_Timer")

if button and timer <= 0 then
    io.writeDigital(output, true)
    system.setTag("Output_Timer", 5)  -- 5 секунд
elseif timer > 0 then
    timer = timer - 1  -- Уменьшаем таймер
    system.setTag("Output_Timer", timer)
    if timer == 0 then
        io.writeDigital(output, false)
    end
end

-- 7. Взаимоблокировка (Interlock) для конвейеров
-- Задача: Запретить включение конвейера №2, если не работает конвейер №1.
-- Пример кода:


local conveyor1 = io.readDigital("DI2")  -- Датчик работы конвейера 1
local conveyor2_start_cmd = io.readDigital("DI3")  -- Кнопка запуска конвейера 2
local conveyor2_output = "DO6"

if conveyor2_start_cmd and conveyor1 then
    io.writeDigital(conveyor2_output, true)
else
    io.writeDigital(conveyor2_output, false)
end