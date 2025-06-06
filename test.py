# Sample vulnerable code (test.py)
def login(username, password):
    query = f"SELECT * FROM users WHERE user='{username}' AND pass='{password}'"
    return db.execute(query)
