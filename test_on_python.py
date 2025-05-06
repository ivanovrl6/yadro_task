
def calculate(a, b, c, d):
    return (((a - b) * (1 + 3 * c) - 4 * d) / 2)

# Тестовые данные: список кортежей (a, b, c, d, ожидаемый результат)
test_cases = [
    (1, 1, 1, 1, -2),     # ((1-1)*(1+3)-4)/2 = -2
    (4, 3, 3, 1, 3),       # ((4-3)*(1+9)-4)/2
    (0, 0, 0, 0, 0),       # Все нули
    (-1, -1, -1, -1, 2),   # ((-1+1)*(1-3)+4)/2 = 2
    (100, 50, 0, 25, -25)  # ((100-50)*1-100)/2 = -25
]
print("="*40)

for i, (a, b, c, d, expected) in enumerate(test_cases, 1):
    result = calculate(a, b, c, d)
    status = "Пройден" if result == expected else "Не пройден"
    
    print(f"Тест {i}: a={a}, b={b}, c={c}, d={d}")
    print(f"Ожидаемый результат: {expected}")
    print(f"Фактический результат: {result}")
    print(f"Статус: {status}")
    print("-"*40)

print("="*40)
print("Верификация завершена!")
