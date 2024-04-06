import requests

with open('test_code.py', 'r') as f:
    code = f.read()
    test_cases = """
test_cases = [
    (1, 2),
    (2, 3),
    (3, 4)
]
results = [3, 5, 7]
res = []
fails = []
for i, test_case in enumerate(test_cases):
    if add(*test_case) == results[i]:
        res.append(True)
    else:
        res.append(False)
        fails.append(test_case)
print(res, end = '')"""
    data = f"""
{code}
{test_cases}
"""
    response = requests.post('http://localhost:3000/runcode', json={'code': data})
    print(response.text)